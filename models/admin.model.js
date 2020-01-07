const db = require('../utils/db');

module.exports = {
  getListCategory() {return db.load('SELECT c.id as id, c.NAME as name, c.DESCRIPTION as details, COUNT(p.id) as length FROM category c left join product p ON p.category = c.id GROUP BY c.id')},
  getNumProduct(cat) {return db.load("SELECT COUNT(p.id) as length FROM category c left join product p ON p.category = c.id   WHERE  c.id ='" + cat + "'GROUP BY c.id")},
  deleteCategory(id) {return db.load("DELETE FROM category WHERE id = "+id)},
  insertCategory(name, description) {return db.load("INSERT INTO category ( name , DESCRIPTION ) values ('"+name+"','"+description+"')")},
  editCategory(id, name, info) {return db.load("UPDATE category SET "+name+" = '"+info+"' where id = "+id )},
  getListUser() {return db.load('SELECT id, name, username, password, phone FROM user')},
  insertUser(name, username, password) {return db.load("INSERT INTO user( name, username, password) values ('"+name+"','"+username+"','"+password+"')")},
  editUser(id, name, info) {return db.load("UPDATE user SET "+name+" = '"+info+"' where id = "+id )},
  getListRequest() {return db.load("SELECT r.bidder_id as id, u.username as username FROM request r, user u where r.bidder_id = u.id")},
  acceptRequest(id) {db.load("UPDATE user SET role = 1 where id = "+id);
  					 db.load("DELETE FROM request WHERE bidder_id = "+id);
  					 return true},
  rejectRequest(id) {return db.load ("DELETE FROM request WHERE bidder_id = "+id);}
}
