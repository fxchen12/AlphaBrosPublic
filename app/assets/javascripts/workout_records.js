$(function() {
    if ($("#workout_record_date").length) {
      $('#workout_record_date').datepicker({dateFormat: "yy-mm-dd"},{defaultDate: 0});
    }
});