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

    if ($(".graph").length) {
        $('.graph').each(function()
        {
            $(this).highcharts({
            chart: {
              type: 'bar',
              backgroundColor: {
              linearGradient: [0, 0, 500, 500],
              stops: [
                [0, 'rgba(250, 250, 250, .50)'],
                [1, 'rgba(250, 250, 250, .50)']
              ]
            }
              },
              title: {
                  text: null
              },
              xAxis: {
                categories: ['Percent']
              },
              yAxis: {
                  min: 0,
                  title: {
                      text: null
                  }
              },
              plotOptions: {
                  bar: {
                      stacking: 'percent'
                  }
              },
              legend: {
                enabled: false
              },
              colors: [
                '#909090',
                '#006600'
              ],
              series: [{
                  name: 'Incomplete',
                  data: [100 - Number($(this).attr("id"))]
              },
               {
                  name: 'Complete',
                  data:[Number($(this).attr("id"))]
               }]
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