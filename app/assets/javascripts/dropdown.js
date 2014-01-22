$(function() {
    if ($("#dropdown_form").length) {

        $('#dropdown_form select').change(function(){
            $('#dropdown_form').submit();
        });
    }
});