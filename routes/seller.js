var express = require('express');
var router = express.Router();
var multer = require('multer');
const sellerModel = require('../models/seller.model.js');
var fs = require('fs');
var moment = require('moment');

var storage = multer.diskStorage({
    destination: async(req, file, callback) => {
        var json = await sellerModel.getmaxIdPro();
        var maxID = JSON.parse(JSON.stringify(json))[0].maxID;
        //lấy ra id lớn nhất hiện tại đem + 1 để tạo thư mục ảnh cho product
        var dir = __dirname.substring(0, __dirname.indexOf('\\routes')) + '\\public\\img\\product\\' + String(maxID + 1);

        // tạo đường dẫn để lưu hình, nhớ phải có thư mục product trước

        if (!fs.existsSync(dir))
            fs.mkdirSync(
                dir, {
                    recursive: true
                },
                (err) => {}
            );
        callback(null, dir);
        // nếu chưa có thư mục tên "id", tạo thư mục
    },
    filename: function(req, file, callback) {
        callback(null, file.originalname);
    }
});

var upload = multer({
    storage: storage
}); //tạo hàm upload file

//Profile page
router.get('/profile-seller', async(req, res, next) => {
    var user = req.session.user;
    const idU = user.id;
    var json = await sellerModel.getSellerbyID(idU);
    var user = JSON.parse(JSON.stringify(json))[0];
    json = await sellerModel.getTotalLike(idU);
    var totalLike = JSON.parse(JSON.stringify(json))[0];
    var result = await sellerModel.getTotalDislike(idU);
    var totalDislike = JSON.parse(JSON.stringify(result))[0];
    var temp = totalLike.totalLike + totalDislike.totalDisLike;
    var point = totalLike.totalLike + "/" + temp;
    var percentLike = (totalLike.totalLike / temp) * 100;
    var percentDislike = 100 - percentLike;
    const categoryList = await sellerModel.getListCategory();

    res.render('seller-layout/profile-seller', {
        catList: categoryList,
        user: user,
        idU: idU,
        totalLike: totalLike,
        totalDislike: totalDislike,
        point: point,
        percentLike: percentLike,
        percentDislike: percentDislike,
    });
});

//Detail product-view page
router.get('/detailsProduct-seller', async(req, res, next) => {
    var user = req.session.user;
    const idU = user.id;
    var history = await sellerModel.getHistorybyID(id);
    const categoryList = await sellerModel.getListCategory();
    var filter = String(req.query.filter);
    if (filter == 'undefined') filter = 'name';
    var result = await sellerModel.getProductbyID(id);
    const one = JSON.parse(JSON.stringify(result))[0];
    result = await sellerModel.getOwnerbyID(id);
    const own = JSON.parse(JSON.stringify(result))[0];
    res.render('seller-layout/detailsProduct-seller', {
        product: one,
        catList: categoryList,
        user: own,
        history: history,
        filter: filter,
        logged: req.isLogged
    });
});

//Auctioned product - seller page
router.get('/auctionedProduct-seller/:page', async(req, res, next) => {
    var user = req.session.user;
    const idU = user.id;
    var json = await sellerModel.getSellerbyID(idU);
    var user = JSON.parse(JSON.stringify(json))[0];
    json = await sellerModel.getTotalLike(idU);
    var totalLike = JSON.parse(JSON.stringify(json))[0];
    var result = await sellerModel.getTotalDislike(idU);
    var totalDislike = JSON.parse(JSON.stringify(result))[0];
    var temp = totalLike.totalLike + totalDislike.totalDisLike;
    var point = totalLike.totalLike + "/" + temp;
    var percentLike = (totalLike.totalLike / temp) * 100;
    var percentDislike = 100 - percentLike;
    const categoryList = await sellerModel.getListCategory();
    var page = req.params.page || 1;
    if (page < 1) page = 1;
    const offset = (page - 1) * 6;
    var items = await sellerModel.getListAuctionedProduct(idU, offset);
    var json = await sellerModel.countauctionedPro(idU);
    var length = JSON.parse(JSON.stringify(json))[0].total;



    res.render('seller-layout/auctioned-product-seller', {
        catList: categoryList,
        auctionedPro: items,
        user: user,
        idU: idU,
        totalLike: totalLike,
        totalDislike: totalDislike,
        point: point,
        percentLike: percentLike,
        percentDislike: percentDislike,
        reviewPro: items,
        current: page,
        length: length,
        pages: Math.floor(length / 6),
        logged: req.isLogged
    });
});


