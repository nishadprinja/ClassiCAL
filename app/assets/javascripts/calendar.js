$(document).ready(function() {
	var coursesToBeSaved = [];

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

			//method that retrieves course info on drop - puts into an array
			coursesToBeSaved.push($(this).data('courseid'));
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
	            createDiv += '<div class="fc-event" data-courseid="' + this.id + '">'
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
        });
    });

	$.getJSON('/userscourses', function (data) {
		var coursesDiv = '';
		$.each(data, function () {
			coursesDiv += '<div class="fc-event" data-courseid="' + this.id + '">'
			coursesDiv += this.course_name + '<br> <br>'
	        coursesDiv += this.professor + '<br> <br>'
	        coursesDiv += this.location + '<br> <br>'
	        coursesDiv += this.day + '<br> <br>'
	        coursesDiv += this.time_start + ' - ' + this.time_end + '</div>'
		});
		$('#users-courses').append(coursesDiv);

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
	});

	$('#clear').on('click', function() {
		window.location = "/courses"
	});

	$('#save').on('click', function() {
		$.ajax({
            type: 'POST',
            data: {'courses': coursesToBeSaved},
            //how to make courses available in controller?
            url: '/user_courses',
            dataType: 'JSON'
        }).done(function( response ) {
        	window.location = '/courses'
 
        }).fail(function( jqXHR, textStatus ) {
            alert(jqXHR.responseText);
        });
	});	
});