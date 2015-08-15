$(document).ready(function() {

	/* initialize the external events
	-----------------------------------------------------------------*/

$('#external-events .fc-event').each(function() {

		// store data so the calendar knows to render an event upon drop
		$(this).data('event', {
			title: $.trim($(this).text()), // use the element's text as the event title
			stick: true // maintain when user navigates (see docs on the renderEvent method)
		});

		// make the event draggable using jQuery UI
		$(this).draggable({
			zIndex: 999,
			revert: true,      // will cause the event to go back to its
			revertDuration: 0  //  original position after the drag
		});

	});


	/* initialize the calendar
	-----------------------------------------------------------------*/

	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		editable: true,
		droppable: true, // this allows things to be dropped onto the calendar
		drop: function() {
			// is the "remove after drop" checkbox checked?
			if ($('#drop-remove').is(':checked')) {
				// if so, remove the element from the "Draggable Events" list
				$(this).remove();
			}
		}
	});

	// FINDS CHANGE IN SELECT, LOADS CONSEQEUNT COURSES AS EVENTS
	// -----------------------------------------------------------------
	$('#dept-select').on('change', function () {
		$('#courses').empty();
        var id = $(this).val();
        var createDiv = '';

        // ACTUAL SINGLE COURSE DIV
        $.getJSON( '/deptcourses/' + id, function(data) {
	        $.each(data, function () {
	            createDiv += '<div class="fc-event" data–courseid="' + this.id + '">'
	            createDiv += this.course_name + '<br> <br>' 
	            createDiv += this.professor + '<br> <br>'
	            createDiv += this.location + '<br> <br>'
	            createDiv += this.day + '<br> <br>'
	            createDiv += this.time_start + ' - ' + this.time_end + '</div>'
	        });
	            $('#courses').append(createDiv)

				    $('#external-events .fc-event').each(function() {

						// store data so the calendar knows to render an event upon drop
						$(this).data('event', {
							title: $.trim($(this).text()), // use the element's text as the event title
							stick: true // maintain when user navigates (see docs on the renderEvent method)
						});

						// make the event draggable using jQuery UI
						$(this).draggable({
							zIndex: 999,
							revert: true,      // will cause the event to go back to its
							revertDuration: 0  //  original position after the drag
						});

					});
            //Object {id: 1, name: "Drew Brees", handSizeInches: 10, created_at: "2015-08-03T15:02:10.751Z", updated_at: "2015-08-03T15:02:10.751Z"}

            // For each item in our JSON, add a table row and cells to the content string
            // $.each(data, function(){
            //     tableContent += '<tr>';
            //     tableContent += '<td>' + this.name + '</td>';
            //     tableContent += '<td>' + this.handSizeInches + '</td>';
            //     tableContent += '<td><a href="#" class="linkEditPlayer" data-id="' + this.id + '">edit</a></td>';
            //     tableContent += '<td><a href="#" class="linkDeletePlayer" data-id="' + this.id + '">delete</a></td>';
            //     tableContent += '</tr>';
            // });

            // Inject the whole content string into our existing HTML table
        });
    });

});