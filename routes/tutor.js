var express = require('express');
var router = express.Router();
var multer = require('multer');
const tutorModel = require('../models/tutor.model');
var fs = require('fs');
var moment = require('moment');
var mail = require('../utils/mail-server.js');


//Detail product-view page
router.get('/detail-product', async(req, res, next) => {
   const user=req.session.user;
  const id = String(req.query.id);
  const categoryList = await tutorModel.getListCategory();
  var filter = String(req.query.filter);
  if (filter == 'undefined') filter = 'name';
  console.log("day ne "+ id);
  var result = await tutorModel.getProductbyID(id);
    const one = JSON.parse(JSON.stringify(result))[0];
  result = await tutorModel.getOwnerbyID(id);  
    const seller = JSON.parse(JSON.stringify(result))[0];
    var items = await tutorModel.getRelateItembyID(id);
  var now = moment();
  var start = one.dateStart;
  var end = one.dateEnd;
  one.dayStart = now.diff(start,'days');
  one.hourStart = now.diff(start, 'hours') - one.dayStart*24;
  one.minStart = now.diff(start, 'minutes') - one.hourStart*60 - one.dayStart*24*60;
  one.dayEnd = -now.diff(end,'days');
  one.hourEnd = -now.diff(end, 'hours') - one.dayEnd*24;
  one.minEnd = -now.diff(end, 'minutes') - one.hourEnd*60 - one.dayEnd*24*60;
  var nextStep = one.price+one.bidStep; 
  var history = await tutorModel.getHistory(id);
    var json = await tutorModel.getTotalLike(user.id);
    var totalLike =  JSON.parse(JSON.stringify(json))[0];
    var result = await tutorModel.getTotalDislike(user.id);
    var totalDislike =  JSON.parse(JSON.stringify(result))[0];
    var temp = totalLike.totalLike + totalDislike.totalDisLike;
    var point =  totalLike.totalLike + "/" +  temp;
    var percentLike = (totalLike.totalLike/temp)*100;
    var percentDislike = 100-percentLike;
    res.render('tutor-views/detail-product', { 
        user: user,
        product: one,
        point: point,
        lists: history,
        nextStep: nextStep,
        catList: categoryList,
        own: seller,
        relateItems: items,
        filter: filter,
        logged: req.isLogged
    });
});

router.post('/detailproduct', async(req, res, next) => {
    const id = 64;
    var now = String(moment().format("dddd, MMMM Do YYYY"));
    var extraDetails = String(req.body.description);
    var json = await tutorModel.getoldDetailsbyId(id);
    var oldDetails = JSON.parse(JSON.stringify(json))[0];
    console.log(oldDetails);
    var newDetails = oldDetails.oldDetails + '<p class ="content">' + now + '</p> <p class = "content">' + extraDetails + "</p>";
    var updateDetails = await tutorModel.updateDetailsbyId(id, newDetails);
    res.redirect("/tutor/detail-product?id=" + id);
});



//Watch list product - seller page
router.get('/tutor-watchlist/:page', async(req, res, next) => {
 var user = req.session.user;
 const category = await tutorModel.getListCategory();
 console.log("tui here");
 console.log(req.session.user);
 console.log(user.id);
 var filter = 'name';
 var dataPerPage = 9;
 var page = req.params.page || 1;
 var skip = dataPerPage*(page - 1);
 json = await tutorModel.getTotalLike(user.id);
 var totalLike =  JSON.parse(JSON.stringify(json))[0];
 var result = await tutorModel.getTotalDislike(user.id);
 var totalDislike =  JSON.parse(JSON.stringify(result))[0];
 var temp = totalLike.totalLike + totalDislike.totalDisLike;
 var point =  totalLike.totalLike + "/" +  temp;
 var percentLike = (totalLike.totalLike/temp)*100;
 var percentDislike = 100-percentLike;
  console.log(dataPerPage);
 console.log(page);
 console.log(skip);
 var item = await tutorModel.getWatchList(user.id, dataPerPage, skip);
 var temp1 = await tutorModel.getLengthWatchList(user.id);
 var length =  JSON.parse(JSON.stringify(temp1))[0];
 res.render('tutor-views/tutor-watchlist', {
        catList: category,
        items: item,
        user: user,
        totalLike: totalLike, 
        totalDislike: totalDislike,
        point: point,
        filter: filter,
        percentLike: percentLike,
        percentDislike: percentDislike,
        current: page,
        pages: Math.ceil(length.length/dataPerPage),
        logged: req.isLogged
    });
});

