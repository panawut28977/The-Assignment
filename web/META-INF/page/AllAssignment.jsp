<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="cf" uri="/WEB-INF/tlds/functions.tld" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="module/fullcalendar/fullcalendar.css">
<script src="module/fullcalendar/fullcalendar.js"></script>
<script>

    $(document).ready(function() {
        var aTable = $('#AllAssignment').dataTable({
            /* Disable initial sort */
            "aaSorting": []
        });
        if ('${param.st}'.length) {
            $('html, body').animate({
                scrollTop: $("#AllAssignment_wrapper").offset().top + 560
            }, 1000);
        }

        aTable.fnFilter('${param.st}');
        var jsonArr = [];
    <c:forEach items="${ac.assignment}" var="a">
        var color = '';
        <c:set value="${cf:remainingTimeforSend(a,ac.acc_id)}" var="status"/>
        <c:choose>
            <c:when test="${status eq 'late'}">
        color = '#a94442';
            </c:when>
            <c:when test="${status eq 'ontime'}">
        color = '#3c763d';
            </c:when>
            <c:when test="${status eq 'hurryup'}">
        color = '#8a6d3b';
            </c:when>
            <c:when test="${status eq 'sent'}">
        color = '#5F8BCA';
            </c:when>
            <c:otherwise>
        color = '#999';
            </c:otherwise>
        </c:choose>
        jsonArr.push({
            id: '${a.am_id}',
            cId: '${a.course.course_id}',
            title: '${a.name}',
            start: '${a.due_date}',
            borderColor: color,
            backgroundColor: color
        });
    </c:forEach>
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        $('#calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month'
            },
            eventClick: function(calEvent, jsEvent, view) {
                location.href = "assignment.jsp?tab=AllAssignment&&amId=" + calEvent.id + "&&cId=" + calEvent.cId;
            },
            events: jsonArr
        }).find("#loader").remove();
    });
    function setCourse(course_id, am_id) {
        var nexturl = "assignment.jsp?tab=AllAssignment&&amId=" + am_id;
        var queryStringText = encodeURIComponent(nexturl);
        var url = "setCourseSession?cId=" + course_id + "&&nexturl=" + queryStringText;
        location.href = url;
    }

</script>
<style>
    #AllAssignment_wrapper{
        margin-top: 20px;
    }

    span[class^=text]{
        font-weight: bold;
    }

    #calendar{
        display: none;
    }
</style>
<div class="btn-group pull-left" style="margin: 20px 0">
    <button type="button" class="btn btn-default active" id="view_am_list"><i class="glyphicon glyphicon-list"></i></button>
    <button type="button" class="btn btn-default" id="view_am_calendar"><i class="glyphicon glyphicon-calendar"></i></button>
</div>
<div class="table-responsive" style="min-height: 520px;" id="view_list">
    <table class="table table-striped " id="AllAssignment">
        <thead>
            <tr>
                <th>Name</th>
                <th>Course</th>
                <th>Work on</th>
                <th>Member(s)</th>
                <th>Due Date</th>
                <th>Status</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${ac.assignment}" var="a">
                <tr>
                    <td><a onclick="setCourse(${a.course.course_id},${a.am_id})" class="usepointer">${a.name}</a></td>
                    <td>${a.course.name}</td>
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
                            <td>${a.total_member} <a href="selectPeople?am_id=${a.am_id}&&cId=${a.course.course_id}">join group</a></td>
                        </c:otherwise>
                    </c:choose>
                    <td>
                        <span class="formatDate"  data-date="${a.due_date}"><i class="fa fa-spinner fa-spin"></i></span><c:if test="${a.due_date eq null}"> - </c:if>
                        </td>
                        <td>
                        <c:set value="${cf:remainingTimeforSend(a,ac.acc_id)}" var="status"/>
                        <c:choose>
                            <c:when test="${status.equalsIgnoreCase('late')}">
                                <span class="text-danger">Late</span>
                            </c:when>
                            <c:when test="${status.equalsIgnoreCase('ontime')}">
                                <span class="text-success">On time</span>
                            </c:when>
                            <c:when test="${status.equalsIgnoreCase('hurryup')}">
                                <span class="text-warning">Hurry up!</span>
                            </c:when>
                            <c:when test="${status.equalsIgnoreCase('sent')}">
                                <span class="text-primary">Sent <span class="glyphicon glyphicon-check"></span></span>
                                </c:when>
                                <c:when test="${status.equalsIgnoreCase('miss')}">
                                <span class="text-muted">Miss</span>
                            </c:when>
                        </c:choose>
                    </td>
                    <td>
                        <!--                        <a title="Send Assignment File" href="uploadAssignment.jsp?ct=allAm&&tab=AllAssignment">
                                                    <span class="glyphicon glyphicon-upload"></span>
                                                </a>-->
                        <a title="Send Assignment" href="sendAssignment?am_id=${a.am_id}&&cId=${a.course.course_id}">
                            <span class="glyphicon glyphicon-upload"></span>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<!--<hr id='calendar-line-break'/>-->
<div id='calendar' style="margin-bottom: 20px;margin-top: 30px">
    <div class="text-center" id="loader"><i class="fa fa-spinner fa-5x fa-spin"></i></div>
</div>