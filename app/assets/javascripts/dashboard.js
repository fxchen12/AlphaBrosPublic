$(function() {

    if ($(".start_image").size) {

        $(".start_image").click(function() {
            var id = $(self).attr('id');
            $(self).parent().parent().parent().find(".workout_record#"+id).toggle();
        });
    }
});