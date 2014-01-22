$(function() {

    if ($(".dashboard_container").length) {

        $(".dash_cover").click(function() {
            $(this).fadeOut();
            $(".xbutton").parent().parent().slideUp();
        });

        $(".xbutton").click(function() {
            $(".dash_cover").fadeOut();
            $(this).parent().parent().slideUp();
        });

        $(".record_button").click(function() {
            var id = $(this).attr('id');
            // $("body").find is necessary here. Do not change.
            var form = $("body").find(".workout_record#"+id);
            form.slideDown();
            $(".dash_cover").fadeIn();
            $("#workout_record_duration").focus();
        });

        $(".cancel_button").click(function() {
            $(".dash_cover").fadeOut();
            $(this).parent().parent().parent().parent().slideUp();
        });

        $(".delete_image").click(function() {
            var id = $(this).attr('id');
            var del = $("body").find(".delete_confirmation#"+id);
            del.slideDown();
            $(".dash_cover").fadeIn();
        });

        $(".add_image").click(function() {
            var add = $("body").find(".add_input");
            add.slideDown();
            $(".dash_cover").fadeIn();
        });


    }
});