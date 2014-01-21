$(function() {

    if ($(".goal_image").size) {

        $(".goal_image").click(function() {
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

    $('#bar_graph').highcharts({
        chart: {
            backgroundColor: {
                linearGradient: [0, 0, 500, 500],
                stops: [
                    [0, 'rgba(250, 250, 250, .50)'],
                    [1, 'rgba(250, 250, 250, .20)']
                ]
            },
            type: 'bar',

            events: {
                load: applyGraphGradient
            }
        },
        legend: {
            enabled: false
        },
        
        title: {
            text: 'Goal Progress'
        },
        xAxis: {
            categories: ['This Exercise','Another Excercise', 'Yet another one']
        },
        yAxis: {
            title: {
                text: '% Complete'
            },
            minRange: 100,
            min: 0

        },
        series: [{
            name: 'Percent Complete',
            data: [50,40,100]
        }]
    });
});


function applyGraphGradient() {
    
    // Options
    var threshold = 100,
        colorAbove = '#4572EE',
        colorBelow = '#EE4643';
        
    // internal
    var someSeries = this.series[0];
    
    $.each(someSeries.points, function(){
        if (this.y < threshold)
        {
           this.graphic.attr('fill', colorBelow);
        }
        else
        {
            this.graphic.attr('fill', colorAbove );
        }
    });
    
    delete someSeries.pointAttr.hover.fill;
    delete someSeries.pointAttr[''].fill; 
}