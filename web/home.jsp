<%-- 
    Document   : home
    Created on : Apr 6, 2014, 5:08:52 PM
    Author     : JenoVa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="META-INF/page/include_css.jsp" %>
        <%@include file="META-INF/page/include_js.jsp" %>
        <title>Welcome</title>
    </head>
    <body>
        <!--${ac}-->
        <c:set value="" var="cId" scope="session"/>
        <%@include file="META-INF/page/header_bar.jsp"%>
        <div class="container">
            <div class="row">
                <%@include file="META-INF/page/side_bar.jsp"%>
                <div class="col-md-9">
                    <c:choose>
                        <c:when test="${param.tab eq 'AllAssignment'}">
                            <div><h3>All Course Assignment </h3></div>
                        </c:when>
                        <c:when test="${param.tab eq 'AllAnnouce'}">
                            <div><h3>All Course Announce</h3></div>
                        </c:when>
                    </c:choose>
                    <%@include file="META-INF/page/allCourseTab.jsp" %>
                    <c:choose>
                        <c:when test="${param.tab eq 'AllAssignment'}">
                            <%@include file="META-INF/page/AllAssignment.jsp" %>
                        </c:when>
                        <c:when test="${param.tab eq 'AllAnnouce'}">
                            <%@include file="META-INF/page/AllAnnouce.jsp" %>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>
        <!--        <a href="setSession.jsp?acct=th"><span>teacher mode</span></a>
                 <a href="setSession.jsp?acct=st"><span>student mode</span></a>-->
    </body>
</html>
