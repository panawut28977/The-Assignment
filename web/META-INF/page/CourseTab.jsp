<%@taglib prefix="ct_cf" uri="/WEB-INF/tlds/functions.tld" %>
<c:choose>
    <c:when test="${ac.courseList.get(cId).role eq 'ST'}">
        <ul class="nav nav-tabs">
            <li <c:if test="${param.tab eq null}">class="active"</c:if>><a href="CourseAnnounce">Announcement</a></li>
            <li <c:if test="${param.tab eq 'AllAssignment'}">class="active"</c:if>><a href="CourseAssignment">Assignment <span class="badge <c:if test="${leftoverInCourse == 0}">hide</c:if>">${leftoverInCourse}</span></a></li>
            <li <c:if test="${param.tab eq 'score'}">class="active"</c:if>><a href="userscore">Score</a></li>
            <li <c:if test="${param.tab eq 'member'}">class="active"</c:if>><a href="CourseMember">Member</a></li>
        </ul>   
    </c:when>   
    <c:otherwise>
        <c:set var="waitAcc" value="${ct_cf:getWaitForApproveMemberInCourse(cId)}"/>
        <ul class="nav nav-tabs">
            <li <c:if test="${param.tab eq null}">class="active"</c:if>><a href="CourseAnnounce">Announcement</a></li>
            <li <c:if test="${param.tab eq 'AllAssignment'}">class="active"</c:if>><a href="CourseAssignment">Assignment</a></li>
            <li <c:if test="${param.tab eq 'score'}">class="active"</c:if>><a href="userscore">Score</a></li>
            <li <c:if test="${param.tab eq 'member'}">class="active"</c:if>><a href="CourseMember">Member</a></li>
            <li <c:if test="${param.tab eq 'request'}">class="active"</c:if>><a href="course.jsp?tab=request">Request to join <span class="badge <c:if test="${waitAcc.size()==0}">hide</c:if>">${waitAcc.size()}</span></a></li>
        </ul> 
    </c:otherwise>
</c:choose>