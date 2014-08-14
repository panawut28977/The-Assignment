<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@taglib uri="/WEB-INF/tlds/functions" prefix="cf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="module/fullcalendar/fullcalendar.css">
<style>
    #AllAssignemnt_wrapper{
        margin-top: 20px;
    }

    span[class^=text]{
        font-weight: bold;
    }
</style>
<c:if test="${ac.courseList.get(cId).role eq 'TH'}"> 
    <a class="btn btn-primary"  href="CreateAssignment.jsp?tab=AllAssignment" style="margin-top: 20px"><span class="glyphicon glyphicon-plus-sign"></span> Create Assignment</a>
</c:if>
<div class="table-responsive">
    <table class="table table-striped" id="AllAssignemnt">
        <thead>
            <tr>
                <th>Name</th>
                <th>Course</th>
                <th>Work on</th>
                <th>Member(s)</th>
                <th>Due Date</th>
                    <c:choose>
                        <c:when test="${ac.courseList.get(cId).role eq 'ST'}">
                        <th>Status</th>
                        <th></th>
                        </c:when>
                        <c:otherwise>
                        <th>Sent</th>
                        </c:otherwise>
                    </c:choose>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${ac.courseList.get(cId).course.assignment}" var="a">
                <tr>
                    <td><a href="assignment.jsp?tab=AllAssignment&&amId=${a.am_id}">${a.name}</a></td>
                    <td>${ac.courseList.get(cId).course.name}</td>
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
                            <td>${a.total_member} <a href="groupWork.jsp?tab=AllAssignment">join group</a></td>
                        </c:otherwise>
                    </c:choose>
                    <td>${a.due_date}</td>
                    <c:choose>
                        <c:when test="${ac.courseList.get(cId).role eq 'ST'}">
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
                            <td>
                                <a title="Send Assignment File" href="uploadAssignment.jsp?tab=AllAssignment">
                                    <span class="glyphicon glyphicon-upload"></span>
                                </a>
                            </td>
                        </c:when>
                        <c:otherwise> 
                            <td><a href="SentAssignment.jsp?tab=AllAssignment&&wkt=file">10</a></td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<hr>
<div id='calendar' style="margin-bottom: 20px"></div>
<script src="module/fullcalendar/fullcalendar.min.js"></script>
<script>

    $(document).ready(function() {
        var aTable = $('#AllAssignemnt').dataTable({
            /* Disable initial sort */
            "aaSorting": []
        });
        aTable.fnFilter('${param.st}');
        var color = '';
        var jsonArr = [];
    <c:forEach items="${ac.courseList.get(cId).course.assignment}" var="a">
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
            <c:otherwise>
        color = '#777';
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
            events: jsonArr
        });

    });

</script>