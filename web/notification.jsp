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
        <title>Course ...</title>
    </head>
    <body>
        <%@include file="META-INF/page/header_bar.jsp"%>
        <div class="container">
            <div class="row">
                <%@include file="META-INF/page/side_bar.jsp"%>
                <div class="col-md-9">
                    <div><h3>${param.nt}</h3></div>
                    <c:choose>
                        <c:when test="${param.nt eq 'Announcement'}">
                            <%@include file="META-INF/page/notify_announcement.jsp" %>
                        </c:when>
                        <c:when test="${param.nt eq 'Assignment'}">
                            <%@include file="META-INF/page/notify_assignment.jsp" %>
                        </c:when>
                        <c:when test="${param.nt eq 'Alert'}">
                            <%@include file="META-INF/page/notify_alert.jsp" %>
                        </c:when>
                        <c:when test="${param.nt eq 'Score'}">
                            <%@include file="META-INF/page/notify_score.jsp" %>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>
    </body>
    <%@include file="META-INF/page/include_js.jsp" %>
</html>