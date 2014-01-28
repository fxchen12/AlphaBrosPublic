$(function() {
   
    if ($(".achievements_container").length) {

        $('#category_form select').change(function(){
            $('#category_form').submit();
        });
    }
});