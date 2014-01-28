$(function() {

    if ($("#progress_graph").length) {

        $('#metric_form input[name=metric]').change(function(){
            // Adds other form to this one before submitting
            $.each( $('#time_range_form select').serializeArray(), function ( i, obj ) {
                $('<input type="hidden">').prop( obj ).appendTo( $('#metric_form') );
            });
            $('#metric_form').submit();
        });

        $('#time_range_form select').change(function(){
            // Adds other form to this one before submitting
            $.each( $('#metric_form input[name=metric]').serializeArray(), function ( i, obj ) {
                $('<input type="hidden">').prop( obj ).appendTo( $('#time_range_form') );
            });
            $('#time_range_form').submit();
        });

        $('#progress_graph').highcharts({
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
              text: range_combo + ' History'
            },
            xAxis: {
              categories: descending_range,
              title: {
                text: x_text
              }
            },
            tooltip: {
              headerFormat:"{point.key} {range_word}(s) ago<br>"
            },
            yAxis: {
                min: 0,
                title: {
                    text: y_text
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

        $('#progress_cumulative_graph').highcharts({
            chart: {
                backgroundColor: {
                  linearGradient: [0, 0, 500, 500],
                  stops: [
                    [0, 'rgba(250, 250, 250, 0)'],
                    [1, 'rgba(250, 250, 250, 0)']
                  ]
                }
            },
            title: {
              text: range_combo + ' Cumulative History'
            },
            xAxis: {
              categories: descending_range,
              title: {
                text: x_text
              }
            },
            tooltip: {
              headerFormat:"{point.key} {range_word}(s) ago<br>"
            },
            yAxis: {
                min: 0,
                title: {
                    text: y_text
                }
            },
            series: [{
                name: 'Current Activity',
                data: dashboard_cumulative_progress_data
            },
            {
                name: 'All Activities',
                data: dashboard_cumulative_total_data
            }]
        });
    }
});