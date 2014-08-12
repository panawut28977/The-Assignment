<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <c:if test="${ac.courseList.get(cId).role eq 'ST'}">
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
                            <c:choose >
                                <c:when test="${cf:getAccountRole(st.acc_id, cId) eq 'TH'}">
                                    <li><a class="removeTH" data-id="${st.acc_id}">Remove as Teacher</a></li>
                                    </c:when>
                                    <c:otherwise>
                                    <li><a class="makeTH" data-id="${st.acc_id}">Make as Teacher</a></li>
                                    </c:otherwise>
                                </c:choose>
                            <li><a class="kick" data-id="${st.acc_id}">Remove form course</a></li>
                        </ul>
                    </span>
                </c:if>
                <br>
                <small class="pull-right text-muted">Join date : ${cf:getApprovedTime(st.acc_id, cId)}</small>
            </div>
        </div>
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
    });
</script>