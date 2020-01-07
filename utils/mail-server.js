var nodemailer =  require('nodemailer'); // khai báo sử dụng module nodemailer
var transporter =  nodemailer.createTransport({ // config mail server
        service: 'Gmail',
        auth: {
            user: 'tnah.work@gmail.com',
            pass: '123123789'
        }
    });
module.exports = function(params) {

    this.send = function(){
        transporter.sendMail(params);
    }
}