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
    $(document).ready(function() {
        $('.dropdown-submenu a.drop').click(function(e) {
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
    function toggleResetPswd(e) {
        e.preventDefault();
        $('#logreg-forms .form-signin').toggle() // display:block or none
        $('#logreg-forms .form-reset').toggle() // display:block or none
    }

    function toggleSignUp(e) {
        e.preventDefault();
        $('#logreg-forms .form-signin').toggle(); // display:block or none
        $('#logreg-forms .form-signup').toggle(); // display:block or none
    }

    $(document).ready(function() {
        // Login Register Form
        $('#logreg-forms #forgot_pswd').click(toggleResetPswd);
        $('#logreg-forms #cancel_reset').click(toggleResetPswd);
        $('#logreg-forms #btn-signup').click(toggleSignUp);
        $('#logreg-forms #cancel_signup').click(toggleSignUp);
    })

})(jQuery); // End of use strict


//<!-- tooltip -->

$(document).ready(function() {
    $('[data-toggle="tooltip"]').tooltip();
});

$(document).ready(function() {
    $('#review-submit-0').on('click', function() {

        var input = $('#review-modal-0').children();
        var review_text = $(input[0]).val();
        var isDislike = $(input[1]).val();
        var bidder = $(input[2]).val();
        var path = window.location.pathname;
        $.post('/seller/reivewBidderDis', { review: review_text, status: isDislike, id_bidder: bidder });
        alert("Review success");


    });
});

$(document).ready(function() {
    $('#review-submit-1').on('click', function() {

        var input = $('#review-modal-1').children();
        var review_text = $(input[0]).val();
        var isLike = $(input[1]).val();
        var bidder = $(input[2]).val();
        var path = window.location.pathname;
        $.post('/seller/reivewBidderLike', { review: review_text, status: isLike, id_bidder: bidder });
        alert("Review success");


    });
});



function addedWatchList() {
    alert("Added to your watch list!");
}