const db = require('../utils/db');
var moment = require('moment');
module.exports = {
  faq() { return db.load('select * from faq') },
  topAuctionTime() { return db.load('SELECT p.name as name, current_price as price, p.id as id, p.details as detail, c.NAME as category, u.NAME as hold FROM product p, category c, user u where p.id_owner = u.id and p.category = c.id ORDER BY p.auctionTime DESC LIMIT 5')},
  topAuctionPrice() {return db.load('SELECT p.name as name, current_price as price, p.id as id, p.details as detail, c.NAME as category, u.NAME as hold FROM product p, category c, user u where p.id_owner = u.id and p.category = c.id ORDER BY current_price DESC LIMIT 5')},
  topDeAuctionPrice() {return db.load('SELECT p.name as name, current_price as price, p.id as id, p.details as detail, c.NAME as category, u.NAME as hold FROM product p, category c, user u where p.id_owner = u.id and p.category = c.id ORDER BY current_price ASC LIMIT 5')},
  topNearestAuction() {return db.load('SELECT p.name as name, current_price as price, p.id as id, p.details as detail, c.NAME as category, u.NAME as hold FROM product p, category c, user u where p.id_owner = u.id and p.category = c.id ORDER BY p.endDate DESC LIMIT 5')},
  getListCategory() {return db.load("SELECT c.id as ID, c.NAME as name FROM category c WHERE c.id != '4' AND c.id != '5'")},
  getInfoCategory(cat) {return db.load("SELECT c.NAME as name, c.DESCRIPTION as description, COUNT(p.id) as length FROM category c, product p  WHERE p.auctioned = 0 AND c.id ='" + cat + "'AND p.category = c.id GROUP BY c.id")},
  getProductbyCategory(cat, limit, offset) {return db.load("SELECT p.id as ID, p.name as name, u.name as hold, p.current_price as price, p.details as details, TIMESTAMPDIFF(SECOND, startDate,current_timestamp()) as postTime, c.NAME as category FROM category c, product p, user u  WHERE c.id ='" + cat + "'AND p.category = c.id AND u.id = p.id_bidder AND p.auctioned = 0 LIMIT " + limit + " OFFSET " + offset)},
  getAllProduct(limit, offset) {return db.load("SELECT p.id as ID, p.name as name, u.name as hold, p.current_price as price, p.details as details, TIMESTAMPDIFF(SECOND, startDate,current_timestamp()) as postTime, c.NAME as category FROM category c, product p, user u  WHERE p.category = c.id AND u.id = p.id_bidder AND p.auctioned = 0  LIMIT " + limit + " OFFSET " + offset)},
  getNumProduct() {return db.load('SELECT COUNT(*) as num FROM product WHERE auctioned = 0')},
  searchProductByName(input, limit, offset) {return db.load("SELECT p.id as ID, p.name as name, u.name as hold, p.current_price as price, p.details as details, TIMESTAMPDIFF(SECOND, startDate,current_timestamp()) as postTime, c.NAME as category FROM category c, product p, user u  WHERE p.category = c.id AND u.id = p.id_owner AND MATCH(p.name) AGAINST('"+input+"')  LIMIT " + limit + " OFFSET " + offset)},
  searchProductByCategory(input, limit, offset) {return db.load("SELECT p.id as ID, p.name as name, u.name as hold, p.current_price as price, p.details as details, TIMESTAMPDIFF(SECOND, startDate,current_timestamp()) as postTime, c.NAME as category FROM category c, product p, user u  WHERE p.category = c.id AND u.id = p.id_bidder AND p.auctioned = 0 AND MATCH(c.NAME) AGAINST('"+input+"')  LIMIT " + limit + " OFFSET " + offset)},
  getNumSeachByName(input) {return db.load("SELECT COUNT(*) as num FROM product WHERE auctioned = 0 AND MATCH(name) AGAINST('"+input+"')")},
  getNumSeachByCategory(input) {return db.load("SELECT COUNT(*) as num FROM category c, product p WHERE p.auctioned = 0 AND p.category = c.id AND MATCH(c.NAME) AGAINST('"+input+"')")},
  getProductbyID(id) {return db.load("SELECT p.name as name, p.current_price as price, p.buy_now_price as buynow, p.id as id, p.auctionTime as auctionTime, p.details as detail, p.startDate as dateStart, p.endDate as dateEnd, c.name as category, u.NAME as hold, u.username as bidRating, u.username as bidLink,  p.auctionTime as auctionTime FROM product p, category c, user u where p.id_bidder = u.id and p.category = c.id and p.id = "+id)},
  getOwnerbyID(id) {return db.load("SELECT u.name as name, u.username as email FROM user u, product p where p.id_owner = u.id AND p.id = "+id)},
  getRelateItembyID(id) {return db.load("SELECT p2.name as name, p2.id as id, p2.current_price as price FROM product p1, product p2 where p1.category = p2.category AND p1.id = "+id +" LIMIT 5")}
}
