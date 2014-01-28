$(function() {

    if($("#loginBox").length) {

        $("#loginButton").click(function() {
            $("#loginBox").slideDown();
            $(".cover").fadeIn();
            $("#session_email").focus();
        });

        $(".cover").click(function() {
            $("#loginBox").slideUp();
            $(".cover").fadeOut();
        });

        $(".xbutton").click(function() {
            $("#loginBox").slideUp();
            $(".cover").fadeOut();
        });

        $(".slow_scroll").click(function() {
            $("#user_name").focus();
        });
    }
});