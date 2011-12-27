// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
  $("#listing_food_category_name").tokenInput("/food_categories.json", {
    crossDomain: false,
    prePopulate: $("#listing_food_category_name").data("pre"),
    theme: "facebook"
  });
});

$(function (){
 $('#event_event_starting_on').datepicker();
    dateFormat: "yy-mm-dd"
 });

$(function(){
  $("#event_event_ending_on").datepicker({
    dateFormat: "yy-mm-dd"
  });
});

$(document).ready(function(){
  $('input.ui-datepicker').datepicker();
});
