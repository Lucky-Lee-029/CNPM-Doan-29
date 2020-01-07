var express = require('express');
const adminModel = require('../models/admin.model');
var cookieParser = require('cookie-parser');
var router = express.Router();
var bcrypt = require('bcryptjs');

router.get('/category/', async(req, res, next) => {
	console.log(req.path);
  const categoryList = await adminModel.getListCategory();
  res.render('admin-views/admin-category', { 
    title: 'Login page',
    list: categoryList,
    page_name: req.path
  });
});
router.post('/category/delete', async(req, res, next) => {
  var id = String(req.body.id);
  var result = await adminModel.getNumProduct(id);
  var num = JSON.parse(JSON.stringify(result))[0];
  console.log(num);
  if (num.length == 0)
  {
  	adminModel.deleteCategory(id);
  }  
});
router.post('/category/edit', async(req, res, next) => {
  var id = String(req.body.id);
  var column = String(req.body.column);
  var info = String(req.body.info);
  var result = await adminModel.editCategory(id,column,info);
});
router.post('/category/add', async(req, res, next) => {
  var name = String(req.body.name);
  var detail = String(req.body.description);
  var result = await adminModel.insertCategory(name,detail);
  res.redirect('back');
});
router.get('/view-user/', async(req, res, next) => {
  const userList = await adminModel.getListUser();
  res.render('admin-views/view-users', { 
    title: 'Login page',
    list: userList,
    page_name: req.path
  });
});
router.post('/view-user/edit', async(req, res, next) => {
	console.log('Im here');
  var id = String(req.body.id);
  var column = String(req.body.column);
  var info = String(req.body.info);
  var result = await adminModel.editUser(id,column,info);
});
router.post('/view-user/add', async(req, res, next) => {
  var name = String(req.body.name);
  var username = String(req.body.username);
  var password = bcrypt.hashSync(String(req.body.password), bcrypt.genSaltSync(10), null);
  var phone = String(req.body.phone);
  var result = await adminModel.insertUser(name,username,password,phone);
  res.redirect('back');
});
router.get('/view-request/', async(req, res, next) => {
  const request = await adminModel.getListRequest();
  res.render('admin-views/view-request', { 
    title: 'Login page',
    list: request,
    page_name: req.path
  });
});

router.post('/view-request/accept-request', async(req, res, next) => {
  var id = String(req.body.id);
  var result = await adminModel.acceptRequest(id);
});
router.post('/view-request/reject-request', async(req, res, next) => {
  var id = String(req.body.id);
  var result = await adminModel.rejectRequest(id);
});

module.exports = router;