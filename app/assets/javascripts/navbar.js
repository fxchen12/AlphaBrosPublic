$(function() {

    //Check if there is a 'quotes' class on document
    if ($(".navbar").length) {

        if ($(".dashboard_container").length) {
            $(".nav_element.d a").html("<strong>Dashboard</strong>").removeAttr("href");
        } else if ($(".goals_container").length){
            $(".nav_element.g a").html("<strong>Goals</strong>").removeAttr("href");
        } else if ($(".progress_container").length){
            $(".nav_element.p a").html("<strong>Progress</strong>").removeAttr("href");
        } else if ($(".achievements_container").length){
            $(".nav_element.a a").html("<strong>Achievements</strong>").removeAttr("href");
        }
    }
});