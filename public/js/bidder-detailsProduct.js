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
  
  //arlet
  var close = document.getElementsByClassName("closebtn");
  var i;

  for (i = 0; i < close.length; i++) {
    close[i].onclick = function(){
      var div = this.parentElement;
      div.style.opacity = "0";
      setTimeout(function(){ div.style.display = "none"; }, 600);
    }
  }

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

// Quantity "plus" and "minus" buttons
 //End: WooCommerce Quantity

$(document).ready(function(){
        $(".addWatchList").click(function(){
          var productId = $(".productId").val();
          console.log("tren" + productId);
           $.ajax({
                  type: 'POST',
                  data: {"productId" : productId},
                  url: '/bidder/bidder-detail-product/addWatchList',
                  }).done(function(data) { 
                      //Xử lý data ở đây 
                      if (data ==='true')
                      {
                         console.log("oke");
                        alert("Added to yout Watch List succesfully!");
                      }
                      else
                      {
                        alert("This product has been added to your Watch List!");                        
                      }
                    });
          });
      });

$(document).ready(function(){
        $(".addWatchList1").click(function(){
          var modal = $(this).parents('div').first();
          var input = modal.children();
          var productId = parseInt($(input[0]).val());
          console.log("duoi"+productId);
           $.ajax({
                  type: 'POST',
                  data: {"productId" : productId},
                  url: '/bidder/bidder-detail-product/addWatchList',
                  }).done(function(data) { 
                      //Xử lý data ở đây 
                      if (data ==='true')
                      {
                         console.log("oke");
                        alert("Added to yout Watch List succesfully!");
                      }
                      else
                      {
                        alert("This product has been added to your Watch List!");                        
                      }
                    });
          });
      });

$(document).ready(function(){
        $("#Bid").click(function(){
          var price = $("#input-number").val();
          var productId = $(".productId").val();
          console.log("bid "+price+" " + productId);
           $.ajax({
                  type: 'POST',
                  data: {"price":price,"productId" : productId},
                  url: '/bidder/bidder-detail-product/Bid',
                  }).done(function(data) { 
                      //Xử lý data ở đây 
                      if (data ==='true')
                      {

                         console.log("oke");
                        alert("Bid succesfully!");
                        window.location.assign("/bidder/bidder-detail-product/?id="+productId);
                      }
                      else if (data==='falsePrice')
                      {
                        alert("Invalid bid price !");                        
                      }
                      else if (data ==='auctioned'){
                          alert("Auction has been ended!")
                      }
                      else{
                        alert("You can't bid this one! Your point is under 80%");                        
                      }
                    });
          });
      });


$(document).ready(function(){
        $("#buynow").click(function(){
          var productId = $(".productId").val();
          console.log("buynow " + productId);
           $.ajax({
                  type: 'POST',
                  data: {"productId" : productId},
                  url: '/bidder/bidder-detail-product/buynow',
                  }).done(function(data) { 
                      //Xử lý data ở đây 
                      if (data ==='true')
                      {

                         console.log("oke");
                        alert("Buy succesfully!");
                        window.location.assign("/bidder/bidder-detail-product/?id="+productId);
                      }
                      else if (data ==='auctioned'){
                          alert("Auction has been ended!")
                      }
                    });
          });
      });

})(jQuery); // End of use strict


//<!-- SlideShow Products -->
var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";

}


 
function openTab(tabName,elmnt) {
// Hide all elements with class="tabcontent" by default */
var i, tabcontent, tablinks;
var color= '#fed136';
tabcontent = document.getElementsByClassName("tabcontent");
for (i = 0; i < tabcontent.length; i++) {
  tabcontent[i].style.display = "none";
}

// Remove the background color of all tablinks/buttons
tablinks = document.getElementsByClassName("tablink");
for (i = 0; i < tablinks.length; i++) {
  tablinks[i].style.backgroundColor = "";
}

// Show the specific tab content
document.getElementById(tabName).style.display = "block";

// Add the specific color to the button used to open the tab content
elmnt.style.backgroundColor = color;
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
 
 /// tooltip 

$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();   
});

function addedWatchList() {
  alert("Added to your watch list!");
}


$('.btn-number').click(function(e){
    e.preventDefault();
    
    fieldName = $(this).attr('data-field');
    type      = $(this).attr('data-type');
    var input = $("input[name='"+fieldName+"']");
    var currentVal = parseInt(input.val());
    var step = parseInt(document.getElementById("input-number").step);
    console.log(step);
    if (!isNaN(currentVal)) {
        if(type == 'minus') {
            
            if(currentVal > input.attr('min')) {
                input.val(currentVal - step).change();
            } 
            if(parseInt(input.val()) == input.attr('min')) {
                $(this).attr('disabled', true);
            }

        } else if(type == 'plus') {

            if(currentVal < input.attr('max')) {
                input.val(currentVal + step).change();
            }
            if(parseInt(input.val()) == input.attr('max')) {
                $(this).attr('disabled', true);
            }

        }
    } else {
        input.val(0);
    }
});

$('.input-number').focusin(function(){
   $(this).data('oldValue', $(this).val());
});
$('.input-number').change(function() {
    
    minValue =  parseInt($(this).attr('min'));
    maxValue =  parseInt($(this).attr('max'));
    valueCurrent = parseInt($(this).val());
    
    name = $(this).attr('name');
    if(valueCurrent >= minValue) {
        $(".btn-number[data-type='minus'][data-field='"+name+"']").removeAttr('disabled')
    } else {
        alert('Sorry, the minimum value was reached');
        $(this).val($(this).data('oldValue'));
    }
    if(valueCurrent <= maxValue) {
        $(".btn-number[data-type='plus'][data-field='"+name+"']").removeAttr('disabled')
    } else {
        alert('Sorry, the maximum value was reached');
        $(this).val($(this).data('oldValue'));
    }
    
    
});
$(".input-number").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 190]) !== -1 ||
             // Allow: Ctrl+A
            (e.keyCode == 65 && e.ctrlKey === true) || 
             // Allow: home, end, left, right
            (e.keyCode >= 35 && e.keyCode <= 39)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });

