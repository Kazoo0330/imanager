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
 
$('#calendar').fullCalendar({
//カレンダーのデフォルト表示とテーマを設定
  defaultView: 'agendaWeek',
  themeSystem: 'bootstrap4',
  header: {
  left: 'prev,next today',
  center: 'title',
  right: 'month,agendaWeek,agendaDay,listMonth'
  },

  dayClick: function(date, jsEvent, view) {
    alert('Click on : ' + date.format());
    alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
    alert('Current view: ' + view.name);

    $(this).css('background-color', 'blue');
  },

  weekNumbers: true,
  eventLimit: true, // allow "more" link when too many events
  events: 'https://fullcalendar.io/demo-events.json'
});

});

