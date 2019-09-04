$(document).ready(function() {
   jQuery.ajax({   
      url: 'scheduleRead'
      , method: 'POST'
      ,cache : false
      ,dataType : "json"
      ,success: function(resp) {
         if(resp.length!=0){
            $.each(resp, function(i, cafe){
               var resernum = cafe.resernum
               var cafename = cafe.cafename
               var reserDate = cafe.reserDate
               var reserTime = cafe.reserTime
               var events = [];   
               for (var i = 0; i < resp.length; i++) {
                  events.push( {title: resp[i].cafename, url: 'http://10.10.8.18:8888/projectEC/menu/reserconfirm?resernum='+resp[i].resernum, start: resp[i].reserDate+"T"+resp[i].reserTime} )
            	  /*events.push( {title: resp[i].cafename, url: 'http://localhost:8888/projectEC/menu/reserconfirm?resernum='+resp[i].resernum, start: resp[i].reserDate+"T"+resp[i].reserTime} )*/
               }
              
               $('#calendar-example-1').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },
                    editable: true,
                    
                    
                    events: events
                    
                    
                });
            });
         } else{
               $('#calendar-example-1').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    }
               });
            }
            
   }
   ,error : function(e) {
      console.log(e);
    }

   });
   

    /*for(i=0; i<resp.length;i++){
   }*/
    /* initialize the external events
      -----------------------------------------------------------------*/

    $('#external-events div.external-event').each(function() {

        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
        // it doesn't need to have a start or end
        var eventObject = {
            title: $.trim($(this).text()) // use the element's text as the event title
        };

        // store the Event Object in the DOM element so we can get to it later
        $(this).data('eventObject', eventObject);

        // make the event draggable using jQuery UI
        $(this).draggable({
            zIndex: 999,
            revert: true, // will cause the event to go back to its
            revertDuration: 0 //  original position after the drag
        });

    });


    /* initialize the calendar
      -----------------------------------------------------------------*/

});