//Watch list product - seller page
router.get('/watchList-seller/:page', async(req, res, next) => {
    var user = req.session.user;
    const idU = user.id;
    var json = await sellerModel.getSellerbyID(idU);
    var user = JSON.parse(JSON.stringify(json))[0];
    json = await sellerModel.getTotalLike(idU);
    var totalLike = JSON.parse(JSON.stringify(json))[0];
    var result = await sellerModel.getTotalDislike(idU);
    var totalDislike = JSON.parse(JSON.stringify(result))[0];
    var temp = totalLike.totalLike + totalDislike.totalDisLike;
    var point = totalLike.totalLike + "/" + temp;
    var percentLike = (totalLike.totalLike / temp) * 100;
    var percentDislike = 100 - percentLike;
    const categoryList = await sellerModel.getListCategory();
    var page = req.params.page || 1;
    if (page < 1) page = 1;
    const offset = (page - 1) * 6;
    var items = await sellerModel.getwatchListbyID(idU, offset);
    var json = await sellerModel.countwatchListPro(idU);
    var length = JSON.parse(JSON.stringify(json))[0].total;

    res.render('seller-layout/watchList-seller', {
        user: user,
        idU: idU,
        totalLike: totalLike,
        totalDislike: totalDislike,
        point: point,
        percentLike: percentLike,
        percentDislike: percentDislike,
        modalPro: items,
        current: page,
        length: length,
        pages: Math.floor(length / 6),
        catList: categoryList,
        logged: req.isLogged
    });
});

//review - seller page
router.get('/review-seller/:page', async(req, res, next) => {
    var user = req.session.user;
    const idU = user.id;
    var json = await sellerModel.getSellerbyID(idU);
    var user = JSON.parse(JSON.stringify(json))[0];
    json = await sellerModel.getTotalLike(idU);
    var totalLike = JSON.parse(JSON.stringify(json))[0];
    var result = await sellerModel.getTotalDislike(idU);
    var totalDislike = JSON.parse(JSON.stringify(result))[0];
    var temp = totalLike.totalLike + totalDislike.totalDisLike;
    var point = totalLike.totalLike + "/" + temp;
    var percentLike = (totalLike.totalLike / temp) * 100;
    var percentDislike = 100 - percentLike;
    const categoryList = await sellerModel.getListCategory();
    var page = req.params.page || 1;
    if (page < 1) page = 1;
    const offset = (page - 1) * 6;
    var review = await sellerModel.getReview(idU, offset);
    var json = await sellerModel.countReview(idU);
    var length = JSON.parse(JSON.stringify(json))[0].total;
    res.render('seller-layout/review-seller', {
        user: user,
        idU: idU,
        totalLike: totalLike,
        totalDislike: totalDislike,
        point: point,
        percentLike: percentLike,
        percentDislike: percentDislike,
        review: review,
        current: page,
        length: length,
        pages: Math.floor(length / 6),
        catList: categoryList,
        logged: req.isLogged
    });
});

//Won product - seller page
router.get('/wonProduct-seller/:page', async(req, res, next) => {
    var user = req.session.user;
    const idU = user.id;
    var json = await sellerModel.getSellerbyID(idU);
    var user = JSON.parse(JSON.stringify(json))[0];
    json = await sellerModel.getTotalLike(idU);
    var totalLike = JSON.parse(JSON.stringify(json))[0];
    var result = await sellerModel.getTotalDislike(idU);
    var totalDislike = JSON.parse(JSON.stringify(result))[0];
    var temp = totalLike.totalLike + totalDislike.totalDisLike;
    var point = totalLike.totalLike + "/" + temp;
    var percentLike = (totalLike.totalLike / temp) * 100;
    var percentDislike = 100 - percentLike;
    const categoryList = await sellerModel.getListCategory();
    var page = req.params.page || 1;
    if (page < 1) page = 1;
    const offset = (page - 1) * 6;
    var items = await sellerModel.getwonProductbyID(idU, offset);
    var json = await sellerModel.countwonPro(idU);
    var length = JSON.parse(JSON.stringify(json))[0].total;

    res.render('seller-layout/wonProduct-seller', {
        user: user,
        idU: idU,
        totalLike: totalLike,
        totalDislike: totalDislike,
        point: point,
        percentLike: percentLike,
        percentDislike: percentDislike,
        wonPro: items,
        reviewItem: items,
        current: page,
        length: length,
        pages: Math.floor(length / 6),
        catList: categoryList,
        logged: req.isLogged
    });
});

