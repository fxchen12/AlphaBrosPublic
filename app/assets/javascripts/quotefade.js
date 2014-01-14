//Wait for page load
$(function() {

    //Check if there is a 'quotes' class on document
    if ($(".quotes").length) {

        var quotes = $(".quotes");
        var quoteIndex = -1;

        function showNextQuote() {
            ++quoteIndex;
            quotes.eq(quoteIndex % quotes.length)
                .fadeIn(1000)
                .delay(5000)
                .fadeOut(1000, showNextQuote);
        }

        showNextQuote();
    }
});