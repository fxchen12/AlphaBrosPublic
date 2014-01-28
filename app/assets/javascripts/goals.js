$(function() {

    if ($(".goals_container").length) {

        $(".goal_button").click(function() {
            var id = $(this).attr('id');
            // $("body").find is necessary here. Do not change.
            var form = $("body").find(".workout_goals#"+id);
            var cover = $(".cover");
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

        $(".goal_delete_image").click(function() {
            var id = $(this).attr('id');
            var del = $("body").find(".goal_delete_confirmation#"+id);
            del.slideDown();
            $(".cover").fadeIn();
        });

        $(".cover").click(function() {
            $(this).fadeOut();
            $(".xbutton").parent().parent().slideUp();
        });

        $(".xbutton").click(function() {
            $(".cover").fadeOut();
            $(this).parent().parent().slideUp();
        });
    }

    if ($(".goal_graph").length) {
        $('.goal_graph').each(function()
        {
            $(this).highcharts({
            chart: {
              type: 'bar',
              backgroundColor: {
              linearGradient: [0, 0, 500, 500],
              stops: [
                [0, 'rgba(255, 255, 255, 0)'],
                [1, 'rgba(255, 255, 255, 0)']
              ]
            }
              },
              title: {
                  text: null
              },
              xAxis: {
                categories: ['']

              },
              tooltip: {
                headerFormat:"Percent "
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
