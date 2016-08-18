// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require cocoon
//= require owl.carousel.min
//= require select2-full

$(document).ready(function() {

    /***************** Navbar-Collapse ******************/

    $(window).scroll(function () {
        if ($(".navbar").offset().top > 20) {
            $(".navbar-fixed-top").addClass("top-nav-collapse");
        } else {
            $(".navbar-fixed-top").removeClass("top-nav-collapse");
        }
    });

    /***************** Scroll Spy ******************/


    /***************** Owl Carousel ******************/

    $("#owl-hero").owlCarousel({

        loop: true,
        nav: true, // Show next and prev buttons
        items: 1,
        autoPlay: true,
        autoplaySpeed: 100,
        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"]

    });

});

$(document).on('page:fetch', function() {
  $(".preloader").show();
});
$(document).on('page:change', function() {
  $(".preloader").hide();
});
