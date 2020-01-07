
 function validateForm()  {
            var name = document.getElementById("name").value;
            var email = document.getElementById("email").value;
            var phone = document.getElementById("phone").value;
            var date = document.getElementById("date").value;
            console.log(name+"  " +phone + "  " +email + "  " +date);
             if(name== "") {
                 alert("Please enter your Name");
                 return false;
             }
             if(email == "") {
                 alert("Please enter you Email");
                 return false;
             }
             if(phone == "") {
                 alert("Please enter you Phone");
                 return false;
             }
             if(date == "") {
                 alert("Please enter you Birth Day");
                 return false;
             }
 
             return true;
         }

function openTab(evt, tabName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(tabName).style.display = "block";
  evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();

(function($) {
  "use strict"; // Start of use strict

  // Smooth scrolling using jQuery easing
  $('a.js-scroll-trigger[href*="#"]:not([href="#"])').click(function() {
    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
      if (target.length) {
        $('html, body').animate({
          scrollTop: (target.offset().top - 54)
        }, 1000, "easeInOutExpo");
        return false;
      }
    }
  });

  // Closes responsive menu when a scroll trigger link is clicked
  $('.js-scroll-trigger').click(function() {
    $('.navbar-collapse').collapse('hide');
  });
  // Toggle dropdown submenu
   $(document).ready(function(){
      $('.dropdown-submenu a.drop').click(function(e){
         $(this).next('ul').toggle();
         e.stopPropagation();
         e.preventDefault();
         });
      });

  // Activate scrollspy to add active class to navbar items on scroll
  $('body').scrollspy({
    target: '#mainNav',
    offset: 56
  });

  // Collapse Navbar
  var navbarCollapse = function() {
    if ($("#mainNav").offset().top > 100) {
      $("#mainNav").addClass("navbar-shrink");
    } else {
      $("#mainNav").removeClass("navbar-shrink");
    }
  };
  // Collapse now if page is not at top
  navbarCollapse();
  // Collapse the navbar when page is scrolled
  $(window).scroll(navbarCollapse);
  
  // Toggle signup, reset password in logged form
  function toggleResetPswd(e){
    e.preventDefault();
    $('#logreg-forms .form-signin').toggle() // display:block or none
    $('#logreg-forms .form-reset').toggle() // display:block or none
}

function toggleSignUp(e){
    e.preventDefault();
    $('#logreg-forms .form-signin').toggle(); // display:block or none
    $('#logreg-forms .form-signup').toggle(); // display:block or none
}

$(document).ready(function(){
    // Login Register Form
    $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
    $('#logreg-forms #cancel_reset').click(toggleResetPswd);
    $('#logreg-forms #btn-signup').click(toggleSignUp);
    $('#logreg-forms #cancel_signup').click(toggleSignUp);
})

$(document).ready(function(){
        var date_input=$('input[name="date"]'); //our date input has the name "date"
        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
        date_input.datepicker({
            format: 'dd-mm-yyyy',
            container: container,
            todayHighlight: true,
            autoclose: true,
        })
    })




$(document).ready(function(){
        $("#saveInfo").click(function(){
          var userId = $("#userId").val(); 
          var name = $("#name").val();
          var phone = $("#phone").val();
          var email = $("#email").val();
          var date = $("#date").val();
          console.log(name+"  " +phone + "  " +email + "  " +date);
           if (validateForm()){
            $.ajax({
                  type: 'POST',
                  data: {"userId": userId, "name": name, "phone" : phone, "email": email, "date": date},
                  url: window.location.assign('/bidder/bidder-account-setting/updateInfo'),
                  }).done(function(data) { 
                      //Xử lý data ở đây 
                      if (data ==='true')
                      {
                        alert("Change infomation succesfully!");
                         window.location.assign("/bidder/bidder-watchlist/1");
                      }
                      
                    });
           }
           else
                      {
                        alert("Change fail!");                        
                      }
           
          });
      });

$(document).ready(function(){
        $("#savePass").click(function(){
          var userId = $("#userId").val(); 
          var currentPass = $("#current_pass").val();
          var newPass = $("#new_pass").val();
          var newPass2 = $("#new_pass2").val();
          console.log(currentPass + "  " +newPass + "  " +newPass2);
           if (validateForm()){
            $.ajax({
                  type: 'POST',
                  data: {"userId": userId, "currentPass": currentPass, "newPass" : newPass, "newPass2": newPass2},
                  url: '/bidder/bidder-account-setting/updatePass',
                  }).done(function(data) { 
                      //Xử lý data ở đây 
                      if (data ==='0')
                      {
                        alert("Change Pass succesfully!");
                        window.location.assign("/bidder/bidder-watchlist/1");
                      }
                      else if (data==='2'){
                        alert("Current Password is incorrect!")
                      }
                      else{
                        alert("New Passwords is incorrect!")
                      }
                      
                    });
           }
           else
                      {
                        alert("Change fail!");                        
                      }
           
          });
      });
})(jQuery); // End of use strict


