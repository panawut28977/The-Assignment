<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@taglib uri="/WEB-INF/tlds/functions" prefix="cf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="module/fullcalendar/fullcalendar.css">
<script src="module/fullcalendar/fullcalendar.js"></script>
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
            <c:when test="${ac.courseList.get(cId).role eq 'TH'}">
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
        color = '#999';
                    </c:when>
                    <c:otherwise>
        color = '#999';
                    </c:otherwise>
                </c:choose>
        jsonArr.push({
            id: '${a.am_id}',
            title: '${a.name}',
            start: '${a.due_date}',
            borderColor: color,
            backgroundColor: color
        });
            </c:when>
            <c:when test="${ac.courseList.get(cId).role eq 'ST'}">
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
            title: '${a.name}',
            start: '${a.due_date}',
            borderColor: color,
            backgroundColor: color
        });
            </c:when>
        </c:choose>
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
                location.href = "assignment.jsp?tab=AllAssignment&&amId=" + calEvent.id;
            },
            events: jsonArr

        }).find("#loader").remove();

    });

</script>
<style>
    #AllAssignemnt_wrapper{
        margin-top: 20px;
    }

    span[class^=text]{
        font-weight: bold;
    }

    #calendar{
        display: none;
    }
</style>
<c:if test="${ac.courseList.get(cId).role eq 'TH'}"> 
    <a class="btn btn-primary pull-right"  href="CreateAssignment.jsp?tab=AllAssignment" style="margin-top: 20px"><span class="glyphicon glyphicon-plus-sign"></span> Create Assignment</a>
    <br/><br/><br/>
</c:if>
<div class="btn-group pull-right" style="margin: 20px 0;clear: both">
    <button type="button" class="btn btn-default active" id="view_am_list"><i class="glyphicon glyphicon-list"></i></button>
    <button type="button" class="btn btn-default" id="view_am_calendar"><i class="glyphicon glyphicon-calendar"></i></button>
</div>
<div class="table-responsive" style="min-height: 520px;" id="view_list">
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
                    <td> <span class="formatDate" data-date="${a.due_date}"><i class="fa fa-spinner fa-spin"></i></span></td>
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
<div id='calendar' style="margin-bottom: 20px;margin-top: 30px">
    <div class="text-center" id="loader"><i class="fa fa-spinner fa-5x fa-spin"></i></div>
</div>