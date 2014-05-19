<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<c:if test="${sessionScope.accType eq 'th'}"> 
    <a class="btn btn-primary"  href="CreateAssignment.jsp?tab=AllAssignment" style="margin-top: 20px"><span class="glyphicon glyphicon-plus-sign"></span> Create Assignment</a>
</c:if>
<div class="table-responsive">
    <table class="table table-striped" id="AllAssignemnt">
        <thead>
            <tr>
                <th>Name</th>
                <th>Course</th>
                <th>Due Date</th>
                <th>Work on</th>
                <th>Member(s)</th>
                <th>Status</th>
                    <c:choose>
                        <c:when test="${sessionScope.accType eq 'st'}">
                        <th></th>
                        </c:when>
                        <c:otherwise>
                        <th>Sent</th>
                        </c:otherwise>
                    </c:choose>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><a href="assignment.jsp?tab=AllAssignment&&wo=f">Assignment# 1</a></td>
                <td>INT202 Software Development Process II</td>
                <td>31/2/2554</td>
                <td><i class="glyphicon glyphicon-file"></i> File</td> 
                <td>Individual</td>
                <td><span class="text-danger">Late</span></td>
                <td>
                    <c:choose>
                        <c:when test="${sessionScope.accType eq 'st'}">
                            <a title="Send Assignment File" href="uploadAssignment.jsp?tab=AllAssignment">
                                <span class="glyphicon glyphicon-upload"></span>
                            </a>
                        </c:when>
                        <c:otherwise><a href="SendedAssignment.jsp?tab=AllAssignment&&wkt=file">10</a></c:otherwise>
                    </c:choose> 
                </td>
            </tr>
            <tr>
                <td><a href="assignment.jsp?tab=AllAssignment&&wo=f">Assignment# 2 .....</a></td>
                <td>INT202 Software Development Process II</td>
                <td>13/01/2554</td>
                <td><i class="glyphicon glyphicon-file"></i> File</td>
                <td><a href="groupWork.jsp?tab=AllAssignment">2</a></td>
                <td><span class="text-success">on time</span></td>
                <td>
                    <c:choose>
                        <c:when test="${sessionScope.accType eq 'st'}">
                            <a title="Send Assignment File" href="uploadAssignment.jsp?tab=AllAssignment">
                                <span class="glyphicon glyphicon-upload"></span>
                            </a>
                        </c:when>
                        <c:otherwise><a href="SendedAssignment.jsp?tab=AllAssignment&&wkt=file">5</a></c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr>
                <td><a href="assignment.jsp?tab=AllAssignment">Assignment# 3 .....</a></td>
                <td>INT202 Software Development Process II</td>
                <td>13/08/2556</td>
                <td><i class="glyphicon glyphicon-list-alt"></i> Web</td>
                <td><a href="groupWork.jsp?tab=AllAssignment">3</a></td>
                <td><span class="text-success">on time</span></td>
                <td>
                    <c:choose>
                        <c:when test="${sessionScope.accType eq 'st'}">
                            <a href="onwebAssignment.jsp?tab=AllAssignment" title="Do it on web">
                                <span class="glyphicon glyphicon-upload"></span>
                            </a>
                        </c:when>
                        <c:otherwise><a href="SendedAssignment.jsp?tab=AllAssignment&&wkt=web">10</a></c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </tbody>
    </table>
</div>
<hr>
<div id='calendar' style="margin-bottom: 20px"></div>
<script src="module/fullcalendar/fullcalendar.min.js"></script>
<script>

    $(document).ready(function() {
        var aTable = $('#AllAssignemnt').dataTable();
        aTable.fnFilter('${param.st}');

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
                    title: 'Assignment# 1 ..... - INT202 Software Development Process II',
                    start: date
                },
                {
                    title: 'Assignment# 2 ..... - INT202 Software Development Process II',
                    start: new Date(y, m, d - 5),
                },
                {
                    title: 'Assignment# 3 ..... - INT202 Software Development Process II',
                    start: new Date(y, m, d - 3, 16, 0),
                }
            ]
        });

    });

</script>