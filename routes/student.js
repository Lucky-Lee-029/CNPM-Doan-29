var express = require('express');
const studentModel = require('../models/student.model');
var router = express.Router();
var session = require('express-session')
var passport = require('passport');
var bcrypt = require('bcryptjs');
var moment = require('moment');

//Detail product-view page
router.get('/detail-product', async(req, res, next) => {
   const user=req.session.user;
  const id = String(req.query.id);
  const categoryList = await studentModel.getListCategory();
  var filter = String(req.query.filter);
  if (filter == 'undefined') filter = 'name';
  console.log("day ne "+ id);
  var result = await studentModel.getProductbyID(id);
    const one = JSON.parse(JSON.stringify(result))[0];
  result = await studentModel.getOwnerbyID(id);  
    const seller = JSON.parse(JSON.stringify(result))[0];
    var items = await studentModel.getRelateItembyID(id);
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
  var history = await studentModel.getHistory(id);
    var json = await studentModel.getTotalLike(user.id);
    var totalLike =  JSON.parse(JSON.stringify(json))[0];
    var result = await studentModel.getTotalDislike(user.id);
    var totalDislike =  JSON.parse(JSON.stringify(result))[0];
    var temp = totalLike.totalLike + totalDislike.totalDisLike;
    var point =  totalLike.totalLike + "/" +  temp;
    var percentLike = (totalLike.totalLike/temp)*100;
    var percentDislike = 100-percentLike;
    res.render('student-views/detail-product', { 
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


//List of product page
router.get('/list-view/:page', async(req, res, next) => {
    var user = req.session.user;
    var catID = String(req.query.category);
    var search = String(req.query.search);
    if (search == 'undefined') search = 'name';
    const categoryList = await studentModel.getListCategory();
    var dataPerPage = 12;
    var page = req.params.page || 1;
    var skip = dataPerPage*(page - 1);
    switch(catID)
    {
        case 'laptop':
            catID = 4;
            var items = await studentModel.getProductbyCategory(catID, dataPerPage, skip);
            var result = await studentModel.getInfoCategory(catID);
            var category = JSON.parse(JSON.stringify(result))[0];
            break;
        case 'smartphone':
            catID= 5;
            var items = await studentModel.getProductbyCategory(catID, dataPerPage, skip);
            var result = await studentModel.getInfoCategory(catID);
            var category = JSON.parse(JSON.stringify(result))[0];
            break;
        case 'all':
            var items =  await studentModel.getAllProduct(dataPerPage, skip);
            var numPro = await studentModel.getNumProduct();
            var json = JSON.parse(JSON.stringify(numPro));
            var category = {name: 'Tất cả khóa học', description: 'Tất cả các khóa học hiện có', length: json[0].num};
            break;
        default:
            var items = await studentModel.getProductbyCategory(catID, dataPerPage, skip);
            var result = await studentModel.getInfoCategory(catID);
            var category = JSON.parse(JSON.stringify(result))[0];
    }
  var recent = 3600;
    res.render('guest-views/list-view', { 
        user: user,
        category: category,
        filter: search,
        list: items,
        catList: categoryList,
        catID: catID,
        current: page,
        pages: Math.ceil(category.length/dataPerPage),
    recent: recent,
    logged: req.isLogged
    });
});

router.post('/student-wonproduct/reviewLike', async (req, res, next) => {
    const user = req.session.user;
    var idSeller = req.body.id_seller;
    var review = req.body.review;
    var status = req.body.status;
    console.log("review ne");
    console.log(idSeller);
    console.log(review);
    console.log(status);
    var now = moment().format("YYYY-MM-DD HH:mm:ss");
    var result = await studentModel.insertReview(idSeller, user.id, review, now, status);
    res.send('true');
});

router.post('/student-wonproduct/reviewDislike', async (req, res, next) => {
    const user = req.session.user;
    var idSeller = String(req.body.id_seller);
    var review = String(req.body.review);
    var status = String(req.body.status);
    console.log("review ne");
    console.log(idSeller);
    console.log(review);
    console.log(status);
    var now = moment().format("YYYY-MM-DD HH:mm:ss");
    var result = await studentModel.insertReview(idSeller, user.id, review, now, status);
    res.send('true');
});

//bidding product   
router.get('/student-bidding/:page', async (req, res, next) => {
    var user = req.session.user;
    const category = await studentModel.getListCategory();
    console.log("tui here");
    console.log(req.session.user);
    console.log(user.id);
    var filter = 'name';
    var dataPerPage = 9;
    var page = req.params.page || 1;
    var skip = dataPerPage * (page - 1);
    json = await studentModel.getTotalLike(user.id);
    var totalLike = JSON.parse(JSON.stringify(json))[0];
    var result = await studentModel.getTotalDislike(user.id);
    var totalDislike = JSON.parse(JSON.stringify(result))[0];
    var temp = totalLike.totalLike + totalDislike.totalDisLike;
    var point = totalLike.totalLike + "/" + temp;
    var percentLike = (totalLike.totalLike / temp) * 100;
    var percentDislike = 100 - percentLike;
    var item = await studentModel.getBiddingList(user.id, dataPerPage, skip);
    var temp1 = await studentModel.getLengthBiddingList(user.id);
    var length = JSON.parse(JSON.stringify(temp1))[0];
    console.log(dataPerPage);
    console.log(page);
    console.log(length.length);
    var filter = 'name';
    res.render('student-views/student-bidding', {
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
        pages: Math.ceil(length.length / dataPerPage),
        logged: req.isLogged
    });
});



router.get('/student-detail-product/', async (req, res) => {
    const user = req.session.user;
    const id = String(req.query.id);
    console.log("tui ne " + id);
    const categoryList = await studentModel.getListCategory();
    var filter = String(req.query.filter);
    if (filter == 'undefined') filter = 'name';
    var result = await studentModel.getProductbyID(id);
    const one = JSON.parse(JSON.stringify(result))[0];
    result = await studentModel.getOwnerbyID(id);
    const seller = JSON.parse(JSON.stringify(result))[0];
    var items = await studentModel.getRelateItembyID(id);
    var now = moment();
    var start = one.dateStart;
    var end = one.dateEnd;
    one.dayStart = now.diff(start, 'days');
    one.hourStart = now.diff(start, 'hours'); - one.dayStart * 24;
    one.minStart = now.diff(start, 'minutes') - one.hourStart * 60 - one.dayStart * 24 * 60;
    one.dayEnd = -now.diff(end, 'days');
    one.hourEnd = -now.diff(end, 'hours') - one.dayEnd * 24;
    one.minEnd = -now.diff(end, 'minutes') - one.hourEnd * 60 - one.dayEnd * 24 * 60;
    var nextStep = one.price + one.bidStep;
    var history = await studentModel.getHistory(id);
    var json = await studentModel.getTotalLike(user.id);
    var totalLike = JSON.parse(JSON.stringify(json))[0];
    var result = await studentModel.getTotalDislike(user.id);
    var totalDislike = JSON.parse(JSON.stringify(result))[0];
    var temp = totalLike.totalLike + totalDislike.totalDisLike;
    var point = totalLike.totalLike + "/" + temp;
    var percentLike = (totalLike.totalLike / temp) * 100;
    var percentDislike = 100 - percentLike;
    res.render('student-views/student-detail-product', {
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


router.post('/student-detail-product/Bid', async (req, res) => {
    const user = req.session.user;
    const productId = String(req.body.productId);
    const price = String(req.body.price);
    console.log(price + " gui roi ne " + productId);
    var temp1 = await studentModel.getProductbyID(productId);
    var product = JSON.parse(JSON.stringify(temp1))[0];
    console.log(product);
    var json = await studentModel.getTotalLike(user.id);
    var totalLike = JSON.parse(JSON.stringify(json))[0];
    var result = await studentModel.getTotalDislike(user.id);
    var totalDislike = JSON.parse(JSON.stringify(result))[0];
    var temp = totalLike.totalLike + totalDislike.totalDisLike;
    var point;
    var now = moment().format("YYYY-MM-DD HH:mm:ss");
    console.log(now);
    if (temp == 0)
        point = 0
    else
        point = (totalLike.totalLike / temp) * 100;
    console.log("diem" + point);
    if (product.auctioned == 0) {
        if (point >= 80 || point == 0) {
            if (price > product.price) {
                product.auctionTime += 1;
                console.log(price);
                console.log(product.price);
                var update = await studentModel.BidProduct(user.id, productId, price, product.auctionTime);
                var biding = await studentModel.updateBiddingList(user.id, productId, price, now);
                res.send('true');
                res.redirect('/student/student-detail-product/?id=' + productId);
            } else {
                res.send('falsePrice');
            }

        } else {
            res.send('false');
        }
    } else {
        res.send('auctioned');
    }



});

router.post('/student-detail-product/buynow', async (req, res) => {
    const user = req.session.user;
    const productId = String(req.body.productId);
    console.log(" gui roi buynow " + productId);
    var temp1 = await studentModel.getProductbyID(productId);
    var product = JSON.parse(JSON.stringify(temp1))[0];
    console.log(product);
    var now = moment().format("YYYY-MM-DD HH:mm:ss");
    console.log(now);
    if (product.auctioned == 0) {

        product.auctionTime += 1;
        console.log(product.price);
        var update = await studentModel.BuyNowProduct(user.id, productId, product.buynow, product.auctionTime);
        var biding = await studentModel.updateBiddingList(user.id, productId, product.buynow, now);
        res.send('true');
        res.redirect('/student/student-detail-product/?id=' + productId);

    } else {
        res.send('auctioned');
    }



});


router.post('/student-bidding/request', async (req, res) => {
    var userReq = req.session.user;
    var json = await studentModel.getCountRequestToSeller(userReq.id);

    var count = JSON.parse(JSON.stringify(json))[0];
    console.log(count.count);
    if (count.count < 1) {
        var insert = await studentModel.addRequestToSeller(userReq.id);
        res.send('true');
    } else {
        res.send('false');
    }
});

router.post('/student-wonproduct/request', async (req, res) => {
    var userReq = req.session.user;
    var json = await studentModel.getCountRequestToSeller(userReq.id);

    var count = JSON.parse(JSON.stringify(json))[0];
    console.log(count.count);
    if (count.count < 1) {
        var insert = await studentModel.addRequestToSeller(userReq.id);
        res.send('true');
    } else {
        res.send('false');
    }
});

router.post('/student-review/request', async (req, res) => {
    var userReq = req.session.user;
    var json = await studentModel.getCountRequestToSeller(userReq.id);

    var count = JSON.parse(JSON.stringify(json))[0];
    console.log(count.count);
    if (count.count < 1) {
        var insert = await studentModel.addRequestToSeller(userReq.id);
        res.send('true');
    } else {
        res.send('false');
    }
});

router.post('/student-watchlist/request', async (req, res) => {
    var userReq = req.session.user;
    var json = await studentModel.getCountRequestToSeller(userReq.id);

    var count = JSON.parse(JSON.stringify(json))[0];
    console.log(count.count);
    if (count.count < 1) {
        var insert = await studentModel.addRequestToSeller(userReq.id);
        res.send('true');
    } else {
        res.send('false');
    }
});

router.post('/student-detail-product/addWatchList', async (req, res) => {
    var user = req.session.user;
    console.log(user);
    var productId = String(req.body.productId);
    console.log(productId);
    var json = await studentModel.getCountWatchListProduct(user.id, productId);
    var count = JSON.parse(JSON.stringify(json))[0];
    console.log("tui o day" + count.count);
    if (count.count < 1) {
        var insert = await studentModel.addWatchList(user.id, productId);
        res.send('true');
    } else {
        res.send('false');
    }
});

router.post('/student-watchlist/addWatchList', async (req, res) => {
    var user = req.session.user;
    console.log(user);
    var productId = String(req.body.productId);
    var json = await studentModel.getCountWatchListProduct(user.id, productId);
    var count = JSON.parse(JSON.stringify(json))[0];
    console.log("watch list add" + count.count);
    if (count.count < 1) {
        var insert = await studentModel.addWatchList(user.id, productId);
        res.send('true');
    } else {
        res.send('false');
    }
});

router.post('/student-bidding/addWatchList', async (req, res) => {
    var user = req.session.user;
    console.log(user);
    var productId = String(req.body.productId);
    var json = await studentModel.getCountWatchListProduct(user.id, productId);
    var count = JSON.parse(JSON.stringify(json))[0];
    console.log("watch list add" + count.count);
    if (count.count < 1) {
        var insert = await studentModel.addWatchList(user.id, productId);
        res.send('true');
    } else {
        res.send('false');
    }
});

router.post('/student-wonproduct/addWatchList', async (req, res) => {
    var user = req.session.user;
    console.log(user);
    var productId = String(req.body.productId);
    var json = await studentModel.getCountWatchListProduct(user.id, productId);
    var count = JSON.parse(JSON.stringify(json))[0];
    console.log("watch list add" + count.count);
    if (count.count < 1) {
        var insert = await studentModel.addWatchList(user.id, productId);
        res.send('true');
    } else {
        res.send('false');
    }
});

router.post('/student-review/addWatchList', async (req, res) => {
    var user = req.session.user;
    console.log(user);
    var productId = String(req.body.productId);
    var json = await studentModel.getCountWatchListProduct(user.id, productId);
    var count = JSON.parse(JSON.stringify(json))[0];
    console.log("watch list add" + count.count);
    if (count.count < 1) {
        var insert = await studentModel.addWatchList(user.id, productId);
        res.send('true');
    } else {
        res.send('false');
    }
});

router.get('/student-watchlist/:page', async (req, res, next) => {
    var user = req.session.user;
    const category = await studentModel.getListCategory();
    console.log("tui here");
    console.log(req.session.user);
    console.log(user.id);
    var filter = 'name';
    var dataPerPage = 9;
    var page = req.params.page || 1;
    var skip = dataPerPage * (page - 1);
    json = await studentModel.getTotalLike(user.id);
    var totalLike = JSON.parse(JSON.stringify(json))[0];
    var result = await studentModel.getTotalDislike(user.id);
    var totalDislike = JSON.parse(JSON.stringify(result))[0];
    var temp = totalLike.totalLike + totalDislike.totalDisLike;
    var point = totalLike.totalLike + "/" + temp;
    var percentLike = (totalLike.totalLike / temp) * 100;
    var percentDislike = 100 - percentLike;
    console.log(dataPerPage);
    console.log(page);
    console.log(skip);
    var item = await studentModel.getWatchList(user.id, dataPerPage, skip);
    var temp1 = await studentModel.getLengthWatchList(user.id);
    var length = JSON.parse(JSON.stringify(temp1))[0];
    res.render('student-views/student-watchlist', {
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
        pages: Math.ceil(length.length / dataPerPage),
        logged: req.isLogged
    });
});

router.get('/student-wonproduct/:page', async (req, res, next) => {
    var user = req.session.user;
    const category = await studentModel.getListCategory();
    console.log("tui here");
    console.log(req.session.user);
    console.log(user.id);
    var filter = 'name';
    var dataPerPage = 9;
    var page = req.params.page || 1;
    var skip = dataPerPage * (page - 1);
    json = await studentModel.getTotalLike(user.id);
    var totalLike = JSON.parse(JSON.stringify(json))[0];
    var result = await studentModel.getTotalDislike(user.id);
    var totalDislike = JSON.parse(JSON.stringify(result))[0];
    var temp = totalLike.totalLike + totalDislike.totalDisLike;
    var point = totalLike.totalLike + "/" + temp;
    var percentLike = (totalLike.totalLike / temp) * 100;
    var percentDislike = 100 - percentLike;
    var item = await studentModel.getWonProductList(user.id, dataPerPage, skip);
    var temp1 = await studentModel.getLengthWonProductList(user.id);
    var length = JSON.parse(JSON.stringify(temp1))[0];
    console.log(dataPerPage);
    console.log(page);
    console.log(skip);
    var filter = 'name';
    res.render('student-views/student-wonproduct', {
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
        pages: Math.ceil(length.length / dataPerPage),
        logged: req.isLogged
    });
});

router.get('/student-review/:page', async (req, res, next) => {
    var user = req.session.user;
    const category = await studentModel.getListCategory();
    console.log("tui here");
    console.log(req.session.user);
    console.log(user.id);
    var filter = 'name';
    var dataPerPage = 9;
    var page = req.params.page || 1;
    var skip = dataPerPage * (page - 1);
    json = await studentModel.getTotalLike(user.id);
    var totalLike = JSON.parse(JSON.stringify(json))[0];
    var result = await studentModel.getTotalDislike(user.id);
    var totalDislike = JSON.parse(JSON.stringify(result))[0];
    var temp = totalLike.totalLike + totalDislike.totalDisLike;
    var point = totalLike.totalLike + "/" + temp;
    var percentLike = (totalLike.totalLike / temp) * 100;
    var percentDislike = 100 - percentLike;
    var review = await studentModel.getReviewList(user.id, dataPerPage, skip);
    var temp1 = await studentModel.getLengthReviewList(user.id);
    var length = JSON.parse(JSON.stringify(temp1))[0];
    console.log(dataPerPage);
    console.log(page);
    console.log(skip);
    var filter = 'name';
    res.render('student-views/student-review', {
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
        pages: Math.ceil(length.length / dataPerPage),
        logged: req.isLogged
    });
});

router.get('/student-account-setting', async (req, res, next) => {
    var user = req.session.user;
    console.log("get account settign userId " + user.id);
    const category = await studentModel.getListCategory();
    var filter = 'name';
    res.render('student-views/student-account-setting', {
        catList: category,
        user: user,
        filter: filter,
        logged: req.isLogged
    });
});

router.post('/student-account-setting/updateInfo', async (req, res, next) => {
    var user = req.session.user;
    var name = req.body.name;
    var phone = req.body.phone;
    var email = req.body.email;
    var date = req.body.date;
    console.log("id here " + user.id);
    var dateUpdate = date.substring(6, 10) + '-' + date.substring(3, 5) + '-' + date.substring(0, 2)
    console.log("server" + name + "  " + phone + "  " + email + "  " + dateUpdate);
    var update = await studentModel.updateInfo(user.id, name, email, phone, dateUpdate);
    res.send('true');
    res.redirect('/student-watchlist/1');

});


router.post('/student-account-setting/updatePass', async (req, res, next) => {
    var user = req.session.user;
    var currentPass = req.body.currentPass;
    var newPass = req.body.newPass;
    var newPass2 = req.body.newPass;
    var json = await studentModel.getCurrentPass(user.id);
    var userPass = JSON.parse(JSON.stringify(json))[0];
    console.log("id here " + user.id);
    console.log("current pass" + currentPass);
    console.log("fr server" + userPass.password + "  " + currentPass + "  " + newPass + "  " + newPass2);
    if (bcrypt.compareSync(currentPass, userPass.password)) {
        if (newPass === newPass2) {
            newPass = bcrypt.hashSync(newPass, bcrypt.genSaltSync(10), null);
            var update = await studentModel.updatePass(user.id, newPass);
            res.send('0');
        } else {
            res.send('1');
        }
    } else
        res.send('2');

    res.redirect('/student-watchlist/1');

});
router.get('/student-my-class', async (req, res) => {
     var user = req.session.user;
    var id = req.session.user.id;
    var user = req.session.user;
    var filter = 'name';
    var items = await studentModel.myClass(id);
    const catList = await studentModel.getListCategory();
    var logged = true;
    res.render('student-views/student-my-class', {
        items,
        catList,
        logged,
        filter,
        user
    });
});
router.get('/student-my-class', async (req, res) => {
    var id = req.session.user.id;
    var user = req.session.user;
    var filter = 'name';
    var items = await studentModel.myClass(id);
    const catList = await studentModel.getListCategory();
    var logged = true;
    res.render('student-views/student-my-class', {
        items,
        catList,
        logged,
        filter,
        user
    });
})

router.get('/student-class', async (req, res) => {
    var id = req.session.user.id;
    var user = req.session.user;
    var filter = 'name';
    var items = await studentModel.allClass();
    const catList = await studentModel.getListCategory();
    var logged = true;
    res.render('student-views/student-class', {
        items,
        catList,
        logged,
        filter,
        user
    });
})
router.get('/student-history', async (req, res) => {
    var id = req.session.user.id;
    var user = req.session.user;
    var filter = 'name';
    var items = await studentModel.allClass();
    const catList = await studentModel.getListCategory();
    var logged = true;
    res.render('student-views/student-history', {
        items,
        catList,
        logged,
        filter,
        user
    });
})
router.get('/student-acount', async (req, res) => {
    var id = req.session.user.id;
    var user = req.session.user;
    var filter = 'name';
    var items = await studentModel.allClass();
    const catList = await studentModel.getListCategory();
    var logged = true;
    res.render('student-views/student-acount', {
        items,
        catList,
        logged,
        filter,
        user
    });
})

module.exports = router;