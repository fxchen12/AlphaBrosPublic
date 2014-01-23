$(function() {

    if ($(".goals_container").length) {

        $(".goal_button").click(function() {
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


// function applyGraphGradient() {

//     // Options
//     var threshold = 100,
//         colorAbove = '#4572EE',
//         colorBelow = '#EE4643';

//     // internal
//     var someSeries = this.series[0];

//     $.each(someSeries.points, function(){
//         if (this.y < threshold)
//         {
//            this.graphic.attr('fill', colorBelow);
//         }
//         else
//         {
//             this.graphic.attr('fill', colorAbove );
//         }
//     });

//     delete someSeries.pointAttr.hover.fill;
//     delete someSeries.pointAttr[''].fill;
// }