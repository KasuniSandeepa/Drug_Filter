
"use strict";
const d = document;
d.addEventListener("DOMContentLoaded", function(event) {

    if (d.querySelector('.headroom')) {
        var headroom = new Headroom(document.querySelector("#navbar-main"), {
            offset: 0,
            tolerance: {
                up: 0,
                down: 0
            },
        });
        headroom.init();
    }

    // Tooltips
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })

    // Popovers
    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-toggle="popover"]'))
    var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
    })

    var scroll = new SmoothScroll('a[href*="#"]', {
        speed: 500,
        speedAsDuration: true
    });

    d.querySelector('.current-year').textContent = new Date().getFullYear();

});

// data
var clear;
var cssClass;
var msgDuration = 2000; // 2 seconds
// cache DOM
var $msg = $('.msg');

// render message
function render(cssclass, msg) {
    cssClass = cssclass;
    // hide();
    $msg.css("background-color", cssclass);
    $msg.addClass('active').text(msg);
    timer();
}

function timer() {
    clearTimeout(clear);
    clear = setTimeout(function () {
        hide();
    }, msgDuration)
}

function hide() {
    // $msg.hide();
    $msg.removeClass(cssClass+ ' active');
}