//= ../../node_modules/jquery/dist/jquery.js
//= ../../node_modules/jquery.appear/jquery.appear.js
//= ../../node_modules/bootstrap/dist/js/bootstrap.js
//= ../../node_modules/scrollreveal/dist/scrollreveal.js
//= ../../node_modules/jquery-match-height/dist/jquery.matchHeight.js

$(document).ready(function() {
    initScrollreveal();
    initMatchHeight();
    initSVG();
    initSmoothScroll();
});

function initScrollreveal() {
    window.sr = ScrollReveal({ 
        reset: true
    });

    window.sr.reveal('.reveal');
}

function initMatchHeight() {
    $('.matchHeight').matchHeight({
        
    });
}

function initSVG() {
    $('img.svg').each(function() {
        var $img = jQuery(this);
        var imgID = $img.attr('id');
        var imgClass = $img.attr('class');
        var imgURL = $img.attr('src');

        jQuery.get(imgURL, function(data) {
            // Get the SVG tag, ignore the rest
            var $svg = jQuery(data).find('svg');

            // Add replaced image's ID to the new SVG
            if(typeof imgID !== 'undefined') {
                $svg = $svg.attr('id', imgID);
            }
            // Add replaced image's classes to the new SVG
            if(typeof imgClass !== 'undefined') {
                $svg = $svg.attr('class', imgClass+' replaced-svg');
            }

            // Remove any invalid XML tags as per http://validator.w3.org
            $svg = $svg.removeAttr('xmlns:a');

            // Check if the viewport is set, if the viewport is not set the SVG wont't scale.
            if(!$svg.attr('viewBox') && $svg.attr('height') && $svg.attr('width')) {
                $svg.attr('viewBox', '0 0 ' + $svg.attr('height') + ' ' + $svg.attr('width'));
            }

            // Replace image with new SVG
            $img.replaceWith($svg);

        }, 'xml');

    });
}

function initSmoothScroll(){
    $(".smoothscroll").on("click", function (event) {
        event.preventDefault();
        var id  = $(this).attr('href'),
            top = $(id).offset().top;
        $('body,html').animate({scrollTop: top}, 500);
    });
}