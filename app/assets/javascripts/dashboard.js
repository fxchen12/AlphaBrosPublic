$(function() {

    if ($(".dashboard_container").length) {

        $(".cover").click(function() {
            $(this).fadeOut();
            $(".xbutton").parent().parent().slideUp();
        });

        $(".xbutton").click(function() {
            $(".cover").fadeOut();
            $(this).parent().parent().slideUp();
        });

        $(".record_button").click(function() {
            var id = $(this).attr('id');
            // $("body").find is necessary here. Do not change.
            var form = $("body").find(".workout_record#"+id);
            form.slideDown();
            $(".cover").fadeIn();
            $("#workout_record_duration").focus();
        });

        $(".cancel_button").click(function() {
            $(".cover").fadeOut();
            $(this).parent().parent().parent().parent().slideUp();
        });

    }
});