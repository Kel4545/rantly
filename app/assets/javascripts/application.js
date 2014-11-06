// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).on('ready', function () {

  var client = new Keen({
    projectId: "<%= ENV['KEEN_PROJECT_ID'] %>",
    readKey: "<%= ENV['KEEN_READ_KEY'] %>"
  });
  Keen.ready(function () {

    var sign_ups = new Keen.Query("count", {
      eventCollection: "sign_ups",
      timeframe: "this_4_days",
      interval: "daily"
    });
    client.draw(sign_ups, document.getElementById("sign_ups_chart"), {
      chartType: "linechart",
      title: "Sign Ups/Day",
      colors: ["#38761d"],
      width: "auto"
    });

    var rants_per_day = new Keen.Query("count", {
      eventCollection: "rants",
      timeframe: "this_4_day",
      interval: "daily"
    });
    client.draw(rants_per_day, document.getElementById("rants_per_day_chart"), {
      chartType: "columnchart",
      title: "Rants/Day",
      colors: ["#38761d"],
      width: "auto"
    });

    var logins_per_day = new Keen.Query("count", {
      eventCollection: "logins",
      timeframe: "today",
      interval: "hourly"
    });
    client.draw(logins_per_day, document.getElementById("logins_chart"), {
      chartType: "columnchart",
      title: "Logins/Day",
      colors: ["#38761d"],
      width: "auto"
    });
  });
});


//
//
//$(document).ready(function(){
//  $('.following').click(function(){
//    $(this).toggleClass('following follow').unbind("hover");
//    if($(this).is('.follow')){
//      $(this).text("Follow");
//    }
//    else{
//      $(this).bind({
//        mouseleave:function(){$(this).text("Following");}
//      });
//    }
//  });
//});