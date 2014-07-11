<ul class="nav nav-tabs">
    <li <c:if test="${param.tab eq null}">class="active"</c:if> ><a href="home.jsp">Annoucement</a></li>
    <li <c:if test="${param.tab eq 'AllAssignment'}">class="active"</c:if> ><a href="home.jsp?tab=AllAssignment">Assignment <span class="badge">${ac.assignment.size()}</span></a></li>
</ul>
