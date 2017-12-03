// $('#calendar').fullCalendar({
//   header: {
//         left: 'prev,next today',
//         center: 'title',
//         right: 'month,agendaWeek,agendaDay'
//       }
// });
var initialize_calendar;
initialize_calendar = function() {
  $('#calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      selectable: true,
      selectHelper: true,
      editable: true,
      eventLimit: true,

      
    });
  })
};
// $(document).ready(initialize_calendar);
// $(document).on('page:load', initialize_calendar);
$(document).on('turbolinks:load', initialize_calendar);
