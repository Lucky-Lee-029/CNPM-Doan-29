var LocalStrategy = require('passport-local').Strategy;
var FacebookStrategy = require('passport-facebook').Strategy;
var configAuth = require('./auth');

// load up the user model
var bcrypt = require('bcryptjs');
const userModel = require('../models/user.model');

module.exports = function(passport) {

    // required for persistent login sessions
    // passport needs ability to serialize and unserialize users out of session

    // used to serialize the user for the session
    passport.serializeUser(function(user, done) {
        done(null, user);
    });

    // used to deserialize the user
    passport.deserializeUser(async (id, done) => {
        try{
            var user = await userModel.findUserById(id);
            if (!user) {
            return done(new Error('user not found'));
            }
            done(null, user);
        }        
        catch(e) {done(e);}
    });

    passport.use('local-signup',
        new LocalStrategy({
                // by default, local strategy uses username and password, we will override with email
                usernameField: 'username',
                passwordField: 'password',
                passReqToCallback: true // allows us to pass back the entire request to the callback
            },
            async (req, username, password, done) => {
                try {
                    const users = await userModel.findUserByName(username);
                    if (users.length) {
                        return done(null, false, req.flash('signupMessage', 'That username is already taken.'));
                    } 
                    else {
                    // if there is no user with that username
                    // create the user
                    var newUser = {
                        username: username,
                        password: bcrypt.hashSync(password, bcrypt.genSaltSync(10), null) // use the generateHash function in our user model
                        };
                    }
                } 
                catch(e) {
                    return done(e);
                }
                newUser.name = req.body.name;
                var insert = await userModel.insertUser(newUser.username, newUser.password, newUser.name);
                newUser.id = insert.insertId;
                req.session.cookie.expires = false;
                return done(null, newUser);
                }
            ));

    passport.use('local-login',
        new LocalStrategy({
                // by default, local strategy uses username and password, we will override with email
                usernameField: 'username',
                passwordField: 'password',
                passReqToCallback: true // allows us to pass back the entire request to the callback
            },
            async (req, username, password, done) => { // callback with email and password from our form
                const users = await userModel.findUserByName(username);
                if (!users.length) {
                    return done(null, false, req.flash('loginMessage', 'No user found.')); // req.flash is the way to set flashdata using connect-flash
                }

                if (!bcrypt.compareSync(password, users[0].password))
                    return done(null, false, req.flash('loginMessage', 'Oops! Wrong password.')); // create the loginMessage and save it to session as flashdata

                // all is well, return successful user
                return done(null, users[0]);
            }));
    passport.use(new FacebookStrategy({
            clientID: configAuth.facebookAuth.clientID,
            clientSecret: configAuth.facebookAuth.clientSecret,
            callbackURL: configAuth.facebookAuth.callbackURL,
            profileFields: ['id','displayName','email','first_name','last_name','middle_name']
            },
            async (token, refreshToken, profile, done) => {
                console.log(profile);
                const user = await userModel.findUserById(profile.id);
                if (user.length){
                    return done(null, user);
                }
                else
                {
                    var password = '123123788';
                    var newUser = {
                        id: profile.id,
                        username: profile.id,
                        password: bcrypt.hashSync(password, bcrypt.genSaltSync(10), null)
                    };
                    var insert = await userModel.insertUser(newUser.username, newUser.password);
                    return done(null, newUser);
                }
            }));
};