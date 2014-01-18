/*
    This function re-enables submit buttons disabled by the 
    :disabled_with rails option when leaving the page.
    This allows the button to be available again when using
    the browser's back button or reload.
*/
$(window).unload(function() {
    $.rails.enableFormElements($($.rails.formSubmitSelector));
});