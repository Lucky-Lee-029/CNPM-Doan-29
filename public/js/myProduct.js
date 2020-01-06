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
        $("#submit").click(function(){
          var userId = $("#userId").val();
          console.log(userId+"dsfs");
           $.ajax({
                  type: 'POST',
                  data: {"userid": userId},
                  url: '/bidder/bidder-bidding/request',
                  }).done(function(data) { 
                      //Xử lý data ở đây 
                      if (data ==='true')
                      {
                        alert("Send request succesfully! Please wait for response.");
                      }
                      else
                      {
                        alert("Your request has sended already! Please wait for response.");                        
                      }
                    });
          });
      });

$(document).ready(function(){
        $(".addWatchList").click(function(){
          var userId = $("#userId").val();
           var modal = $(this).parents('div').first();
          var input = modal.children();
          var productId = parseInt($(input[0]).val());
          console.log(userId+"  " +productId);
           $.ajax({
                  type: 'POST',
                  data: {"userId": userId, "productId" : productId},
                  url: '/bidder/bidder-bidding/addWatchList',
                  }).done(function(data) { 
                      //Xử lý data ở đây 
                      if (data ==='true')
                      {
                        alert("Added to yout Watch List succesfully!");
                      }
                      else
                      {
                        alert("This product has been added to your Watch List!");                        
                      }
                    });
          });
      });

})(jQuery); // End of use strict

 //<!-- tooltip -->

$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();   
});

function addedWatchList() {
  alert("Added to your watch list!");
}