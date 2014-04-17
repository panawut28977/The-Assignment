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
        <title>Course ...</title>
    </head>
    <body>
        <%@include file="META-INF/page/header_bar.jsp"%>
        <div class="container">
            <div class="row">
                <%@include file="META-INF/page/side_bar.jsp"%>
                <div class="col-md-9">
                    <div><h3>INT202 Software Development Process II </h3></div>
                    <%@include file="META-INF/page/courseTab.jsp" %>
                    <c:choose>
                        <c:when test="${param.tab eq 'AllAssignment'}">
                            <%@include file="META-INF/page/CourseAssignment.jsp" %>
                        </c:when>
                        <c:when test="${param.tab eq 'member'}">
                            <%@include file="META-INF/page/Member.jsp" %>
                        </c:when>
                        <c:otherwise>
                            <%@include file="META-INF/page/CourseAnnouce.jsp" %>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </body>
    <script type="text/javascript" >
        $(document).ready(function() {
            var aTable = $('#AllAssignemnt').dataTable();
            aTable.fnFilter('${param.st}');
        });
    </script>
</html>
