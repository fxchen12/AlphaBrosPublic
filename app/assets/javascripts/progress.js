$(function() {

    if ($("#progress_graph").length) {

        $('#progress_graph').highcharts({
        chart: {
            type: 'column'
        },
        series: [{
            name: 'Minutes',
            data: progress_data
        }]
    });
    }
});