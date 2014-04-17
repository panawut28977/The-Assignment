<ul class="nav nav-tabs">
    <li <c:if test="${param.tab eq null}">class="active"</c:if>><a href="course.jsp">Annoucement</a></li>
<li <c:if test="${param.tab eq 'AllAssignment'}">class="active"</c:if>><a href="course.jsp?tab=AllAssignment">Assignment <span class="badge">3</span></a></li>
<li <c:if test="${param.tab eq 'member'}">class="active"</c:if>><a href="course.jsp?tab=member">Member</a></li>
</ul> 
