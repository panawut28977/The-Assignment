<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="nav nav-tabs">
    <li <c:if test="${param.tab eq 'AllAnnouce'}">class="active"</c:if> ><a href="AllAnnounce">Annoucement</a></li>
    <li <c:if test="${param.tab eq 'AllAssignment'}">class="active"</c:if> ><a href="home.jsp?tab=AllAssignment">Assignment <span class="badge <c:if test="${ontime+hurry+late == 0}">hide</c:if>">${ontime+hurry+late}</span></a></li>
</ul>
