
/**$(function() {
    sequence = [
               "/assets/background.jpg",
               "/assets/background2.jpg",
               "/assets/background3.jpg",
    		       "/assets/background4.jpg",
               "/assets/background5.jpg",
    		       "/assets/background6.jpg"
        ];

    var toggle=0;
    var i=-1;
    crossFade();
    function crossFade()
    {
        //increment our image
        i=(i>=sequence.length-1)?0:(i+1);
        //set the background of the hidden image to the image we want
        $("#header" + toggle).css('background', 'url(' + sequence[i] + ')');
        //tell it to fade in. When the fade in is complete, call this function after 1 second
        $("#header" + toggle).fadeIn(500,function(){window.setTimeout(crossFade,1000);});
        //toggle the div being used by using bitwise operator: ^
        toggle^=1;
        //fade out the currently visible div
        $("#header" + toggle).fadeOut(500);
        //debug code delete later
        //$("#debug").html("#demo0=" + $("#demo0").css('background-image')+"</br>"+"#demo1=" + $("#demo1").css('background-image')+"</br>Current div:#demo"+toggle);
    	};
});
**/