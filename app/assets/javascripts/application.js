//= require rails-ujs
//= require turbolinks
//= require rails-ujs
//= require jquery/dist/jquery.js
//= require bootstrap/dist/js/bootstrap.min
//= require moment
//= require fullcalendar
//= require_tree .


$(document).on('turbolinks:load', function() {
  console.log("It works on each visit!");
	$('#calendar').fullCalendar();
});
