$(function() {

    if ($(".dashboard_container").length) {

        $(".cover").click(function() {
            $(this).fadeOut();
            $(".xbutton").parent().parent().slideUp();
        });

        $(".xbutton").click(function() {
            $(".cover").fadeOut();
            $(this).parent().parent().slideUp();
        });

        $(".record_button").click(function() {
            var id = $(this).attr('id');
            // $("body").find is necessary here. Do not change.
            var form = $("body").find(".workout_record#"+id);
            form.slideDown();
            $(".cover").fadeIn();
            $("#workout_record_duration").focus();
        });

    if ($(".dashboard_goal_graph").length) {
        $('.dashboard_goal_graph').each(function()
        {
            $(this).highcharts({
            chart: {
              type: 'bar',
              backgroundColor: {
              linearGradient: [0, 0, 500, 500],
              stops: [
                [0, 'rgba(250, 250, 250, 0)'],
                [1, 'rgba(250, 250, 250, 0)']
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

    if ($("#dashboard_progress_graph").length) {

        $('#dashboard_progress_graph').highcharts({
        chart: {
            type: 'column',
            backgroundColor: {
              linearGradient: [0, 0, 500, 500],
              stops: [
                [0, 'rgba(250, 250, 250, 0)'],
                [1, 'rgba(250, 250, 250, 0)']
              ]
            }
        },
        title: {
          text: '7 Day History'
        },
        xAxis: {
          categories: [6, 5, 4, 3, 2, 1, 0],
          title: {
            text: 'Day(s) Ago'
          }
        },
        tooltip: {
          headerFormat:"{point.key} day(s) ago<br>"
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Minutes'
            }
        },
        series: [{
            name: 'Current Activity',
            data: dashboard_progress_data
        },
        {
            name: 'All Activities',
            data: dashboard_total_data
        }]
        });
    }

    if ($("#dashboard_cumulative_graph").length) {

        $('#dashboard_cumulative_graph').highcharts({
        series: [{
            name: 'Minutes For This Activity',
            data: dashboard_cumulative_progress_data
        },
        {
            name: 'Minutes For All Activities',
            data: dashboard_cumulative_total_data
        }]
        });
    }



    }

});