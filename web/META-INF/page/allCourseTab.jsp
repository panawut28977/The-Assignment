<ul class="nav nav-tabs">
    <li <c:if test="${param.tab eq 'AllAnnouce'}">class="active"</c:if> ><a href="home.jsp?tab=AllAnnouce">Annoucement</a></li>
    <li <c:if test="${param.tab eq 'AllAssignment'}">class="active"</c:if> ><a href="home.jsp?tab=AllAssignment">Assignment <span class="badge">${ontime+hurry+late}</span></a></li>
</ul>
