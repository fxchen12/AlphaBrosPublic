$(function() {
    if ($(".dropdown_container").length) {

        $('#dropdown_form select').change(function(){
            $('#dropdown_form').submit();
        });

        $(".delete_image").click(function() {
            var id = $(this).attr('id');
            var del = $("body").find(".delete_confirmation#"+id);
            del.slideDown();
            $(".cover").fadeIn();
        });

        $(".add_image").click(function() {
            // $("body").find is necessary here. Do not change.
            var add = $("body").find(".add_input");
            add.slideDown();
            $(".cover").fadeIn();
            $("#workout_name").focus();
        });

        $(".cover").click(function() {
            $(this).fadeOut();
            $(".xbutton").parent().parent().slideUp();
        });

        $(".xbutton").click(function() {
            $(".cover").fadeOut();
            $(this).parent().parent().slideUp();
        });

        // Not currently used
        $(".cancel_button").click(function() {
            $(".cover").fadeOut();
            $(".xbutton").parent().parent().slideUp();
        });
    }
});