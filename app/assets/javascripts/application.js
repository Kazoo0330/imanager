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
  nowIndicator: true,
  themeSystem: 'bootstrap4',
  header: {
  left: 'prev,next today',
  center: 'title',
  right: 'month,agendaWeek,agendaDay,listMonth'
  },

//  dayClick: function(date, jsEvent, view) {
//    alert('Click on : ' + date.format());
//    alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
//    alert('Current view: ' + view.name);

//    $(this).css('background-color', 'blue');
//  },

  businessHours: {
    dow: [0, 1, 2, 3, 5, 6],

	start: '13:30', //コアタイム開始時間
	end: '19:00',  //コアタイム終了時間
  },

  selectable: true,
  selectHelper: true,
  select: function(start, end) {
    var title = prompt('イベントを追加');
	var eventData;
	if (title) {
	  eventData = {
	    title: title,
		start: start,
		end: end,
	  };
	  $('#calendar').fullCalendar('renderEvent', eventData, true);
	}
	$('#calendar').fullCalendar('unselect');
  },

  events: '/events/events.json',
  editable: true,
  // durationEditable: Boolean, default: true,
  // weekNumbers: true,
  // eventLimit: true, // allow "more" link when too many events
  // events: 'https://fullcalendar.io/demo-events.json'
});
});
