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
                    <div><h3>INT202 Software Development Process II</h3></div>
                    <ul class="nav nav-tabs">
                        <li><a href="course.jsp">Annoucement</a></li>
                        <li class="active"><a href="course.jsp?tab=AllAssignment">Assignment <span class="badge">3</span></a></li>
                    </ul>
                    <ol class="breadcrumb" style="margin-top: 15px" >
                        <li><a href="course.jsp">Assignment</a></li>
                        <li class="active"><a href="#">งานที่ 1...</a></li>
                    </ol>
                    <div style="text-align: center">
                        <h4>Upload you assignment</h4>
                        <form role="form" class="form-inline">
                            <input type="file" class="form-control">
                            <input type="submit" value="upload" class="form-control">
                        </form>
                        <hr>
                        <h5>Previous Version</h5>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <%@include file="META-INF/page/include_js.jsp" %>
    <script type="text/javascript" >
        $(document).ready(function() {
            var aTable = $('#AllAssignemnt').dataTable();
            aTable.fnFilter('${param.st}');
        });
    </script>
</html>
