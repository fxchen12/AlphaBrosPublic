$(function() {

    if ($(".start_image").size) {

        $(".start_image").click(function() {
            var id = $(this).attr('id');
            $(this).parent().parent().parent().find(".workout_record#"+id).toggle();
        });
    }
});