//Bidding product - seller page
router.get('/bidding-seller/:page', async(req, res, next) => {
    var user = req.session.user;
    const idU = user.id;
    var json = await sellerModel.getSellerbyID(idU);
    var user = JSON.parse(JSON.stringify(json))[0];
    json = await sellerModel.getTotalLike(idU);
    var totalLike = JSON.parse(JSON.stringify(json))[0];
    var result = await sellerModel.getTotalDislike(idU);
    var totalDislike = JSON.parse(JSON.stringify(result))[0];
    var temp = totalLike.totalLike + totalDislike.totalDisLike;
    var point = totalLike.totalLike + "/" + temp;
    var percentLike = (totalLike.totalLike / temp) * 100;
    var percentDislike = 100 - percentLike;
    const categoryList = await sellerModel.getListCategory();
    var page = req.params.page || 1;
    if (page < 1) page = 1;
    const offset = (page - 1) * 6;
    var items = await sellerModel.getbiddingProductbyID(idU, offset);
    var json = await sellerModel.countbiddingPro(idU);
    var length = JSON.parse(JSON.stringify(json))[0].total;

    res.render('seller-layout/bidding-seller', {
        user: user,
        idU: idU,
        totalLike: totalLike,
        totalDislike: totalDislike,
        point: point,
        percentLike: percentLike,
        percentDislike: percentDislike,
        biddingPro: items,
        modalPro: items,
        current: page,
        length: length,
        pages: Math.floor(length / 6),
        catList: categoryList,
        logged: req.isLogged
    });
});

//My product - seller page
router.get('/myProduct-seller/:page', async(req, res, next) => {
    var user = req.session.user;
    const idU = user.id;
    var json = await sellerModel.getSellerbyID(idU);
    var user = JSON.parse(JSON.stringify(json))[0];
    json = await sellerModel.getTotalLike(idU);
    var totalLike = JSON.parse(JSON.stringify(json))[0];
    var result = await sellerModel.getTotalDislike(idU);
    var totalDislike = JSON.parse(JSON.stringify(result))[0];
    var temp = totalLike.totalLike + totalDislike.totalDisLike;
    var point = totalLike.totalLike + "/" + temp;
    var percentLike = (totalLike.totalLike / temp) * 100;
    var percentDislike = 100 - percentLike;
    const categoryList = await sellerModel.getListCategory();
    var page = req.params.page || 1;
    if (page < 1) page = 1;
    const offset = (page - 1) * 6;
    var items = await sellerModel.getListmyProductbyID(idU, offset);
    var json = await sellerModel.countmyPro(idU);
    var length = JSON.parse(JSON.stringify(json))[0].total;


    res.render('seller-layout/myProduct-seller', {
        user: user,
        idU: idU,
        totalLike: totalLike,
        totalDislike: totalDislike,
        point: point,
        percentLike: percentLike,
        percentDislike: percentDislike,
        myProduct: items,
        modalPro: items,
        current: page,
        length: length,
        pages: Math.floor(length / 6),
        catList: categoryList,
        logged: req.isLogged
    });
});

