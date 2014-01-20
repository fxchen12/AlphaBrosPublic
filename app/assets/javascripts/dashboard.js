$(function() {

    if ($(".start_image").size) {

        $(".start_image").click(function() {
            var id = $(this).attr('id');
            // $("body").find is necessary here. Do not change.
            var form = $("body").find(".workout_record#"+id);
            var cover = $(".dash_cover");
            form.show();
            cover.show();
            $("#workout_record_duration").focus();
            cover.click(function() {
                cover.hide();
                form.hide();
            });
            $(".xbutton").click(function() {
                cover.hide();
                form.hide();
            });
        });

        $(".delete_button a").hover(function() {
            $(this).find("img").attr('src', '/assets/delete_button_red.png');
        }, function() {
            $(this).find("img").attr('src', '/assets/delete_button_gray.png');
        });
    }
});