$(function() {

    if ($(".dashboard_container").size) {

        $(".dash_cover").click(function() {
            $(this).fadeOut();
            $(".xbutton").parent().parent().slideUp();
        });

        $(".xbutton").click(function() {
            $(".dash_cover").fadeOut();
            $(this).parent().parent().slideUp();
        });

        $(".cancel_button").click(function() {
            $(".dash_cover").fadeOut();
            $(this).parent().parent().parent().parent().slideUp();
        });

        $(".start_image").click(function() {
            var id = $(this).attr('id');
            // $("body").find is necessary here. Do not change.
            var form = $("body").find(".workout_record#"+id);
            form.slideDown();
            $(".dash_cover").fadeIn();
            $("#workout_record_duration").focus();
        });

        $(".delete_image").click(function() {
            var id = $(this).attr('id');
            var del = $("body").find(".delete_confirmation#"+id);
            del.slideDown();
            $(".dash_cover").fadeIn();
        });


    }
});