//Post product
router.get('/postProduct-seller', async(req, res, next) => {
    var user = req.session.user;
    const idU = user.id;
    var json = await sellerModel.getSellerbyID(idU);
    var user = JSON.parse(JSON.stringify(json))[0];
    json = await sellerModel.getTotalLike(idU);
    var totalLike = JSON.parse(JSON.stringify(json))[0];
    var result = await sellerModel.getTotalDislike(idU);
    var totalDislike = JSON.parse(JSON.stringify(result))[0];
    var temp = totalLike.totalLike + totalDislike.totalDisLike;
    var point = totalLike.totalLike + "/" + temp;
    var percentLike = (totalLike.totalLike / temp) * 100;
    var percentDislike = 100 - percentLike;
    const categoryList = await sellerModel.getListCategory();
    res.render('seller-layout/postProduct-seller', {
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

router.post('/postproduct', upload.array('addImg'), async(req, res, next) => {
    //const idU = 11;
    var user = req.session.user;
    const idU = user.id;
    if (req.files.length >= 3) {
        var namePro = String(req.body.namePro);
        var startPrice = String(req.body.startPrice);
        var priceStep = String(req.body.priceStep);
        var startDate = String(req.body.startDate);
        var endDate = String(req.body.endDate);
        var buyNow = String(req.body.buyNow);
        var description = String(req.body.description);
        var addImg = String(req.body.addImg);
        var extend = String(req.body.extend);
        var result = await sellerModel.inserttoPro(namePro, idU, priceStep, startPrice, buyNow, startDate, endDate, description);
        res.redirect("/seller/myProduct-seller/1?idU=" + idU);
    } else {
        res.redirect("/seller/postProduct-seller?idU=" + idU);
    }
});

router.post('/detailsProduct', async(req, res, next) => {
    const id = 64;
    var now = String(moment().format("dddd, MMMM Do YYYY"));
    var extraDetails = String(req.body.description);
    var json = await sellerModel.getoldDetailsbyId(id);
    var oldDetails = JSON.parse(JSON.stringify(json))[0];
    console.log(oldDetails);
    var newDetails = "\r" + oldDetails.oldDetails + "\r" + now + "\r" + extraDetails + "\r";
    var updateDetails = await sellerModel.updateDetailsbyId(id, newDetails);
    res.redirect("/seller/detailsProduct-seller?id=" + id);
});

router.post('/reivewBidderDis', async(req, res, next) => {
    //const idU = 28;
    var user = req.session.user;
    const idU = user.id;
    var idBidder = String(req.body.id_bidder);
    var review = String(req.body.review);
    var status = String(req.body.status);
    console.log(idBidder);
    console.log(review);
    console.log(status);
    var result = await sellerModel.insertoReview(idBidder, idU, review, status);
});

router.post('/reivewBidderLike', async(req, res, next) => {
    //const idU = 28;
    var user = req.session.user;
    const idU = user.id;
    var idBidder = String(req.body.id_bidder);
    var review = String(req.body.review);
    var status = String(req.body.status);
    console.log(idBidder);
    console.log(review);
    console.log(status);
    var result = await sellerModel.insertoReview(idBidder, idU, review, status);
});

router.post('/reivewSellerDis', async(req, res, next) => {
    //const idU = 11;
    var user = req.session.user;
    const idU = user.id;
    var idSeller = String(req.body.id_seller);
    var review = String(req.body.review);
    var status = String(req.body.status);
    console.log(idSeller);
    console.log(review);
    console.log(status);
    var result = await sellerModel.insertoReview(idSeller, idU, review, status);
});

router.post('/reivewSellerLike', async(req, res, next) => {
    //const idU = 11;
    var user = req.session.user;
    const idU = user.id;
    var idSeller = String(req.body.id_seller);
    var review = String(req.body.review);
    var status = String(req.body.status);
    console.log(idSeller);
    console.log(review);
    console.log(status);
    var result = await sellerModel.insertoReview(idSeller, idU, review, status);
});

router.post('/refuse', async(req, res, next) => {
    var bidder = String(req.body.bidder_id);
    var proID = String(req.body.product_id);
    var json = await sellerModel.findid1stBidder(proID);
    var maxBidder = JSON.parse(JSON.stringify(json))[0];
    if (bidder == maxBidder) {
        var insertBidderBlock = await sellerModel.inserttoBidderBlock(bidder, proID);
        var deleteBidder = await sellerModel.deletefromHistory(bidder, proID);
        var findnext = await sellerModel.fintnextBidder(proID);
        var newBidder = findnext.bidder;
        var current_price = findnext.current_price;
        console.log(newBidder);
        console.log(current_price);
        var updateBidder = await sellerModel.updateBidder(newBidder, proID, current_price);
    } else {
        var insertBidderBlock = await sellerModel.inserttoBidderBlock(bidder, proID);
        var deleteBidder = await sellerModel.deletefromHistory(bidder, proID);
    }
    /*if (bidder có phải là bidder giữ giá không)
    {
        xoá
        sau dó tìm max price, bidder đi kèm trong lịch sử đấu giá với id = product_id
        cập nhật lại bidder trong product table
        insert vô table blocked
    }
    else
    {
        gôọi hàm xoá ra, ket thuc
        insert vô table blocked }*/

});

module.exports = router;