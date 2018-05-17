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
  var CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
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
	durationEditable: Boolean, default: true,
  weekNumbers: true,
	eventLimit: true, // allow "more" link when too many events
  businessHours: {
    dow: [0, 1, 2, 3, 5, 6],
	  start: '13:30', //コアタイム開始時間
	  end: '19:00',  //コアタイム終了時間
  },
  editable: true,
  selectable: true,
  selectHelper: true,
  select: function(start, end) {
    console.log(start)
    var title = prompt('イベントを追加');
	var eventData;
	if (title) {
	  eventData = {
	    title: title,
			start: start,
			end: end,
	  };
		// debugger
		 $.ajax({
           type: "POST",
           url: "/events",
           dataType: "script",
		   		 data: {
			authenticity_token: CSRF_TOKEN,
			event: {
				title: title,
				start: start.format("YYYY-MM-DD HH:mm:ssZ"),
				end: end.format("YYYY-MM-DD HH:mm:ssZ"),
				appointment_id: 2
			}
		  },
		 });
	  $('#calendar').fullCalendar('renderEvent', eventData, true);
	}
	$('#calendar').fullCalendar('unselect');
  },
  events: '/appointments/appointments.json',
  timeFormat: 'H(:mm)', // uppercase H for 24-hour clock
  });
});

//  events: {
//    url: '/events',
//	type: 'POST',
//	data: {
//	  _token: CSRF_TOKEN,
//	  title: 'string',
//	  start: 'dateTime',
//	  end: 'dateTime'
//	},
//	error: function() {
//	  alert('there was an error while fetching events!');
//	},
// 	color: 'yellow',
//	textColor: 'black'
//  }

//  '/events/events.json',


  // events: 'https://fullcalendar.io/demo-events.json'
//  });


//});
