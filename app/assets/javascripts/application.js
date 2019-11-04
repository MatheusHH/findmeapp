// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap_sb_admin_base_v2
//= require data-confirm-modal
//= require confirm-modal
//= require cocoon
//= require cocoon_callbacks
//= require bootbox
//= require chartkick
//= require Chart.bundle
//= require turbolinks
//= require_tree .



function getLocation(event) {
  event.preventDefault();	
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(showPosition);
  } else {
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function showPosition(position) {

  var lat = position.coords.latitude;
  var long = position.coords.longitude;

  $("#latitude-field").val(lat);
  $("#longitude-field").val(long);
}
