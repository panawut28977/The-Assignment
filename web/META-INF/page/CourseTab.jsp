<c:choose>
    <c:when test="${sessionScope.accType eq 'st'}">
        <ul class="nav nav-tabs">
            <li <c:if test="${param.tab eq null}">class="active"</c:if>><a href="course.jsp">Annoucement</a></li>
            <li <c:if test="${param.tab eq 'AllAssignment'}">class="active"</c:if>><a href="course.jsp?tab=AllAssignment">Assignment <span class="badge">3</span></a></li>
            <li <c:if test="${param.tab eq 'score'}">class="active"</c:if>><a href="course.jsp?tab=score">Score</a></li>
            <li <c:if test="${param.tab eq 'member'}">class="active"</c:if>><a href="course.jsp?tab=member">Member</a></li>
        </ul>   
    </c:when>
    <c:otherwise>
        <ul class="nav nav-tabs">
            <li <c:if test="${param.tab eq null}">class="active"</c:if>><a href="course.jsp">Annoucement</a></li>
            <li <c:if test="${param.tab eq 'AllAssignment'}">class="active"</c:if>><a href="course.jsp?tab=AllAssignment">Assignment <span class="badge">3</span></a></li>
            <li <c:if test="${param.tab eq 'score'}">class="active"</c:if>><a href="course.jsp?tab=score">Score</a></li>
            <li <c:if test="${param.tab eq 'member'}">class="active"</c:if>><a href="course.jsp?tab=member">Member</a></li>
            <li <c:if test="${param.tab eq 'request'}">class="active"</c:if>><a href="course.jsp?tab=request">Request to join <span class="badge">5</span></a></li>
        </ul> 
    </c:otherwise>
</c:choose>