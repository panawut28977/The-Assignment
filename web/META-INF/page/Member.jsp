<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <c:if test="${sac.courseList.get(cId).role eq 'ST'}">
        <div class="col-md-12" style="margin-top: 12px;">
            <button class="pull-right btn btn-default">Leave course</button>
        </div>
    </c:if>
    <c:forEach items="${ac.courseList.get(cId).course.listStudent}" var="st">
        <div class="media col-md-4">
            <img width="64" src="${st.profile_pic}" class="pull-left">
            <div class="media-body">
                <h4 class="media-heading" >${st.firstname} ${st.lastname}</h4>
                <c:if test="${ac.courseList.get(cId).role eq 'TH'}">
                    <span class="dropdown pull-right">
                        <a class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span></a>
                        <ul class="dropdown-menu">
                            <li><a  data-toggle="modal" data-target="#create_course" title="create course">Make Teacher</a></li>
                            <li><a  data-toggle="modal" data-target="#join_course" title="join course">Remove form course</a></li>
                        </ul>
                    </span>
                </c:if>
                <br>
                <small class="pull-right text-muted">Join date : ${ac.courseList.get(cId).approved_date}</small>
            </div>
        </div>
    </c:forEach>
<style>
    .media:first-child{
        margin-top: 15px;
    }
    .media,.media-body{
        overflow: visible !important;
    }
</style>