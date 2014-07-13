<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="cf" uri="/WEB-INF/tlds/functions.tld" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="module/fullcalendar/fullcalendar.css">
<link rel="stylesheet" href="module/fullcalendar/fullcalendar.print.css">
<style>
    #AllAssignment_wrapper{
        margin-top: 20px;
    }

    span[class^=text]{
        font-weight: bold;
    }
</style>
<div class="table-responsive">
    <table class="table table-striped " id="AllAssignment">
        <thead>
            <tr>
                <th>Name</th>
                <th>Course</th>
                <th>Due Date</th>
                <th>Work on</th>
                <th>Member(s)</th>
                <th>Status</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${ac.assignment}" var="a">
                <tr>
                    <td><a href="assignment.jsp?ct=allAm&&tab=AllAssignment&&amId=${a.am_id}">${a.name}</a></td>
                    <td>${a.course.name}</td>
                    <td>${a.due_date}</td>
                    <c:choose>
                        <c:when test="${a.ass_type eq 'file'}">
                            <td><i class="glyphicon glyphicon-file"></i> File</td> 
                        </c:when>
                        <c:otherwise>
                            <td><i class="glyphicon glyphicon-list-alt"></i> Web</td>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${a.total_member == 1}">
                            <td>Individual</td>
                        </c:when>
                        <c:otherwise>
                            <td><a href="groupWork.jsp?ct=allAm&&tab=AllAssignment">${a.total_member}</a></td>
                            </c:otherwise>
                        </c:choose>
                    <td>
                        <c:set value="${cf:remainingTimeforSend(a,ac.acc_id)}" var="status"/>
                        <c:choose>
                            <c:when test="${status eq 'late'}">
                                <span class="text-danger">Late</span>
                            </c:when>
                            <c:when test="${status eq 'ontime'}">
                                <span class="text-success">On time</span>
                            </c:when>
                            <c:when test="${status eq 'hurryup'}">
                                <span class="text-warning">Hurry up!</span>
                            </c:when>
                            <c:otherwise>
                                <span class="text-muted">Sent <span class="glyphicon glyphicon-check"></span></span>
                                </c:otherwise>
                            </c:choose>
                    </td>
                    <td><a title="Send Assignment File" href="uploadAssignment.jsp?ct=allAm&&tab=AllAssignment"><span class="glyphicon glyphicon-upload"></span></a></td>
                </tr>
            </c:forEach>
            <!--            <tr>
                            <td><a href="assignment.jsp?ct=allAm&&tab=AllAssignment&&wo=f">Assignment# 1 .....</a></td>
                            <td>INT206 Software Development Process II</td>
                            <td>11/05/2557</td>
                            <td><i class="glyphicon glyphicon-file"></i> File</td> 
                            <td>Individual</td>
                            <td><span class="text-danger">Late</span></td>
                            <td><a title="Send Assignment File" href="uploadAssignment.jsp?ct=allAm&&tab=AllAssignment"><span class="glyphicon glyphicon-upload"></span></a></td>
                        </tr>
                        <tr>
                            <td><a href="assignment.jsp?ct=allAm&&tab=AllAssignment&&wo=f">Assignment# 2 .....</a></td>
                            <td>INT206 Software Development Process II</td>
                            <td>18/05/2557</td>
                            <td><i class="glyphicon glyphicon-file"></i> File</td>
                            <td><a href="groupWork.jsp?ct=allAm&&tab=AllAssignment">2</a></td>
                            <td><span class="text-success">on time</span></td>
                            <td><a title="Send Assignment File" href="uploadAssignment.jsp?ct=allAm&&tab=AllAssignment"><span class="glyphicon glyphicon-upload"></span></a></td>
                        </tr>
                        <tr>
                            <td><a href="assignment.jsp?ct=allAm&&tab=AllAssignment">Assignment# 3 .....</a></td>
                            <td>INT206 Software Development Process II</td>
                            <td>22/05/2557</td>
                            <td><i class="glyphicon glyphicon-list-alt"></i> Web</td>
                            <td><a href="groupWork.jsp?ct=allAm&&tab=AllAssignment">3</a></td>
                            <td><span class="text-success">on time</span></td>
                            <td><a href="onwebAssignment.jsp?ct=allAm&&tab=AllAssignment" title="Do it on web"><span class="glyphicon glyphicon-upload"></span></a></td>
                        </tr>
                        <tr>
                            <td><a href="assignment.jsp?ct=allAm&&tab=AllAssignment&&wo=f">Assignment# 1 .....</a></td>
                            <td>INT103 Office</td>
                            <td>25/05/2557</td>
                            <td><i class="glyphicon glyphicon-file"></i> File</td>
                            <td>Individual</td>
                            <td><span class="text-warning">Hurry up</td>
                            <td><a title="Send Assignment File" href="uploadAssignment.jsp?ct=allAm&&tab=AllAssignment"><span class="glyphicon glyphicon-upload"></span></a></td>
                        </tr>
                        <tr>
                            <td><a href="assignment.jsp?ct=allAm&&tab=AllAssignment&&wo=f">Assignment# 2 .....</a></td>
                            <td>INT103 Office</td>
                            <td>7/05/2557</td>
                            <td><i class="glyphicon glyphicon-file"></i> File</td>
                            <td>Individual</td>
                            <td><span class="text-muted">Sent <span class="glyphicon glyphicon-check"></span></span></td>
                            <td><a title="Send Assignment File" href="uploadAssignment.jsp?ct=allAm&&tab=AllAssignment"><span class="glyphicon glyphicon-upload"></span></a></td>
                        </tr>
                        <tr>
                            <td><a href="assignment.jsp?ct=allAm&&tab=AllAssignment">Assignment# 3 .....</a></td>
                            <td>INT103 Office</td>
                            <td>2/05/2557</td>
                            <td><i class="glyphicon glyphicon-list-alt"></i> Web</td>
                            <td><a href="groupWork.jsp?ct=allAm&&tab=AllAssignment">5</a></td> 
                            <td><span class="text-success">on time</span></td>
                            <td><a  href="onwebAssignment.jsp?ct=allAm&&tab=AllAssignment" title="Do it on web"><span class="glyphicon glyphicon-upload" ></span></a></td>
                        </tr>-->
        </tbody>
    </table>
</div>
<hr>
<div id='calendar' style="margin-bottom: 20px"></div>
<script src="module/fullcalendar/fullcalendar.min.js"></script>
<script>

    $(document).ready(function() {
        var aTable = $('#AllAssignment').dataTable();
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
                    title: 'Assignment# 1 ..... - INT206 Software Development Process II',
                    start: date
                },
                {
                    title: 'Assignment# 2 ..... - INT206 Software Development Process II',
                    start: new Date(y, m, d - 5),
                },
                {
                    title: 'Assignment# 3 ..... - INT206 Software Development Process II',
                    start: new Date(y, m, d - 3, 16, 0),
                },
                {
                    title: 'Assignment# 2 ..... - INT103 Office',
                    start: new Date(y, m, d + 4, 16, 0),
                },
                {
                    title: 'Assignment# 1 .... - INT103 Office',
                    start: new Date(y, m, d, 10, 30),
                },
                {
                    title: 'Assignment# 3 .... - INT103 Office',
                    start: new Date(y, m, d, 12, 0),
                }
            ]
        });

    });

</script>