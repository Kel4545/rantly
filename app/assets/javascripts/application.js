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
//= require turbolinks
//= require_tree .


$(document).ready(function(){
//to change the text
  $('.following').hover(function(){
    $(this).text("Unfollow");
  },function(){
    $(this).text("Following");
  });
  //for toggle the class following/follow When click
  $('.following').click(function(){
    $(this).toggleClass('following follow').unbind("hover");
    if($(this).is('.follow')){
      $(this).text("Follow");
    }
    else{
      //binding mouse hover functionality
      $(this).bind({
        mouseleave:function(){$(this).text("Following");},
        mouseenter:function(){$(this).text("Unfollow");}
      });
    }
  });
});