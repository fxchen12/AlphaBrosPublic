$(function() {

    if ($(".start_image").size) {

        $(".start_image").click(function() {
            $(".start_image").parent().parent().parent().find(".workout_record").toggle();
        });
    }
});