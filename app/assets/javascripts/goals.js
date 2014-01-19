$(function() {

    if ($(".goal_image").size) {

        $(".goal_image").click(function() {
            var id = $(this).attr('id');
            // $("body").find is necessary here. Do not change.
            var form = $("body").find(".workout_goals#"+id);
            var cover = $(".goal_cover");
            form.show();
            cover.show();
            cover.click(function() {
                cover.hide();
                form.hide();
            });
            $(".xbutton").click(function() {
                cover.hide();
                form.hide();
            });
        });
    }
});