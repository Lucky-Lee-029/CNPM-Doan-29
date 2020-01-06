const db = require('../utils/db');

var bcrypt = require("bcryptjs");

module.exports = {
  findUserByName(username) { return db.load("SELECT id, username, password, name, role FROM user WHERE username = '"+username+"'")},
  findUserById(id) { return db.load("SELECT id, username FROM user WHERE username = '"+id+"'")},
  insertUser(username, password, name) {return db.load("INSERT INTO user ( username, password, name ) values ('"+username+"','"+password+"','"+name+"')")}
};
