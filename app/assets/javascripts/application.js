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
//= require jquery-1.8.3.min
//= require jquery_ujs
//= require jquery.mobile-1.2.1.min
//= require vote

var ready = function(){
  $("#UserCode").bind("focus", function(){
    var iUserCode=$("#UserCode").val();
    if(iUserCode.toUpperCase()=='Ericsson Corporate ID'.toUpperCase())
      {
        $("#UserCode").val("") ;
      }
      var o=document.getElementById("UserCode");
      o.style.color='#666666';
  })
  $("#UserCode").bind("blur", function(){
    var iUserCode=$("#UserCode").val();
    if(iUserCode=='')
      {
        $("#UserCode").val('Ericsson Corporate ID');
      }
      var o=document.getElementById("UserCode");
      o.style.color='#c8c8c8';
  })
}

function refreshPage() {
  $.mobile.changePage(
    window.location.href,
    {
      allowSamePageTransition : true,
      transition              : 'none',
      showLoadMsg             : true,
      reloadPage              : true
    }
  );
}