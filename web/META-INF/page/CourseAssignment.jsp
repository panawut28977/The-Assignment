<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="module/fullcalendar/fullcalendar.css">
<link rel="stylesheet" href="module/fullcalendar/fullcalendar.print.css">
<style>
    #AllAssignemnt_wrapper{
        margin-top: 20px;
    }
    
    span[class^=text]{
        font-weight: bold;
    }
</style>
<table class="table table-striped" id="AllAssignemnt">
    <thead>
        <tr>
            <td>Name</td>
            <td>Course</td>
            <td>Due Date</td>
            <td>Work on</td>
            <td>Member</td>
            <td>Status</td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>งานที่ 1 .....</td>
            <td><a href="assignment.jsp?tab=AllAssignment&&wo=f">INT202 Software Development Process II</a></td>
            <td>31/2/2554</td>
            <td>File</td> 
            <td>Individual</td>
            <td><span class="text-danger">Late</span></td>
            <td><a title="Send Assignment File" href="uploadAssignment.jsp?tab=AllAssignment"><span class="glyphicon glyphicon-upload"></span></a></td>
        </tr>
         <tr>
            <td>งานที่ 2 .....</td>
            <td><a href="assignment.jsp?tab=AllAssignment&&wo=f">INT202 Software Development Process II</a></td>
            <td>13/01/2554</td>
            <td>File</td>
            <td>Group(2)</td>
            <td><span class="text-success">on time</span></td>
            <td><a title="Send Assignment File" href="uploadAssignment.jsp?tab=AllAssignment"><span class="glyphicon glyphicon-upload"></span></a></td>
        </tr>
         <tr>
            <td>งานที่ 3 .....</td>
            <td><a href="assignment.jsp?tab=AllAssignment">INT202 Software Development Process II</a></td>
            <td>13/08/2556</td>
            <td>On Web</td>
            <td>Group(3)</td>
            <td><span class="text-success">on time</span></td>
            <td><a   href="onwebAssignment.jsp?tab=AllAssignment" title="Do it on web"><span class="glyphicon glyphicon-upload"></span></a></td>
        </tr>
    </tbody>
</table>
<hr>
<div id='calendar' style="margin-bottom: 20px"></div>
<script src="module/fullcalendar/fullcalendar.min.js"></script>
<script>

	$(document).ready(function() {
	
		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			editable: true,
			events: [
				{
					title: 'All Day Event',
					start: new Date(y, m, 1)
				},
				{
					title: 'Long Event',
					start: new Date(y, m, d-5),
					end: new Date(y, m, d-2)
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d-3, 16, 0),
					allDay: false
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: new Date(y, m, d+4, 16, 0),
					allDay: false
				},
				{
					title: 'Meeting',
					start: new Date(y, m, d, 10, 30),
					allDay: false
				},
				{
					title: 'Lunch',
					start: new Date(y, m, d, 12, 0),
					end: new Date(y, m, d, 14, 0),
					allDay: false
				},
				{
					title: 'Birthday Party',
					start: new Date(y, m, d+1, 19, 0),
					end: new Date(y, m, d+1, 22, 30),
					allDay: false
				},
				{
					title: 'Click for Google',
					start: new Date(y, m, 28),
					end: new Date(y, m, 29),
					url: 'http://google.com/'
				}
			]
		});
		
	});

</script>