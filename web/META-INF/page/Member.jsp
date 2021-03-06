<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <c:if test="${ac.courseList.get(cId).role eq 'ST'}">
        <div class="col-md-12" style="margin-top: 12px;">
            <button class="pull-right btn btn-default" id="leavecourse">Leave course</button>
        </div>
    </c:if>
    <c:set var="count" value="0"/>
    <c:set var="coutall" value="0"/>
    <c:if test="${changeRoleMsg eq 'false'}">
        <c:set value="" var="changeRoleMsg" scope="session" />
        <h3 class="text-warning">Can't remove teacher. You are only one teacher in course.</h3>
    </c:if>
    <c:forEach items="${requestScope.listStudent}" var="st">
        <c:set value="${coutall+1}" var="coutall"/>
        <c:if test="${count==0}">
            <div  class="row">
            </c:if>
            <div class="media col-md-4">
                <img width="64" src="${st.profile_pic}" class="pull-left">
                <div class="media-body">
                    <c:set var="role" value="${cf:getAccountRole(st.acc_id, cId)}"/>
                    <div class="media-heading" ><h4>${st.firstname} ${st.lastname} <c:if test="${role eq 'TH'}"> <span class="label label-primary pull-right" style="font-size: 12px">Teacher</span></c:if></h4></div>
                    <c:if test="${ac.courseList.get(cId).role eq 'TH'}">
                        <span class="dropdown pull-right usersetting">
                            <a class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span></a>
                            <ul class="dropdown-menu">
                                <c:choose >
                                    <c:when test="${role eq 'TH'}">
                                        <li><a class="removeTH" data-id="${st.acc_id}">Remove as Teacher</a></li>
                                        </c:when>
                                        <c:when test="${st.account_type eq 'TH'}">
                                        <li><a class="makeTH" data-id="${st.acc_id}">Make as Teacher</a></li>
                                        </c:when>
                                    </c:choose>
                                <li><a class="kick" data-id="${st.acc_id}">Remove from course</a></li>
                            </ul>
                        </span>
                    </c:if>
                    <br>
                    <small class="pull-right text-muted">Joined date : ${cf:getApprovedTime(st.acc_id, cId)} &nbsp;</small>
                </div>
            </div>
            <c:set value="${count+1}" var="count"/>
            <c:if test="${count==3 or coutall == requestScope.listStudent.size()}">
            </div>
            <c:set value="0" var="count"/>
        </c:if>
    </c:forEach>
    <hr style="clear: both"/>
    <div>
        <h3 class="text-muted">Who not coming yet.</h3>
    </div>
    <c:if test="${requestScope.whoNotJoin.size()==0}">
        <div class="row">
            <h3 class="text-muted" style="text-align: center;clear: both">No people who not coming in.</h3>
        </div>
    </c:if>
    <c:forEach items="${requestScope.whoNotJoin}" var="nj">
        <c:if test="${count==0}">
            <div  class="row">
            </c:if>
            <div class="media col-md-4">
                <img width="64" src="${nj.profile_pic}" class="pull-left">
                <div class="media-body">
                    <div class="media-heading" ><h4 class="text-muted">${nj.firstname} ${nj.lastname}</h4></div>
                </div>
            </div>
            <c:set value="${count+1}" var="count"/>
            <c:if test="${count==3 or count == requestScope.listStudent.size()}">
            </div>
            <c:set value="0" var="count"/>
        </c:if>
    </c:forEach>

</div>
<style>
    .media:first-child{
        margin-top: 15px;
    }
    .media,.media-body{
        overflow: visible !important;
    }
</style>
<script>
    $(function() {
        $(".makeTH").click(function() {
            var acc_id = $(this).attr("data-id");
            if (confirm('As a Teacher, They will be able to edit course settings, remove members and give other members teacher status.?')) {
                location.href = "makeTeacher?acc_id=" + acc_id;
            }
        });
        $(".removeTH").click(function() {
            var acc_id = $(this).attr("data-id");
            if (confirm('You will remove as a teacher.?')) {
                location.href = "removeTeacher?acc_id=" + acc_id;
            }
        });

        $(".kick").click(function() {
            var acc_id = $(this).attr("data-id");
            if (confirm('You will student from your course?')) {
                location.href = "removeStudent?acc_id=" + acc_id;
            }
        });
        $("#leavecourse").click(function() {
            if (confirm("You want to leave course sure?")) {
                location.href = "leaveCourse?acc_id=${ac.acc_id}";
            }
        });
    });
</script>