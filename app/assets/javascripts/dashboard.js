$(function() {

    if ($(".dashboard_container").length) {

        $(".dash_cover").click(function() {
            $(this).fadeOut();
            $(".xbutton").parent().parent().slideUp();
        });

        $(".xbutton").click(function() {
            $(".dash_cover").fadeOut();
            $(this).parent().parent().slideUp();
        });

        $(".record_button").click(function() {
            var id = $(this).attr('id');
            // $("body").find is necessary here. Do not change.
            var form = $("body").find(".workout_record#"+id);
            form.slideDown();
            $(".dash_cover").fadeIn();
            $("#workout_record_duration").focus();
        });

        $(".cancel_button").click(function() {
            $(".dash_cover").fadeOut();
            $(this).parent().parent().parent().parent().slideUp();
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
                [0, 'rgba(250, 250, 250, .50)'],
                [1, 'rgba(250, 250, 250, .50)']
              ]
            }
              },
              title: {
                  text: null
              },
              xAxis: {
                categories: ['%']
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
            type: 'column'
        },
        series: [{
            name: 'Minutes',
            data: dashboard_progress_data
        }]
        });
    }



    }

});