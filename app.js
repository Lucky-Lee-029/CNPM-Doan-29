var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var createError = require('http-errors');
var indexRouter = require('./routes/guest');
var adminRouter = require('./routes/admin');
var studentRouter = require('./routes/student');
var tutorRouter = require('./routes/tutor');
var flash = require('connect-flash');
var passport = require('passport');
var session = require('express-session');
var Recaptcha = require('express-recaptcha').RecaptchaV2;
const userModel = require('./models/user.model');
const guestModel = require('./models/guest.model');


var recaptcha = new Recaptcha('6Lf5cswUAAAAADGJaL_6T1teTwQRxjSRLV7Ia1TP', '6Lf5cswUAAAAAJOuMnedrEBVeGbTqQGI2iRoUCtX');
require('./config/passport')(passport);
var app = express();

app.use(session({ secret: "keyboard cat", resave: true, saveUninitialized: true }));

app.use(passport.initialize());
app.use(passport.session());
app.use(flash());

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

//Login page

app.get('/login', guestLoggedIn, recaptcha.middleware.render, async(req, res, next) => {
    const categoryList = await guestModel.getListCategory();
    console.log(req.isLogged);
    res.render('guest-views/login', {
        title: 'Login page',
        catList: categoryList,
        captcha: res.recaptcha,
        logged: req.isLogged
    });
});

app.post('/login', passport.authenticate('local-login', {
    successRedirect: '/logged',
    failureRedirect: '/login',
    failureFlash: true
}));

app.post('/login/check', async(req, res) => {
    var username = req.body.username;
    const users = await userModel.findUserByName(username);
    if (users.length) {
        res.send('already');
    }
})

app.post('/signup', recaptcha.middleware.verify, captchaVerification, passport.authenticate('local-signup', {
    successRedirect: '/profile', // Điều hướng tới trang hiển thị profile
    failureRedirect: '/signup', // Trở lại trang đăng ký nếu lỗi
    failureFlash: true
}));

app.get('/profile', isLoggedIn, async(req, res) => {

    const categoryList = await guestModel.getListCategory();
    if (req.session.user.role == 0) res.redirect('/student/student-my-class');
    if (req.session.user.role == 1) res.redirect('/tutor/tutor-watchlist/1');
});

app.get('/logged', isLoggedIn, async(req, res) => {

    const categoryList = await guestModel.getListCategory();
    req.session.user = req.session.passport.user;
    if (req.session.user.role == 0) res.redirect('/profile');
    if (req.session.user.role == 1) res.redirect('/profile');
});

app.get('/logout', function(req, res) {
    req.logout();
    res.redirect('/');
});
app.get('/auth/facebook', passport.authenticate('facebook', { scope: ['email'] }));
app.get('/auth/facebook/callback', passport.authenticate('facebook', {
    successRedirect: '/profile',
    failureRedirect: '/'
}));

function isLoggedIn(req, res, next) {
    if (req.isAuthenticated()) {
        req.isLogged = true;
        return next();
    } else
        res.redirect('/');
}

function isTutor(req, res, next) {
    if (req.session.user.role == 1) {
        return next();
    } else
        res.redirect('/');
}

function guestLoggedIn(req, res, next) {
    if (req.isAuthenticated()) {
        req.isLogged = true;
        return next();
    } else {
        req.isLogged = false;
        return next();
    }
}

function captchaVerification(req, res, next) {
    if (req.recaptcha.error) {
        req.flash('signupMessage', 'reCAPTCHA Incorrect');
        res.redirect('back');
    } else {
        return next();
    }
}
app.get('/admin/login', async(req, res, next) => {
const categoryList = await guestModel.getListCategory();
  res.render('admin-views/login', { 
    title: 'Login page',
    page_name: req.path,
	catList: categoryList,
	logged: false
  });
});
app.get('/admin/logged', isLoggedIn, async(req, res) => {

    const categoryList = await guestModel.getListCategory();
	console.log(req.session.passport.user);
    if (req.session.passport.user.role == 2) res.redirect('/admin/category');
	app
	{
		res.redirect('/login');
	}
});

app.post('/admin/login', passport.authenticate('local-login', {
    successRedirect: '/admin/logged',
    failureRedirect: '/admin/login',
    failureFlash: true
}));

app.get('/admin', async(req, res, next) => {
const categoryList = await guestModel.getListCategory();
  res.render('admin-views/login', { 
    title: 'Login page',
    page_name: req.path,
	catList: categoryList,
	logged: false,
  });
});
//Route
app.use('/student', isLoggedIn, studentRouter);
app.use('/admin', adminRouter);
app.use('/tutor', isLoggedIn, isTutor, tutorRouter);
app.use('/', guestLoggedIn, indexRouter);
// catch 404 and forward to error handler
app.use(function(req, res, next) {
    next(createError(404));
});
// error handler
app.use(function(err, req, res, next) {
    // set locals, only providing error in development
    res.locals.message = err.message;
    res.locals.error = req.app.get('env') === 'development' ? err : {};

    // render the error page
    res.status(err.status || 500);
    res.render('error');
});
module.exports = app;