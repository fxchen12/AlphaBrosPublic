
/**$(function() 
{
    var bgCounter = 0,
        backgrounds = [
           "/assets/background.jpg",
           "/assets/background2.jpg",
           "/assets/background3.jpg",
		   "/assets/background4.jpg",
           "/assets/background5.jpg",
		   "/assets/background6.jpg"
        ];
    function changeBackground()
    {
        bgCounter = (bgCounter+1) % backgrounds.length;
        $('#header').css('background', 'url('+backgrounds[bgCounter]+')');
		$('#header').css('position', 'relative');
		$('#header').css('background-position', 'center center');
		$('#header').css('background-size', 'cover');
		$('#header').css('padding','14em 0 14em 0');
		$('#header').css('text-align','center');
		$('#header').css('margin','0');
        setTimeout(changeBackground,7000);
		
    }
    changeBackground();
})();**/
