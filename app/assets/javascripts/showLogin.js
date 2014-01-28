$(function() {

    if($("#loginBox").length) {

        $("#loginButton").click(function() {
            $("#cover").fadeIn();
            $("#loginBox").slideDown();
            $("#session_email").focus();
        });

        $("#cover").click(function() {
            $("#loginBox").slideUp();
            $("#cover").fadeOut();
        });

        $(".xbutton").click(function() {
            $("#loginBox").slideUp();
            $("#cover").fadeOut();
        });

        $(".slow_scroll").click(function() {
            $("#user_name").focus();
        });
    }
});