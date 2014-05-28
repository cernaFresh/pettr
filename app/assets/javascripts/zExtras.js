// document.addEventListener('page:change', function() {
//     document.getElementById('main-view').className += ' animated fadeIn';
//     document.getElementsByClassName('listing').className += ' animated fadeInLeft';
// });
// document.addEventListener('page:fetch', function() {
//     document.getElementById('main-view').className += ' animated fadeOut';
//     var opts = {
//         lines: 13, // The number of lines to draw
//         length: 20, // The length of each line
//         width: 10, // The line thickness
//         radius: 30, // The radius of the inner circle
//         corners: 1, // Corner roundness (0..1)
//         rotate: 0, // The rotation offset
//         direction: 1, // 1: clockwise, -1: counterclockwise
//         color: '#000', // #rgb or #rrggbb or array of colors
//         speed: 1, // Rounds per second
//         trail: 60, // Afterglow percentage
//         shadow: false, // Whether to render a shadow
//         hwaccel: false, // Whether to use hardware acceleration
//         className: 'spinner', // The CSS class to assign to the spinner
//         zIndex: 2e9, // The z-index (defaults to 2000000000)
//         top: '50%', // Top position relative to parent
//         left: '50%' // Left position relative to parent
//     };
//     var target = document.getElementById('master-view');
//     var spinner = new Spinner(opts).spin(target);

// });
$(document).ready(function() {
    $(document).on('page:fetch', function() {
        // loading new page

        $(".listing").animateCSS("rotateOut");
        var opts = {
            lines: 13, // The number of lines to draw
            length: 20, // The length of each line
            width: 10, // The line thickness
            radius: 30, // The radius of the inner circle
            corners: 1, // Corner roundness (0..1)
            rotate: 0, // The rotation offset
            direction: 1, // 1: clockwise, -1: counterclockwise
            color: '#000', // #rgb or #rrggbb or array of colors
            speed: 1, // Rounds per second
            trail: 60, // Afterglow percentage
            shadow: false, // Whether to render a shadow
            hwaccel: false, // Whether to use hardware acceleration
            className: 'spinner', // The CSS class to assign to the spinner
            zIndex: 2e9, // The z-index (defaults to 2000000000)
            top: '50%', // Top position relative to parent
            left: '50%' // Left position relative to parent
        };
        var target = document.getElementById('master-view');
        var spinner = new Spinner(opts).spin(target);
        // $("#main-view").hide();
        $("#main-view").animateCSS("fadeOut", function() {
            $("#main-view").hide();
        });
    });
    $(document).on('page:change', function() {
        // $("#main-view").show();
        // $('#main-view').animateCSS("fadeIn");
        $('.listing').hide();
        $('.listing').animateCSS("fadeInRight");

        setTimeout(
            function() {
                $('.alert').animateCSS("pulse");
            }, 2000);

    });
});