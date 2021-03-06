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
//= require jquery.purr
//= require jquery_ujs
//= require best_in_place
//= require best_in_place.purr
//= require twitter/bootstrap
//= require rickshaw_with_d3
//= require bootstrap
//= require cbpAnimatedHeader
//= require classie
//= require d3.v2
//= require rickshaw
//= require active_admin
//= require freelancer

$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
});