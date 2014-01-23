$(function() {
    if ($(".dropdown_container").length) {

        $('#dropdown_form select').change(function(){
            $('#dropdown_form').submit();
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