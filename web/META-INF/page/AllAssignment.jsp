<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="cf" uri="/WEB-INF/tlds/functions.tld" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="module/fullcalendar/fullcalendar.css">
<style>
    #AllAssignment_wrapper{
        margin-top: 20px;
    }

    span[class^=text]{
        font-weight: bold;
    }
</style>
<div id='calendar' style="margin-bottom: 20px;margin-top: 30px"></div>
<hr/>
<div class="table-responsive" style="min-height: 520px;">
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
                    <td><a href="assignment.jsp?ct=allAm&&tab=AllAssignment&&amId=${a.am_id}&&cId=${a.course.course_id}">${a.name}</a></td>
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
                    <td>${a.due_date} <c:if test="${a.due_date eq null}"> - </c:if></td>
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
                            <c:when test="${status eq 'sent'}">
                                <span class="text-primary">Sent <span class="glyphicon glyphicon-check"></span></span>
                                </c:when>
                                <c:when test="${status eq 'miss'}">
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
<script src="module/fullcalendar/fullcalendar.min.js"></script>
<script>

    $(document).ready(function() {
        var aTable = $('#AllAssignment').dataTable({
            /* Disable initial sort */
            "aaSorting": []
        });
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
            editable: true,
            events: jsonArr,
        });

    });

</script>