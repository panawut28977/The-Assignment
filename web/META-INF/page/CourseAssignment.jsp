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
    <a class="btn btn-primary pull-right"  href="CreateAssignment.jsp?tab=AllAssignment" style="margin-top: 20px"><span class="glyphicon glyphicon-plus-sign"></span> Create Assignment</a>
    <br/><br/><br/>
</c:if>
<div class="table-responsive" style="min-height: 520px;">
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
                        <th style="text-align: center">Check</th>
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
                            <td>${a.total_member} 
                                <c:choose>
                                    <c:when test="${ac.courseList.get(cId).role eq 'ST'}">
                                        <a href="selectPeople?am_id=${a.am_id}">join group</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="selectPeople?am_id=${a.am_id}">see group</a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </c:otherwise>
                    </c:choose>
                    <td>${a.due_date} <c:if test="${a.due_date eq null}"> - </c:if></td>
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
                                    <c:when test="${status eq 'sent'}">
                                        <span class="text-primary">Sent <span class="glyphicon glyphicon-check"></span></span>
                                        </c:when>
                                        <c:when test="${status eq 'miss'}">
                                        <span class="text-muted">Miss</span>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>
                                <a title="Send Assignment" href="sendAssignment?am_id=${a.am_id}">
                                    <span class="glyphicon glyphicon-upload"></span>
                                </a>
                            </td>
                        </c:when>
                        <c:otherwise> 
                            <td style="text-align: center"><a href="GetSentAssignment?am_id=${a.am_id}"><i class="glyphicon glyphicon-check"></i></a></td>
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
            events: jsonArr
        });

    });

</script>