//review - seller page
router.get('/tutor-review/:page', async(req, res, next) => {
   var user = req.session.user;
 const category = await tutorModel.getListCategory();
 console.log("tui here");
 console.log(req.session.user);
 console.log(user.id);
 var filter = 'name';
 var dataPerPage = 9;
 var page = req.params.page || 1;
 var skip = dataPerPage*(page - 1);
 json = await tutorModel.getTotalLike(user.id);
 var totalLike =  JSON.parse(JSON.stringify(json))[0];
 var result = await tutorModel.getTotalDislike(user.id);
 var totalDislike =  JSON.parse(JSON.stringify(result))[0];
 var temp = totalLike.totalLike + totalDislike.totalDisLike;
 var point =  totalLike.totalLike + "/" +  temp;
 var percentLike = (totalLike.totalLike/temp)*100;
 var percentDislike = 100-percentLike;
 var review = await tutorModel.getReviewList(user.id, dataPerPage, skip); 
 var temp1 = await tutorModel.getLengthReviewList(user.id);
 var length =  JSON.parse(JSON.stringify(temp1))[0];
 console.log(dataPerPage);
 console.log(page);
 console.log(skip);
 var filter = 'name';
 res.render('tutor-views/tutor-review', {
        catList: category,
        reviews: review,
        user: user,
        totalLike: totalLike, 
        totalDislike: totalDislike,
        point: point,
        filter: filter,
        percentLike: percentLike,
        percentDislike: percentDislike,
        current: page,
        pages: Math.ceil(length.length/dataPerPage),
        logged: req.isLogged
    });
});

//Bidding product - seller page
router.get('/tutor-myclass/:page', async(req, res, next) => {
    var user = req.session.user;
 const category = await tutorModel.getListCategory();
 console.log("tui here");
 console.log(req.session.user);
 console.log(user.id);
 var filter = 'name';
 var dataPerPage = 9;
 var page = req.params.page || 1;
 var skip = dataPerPage*(page - 1);
 json = await tutorModel.getTotalLike(user.id);
 var totalLike =  JSON.parse(JSON.stringify(json))[0];
 var result = await tutorModel.getTotalDislike(user.id);
 var totalDislike =  JSON.parse(JSON.stringify(result))[0];
 var temp = totalLike.totalLike + totalDislike.totalDisLike;
 var point =  totalLike.totalLike + "/" +  temp;
 var percentLike = (totalLike.totalLike/temp)*100;
 var percentDislike = 100-percentLike;
 var item = await tutorModel.getBiddingList(user.id, dataPerPage, skip);
 var temp1 = await tutorModel.getLengthBiddingList(user.id);
 var length =  JSON.parse(JSON.stringify(temp1))[0];
 console.log(dataPerPage);
 console.log(page);
 console.log(length.length);
 var filter = 'name';
 res.render('tutor-views/tutor-myclass', {
        catList: category,
        items: item,
        user: user,
        totalLike: totalLike, 
        totalDislike: totalDislike,
        point: point,
        filter: filter,
        percentLike: percentLike,
        percentDislike: percentDislike,
        current: page,
        pages: Math.ceil(length.length/dataPerPage),
        logged: req.isLogged
    });
});


//Post product
router.get('/tutor-postProduct', async(req, res, next) => {
    var user = req.session.user;
    const idU = user.id;
    var json = await tutorModel.getSellerbyID(idU);
    var user = JSON.parse(JSON.stringify(json))[0];
    json = await tutorModel.getTotalLike(idU);
    var totalLike = JSON.parse(JSON.stringify(json))[0];
    var result = await tutorModel.getTotalDislike(idU);
    var totalDislike = JSON.parse(JSON.stringify(result))[0];
    var temp = totalLike.totalLike + totalDislike.totalDisLike;
    var point = totalLike.totalLike + "/" + temp;
    var percentLike = (totalLike.totalLike / temp) * 100;
    var percentDislike = 100 - percentLike;
    const categoryList = await tutorModel.getListCategory();
    res.render('tutor-views/tutor-postProduct', {
        user: user,
        idU: idU,
        totalLike: totalLike,
        totalDislike: totalDislike,
        point: point,
        percentLike: percentLike,
        percentDislike: percentDislike,
        catList: categoryList,
        logged: req.isLogged
    });
});


module.exports = router;