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
                        <li><a href="course.jsp?tab=AllAssignment">Assignment</a></li>
                        <li class="active"><a href="#">งานที่ 1...</a></li>
                    </ol>
                    <div >
                        <h4 style="text-align: center">Upload you assignment</h4>
                        <form role="form" class="form-inline" style="text-align: center">
                            <input type="file" class="form-control">
                            <input type="submit" value="upload" class="form-control btn btn-primary">
                        </form>
                        <hr>
                        <h5 style="text-align: center">Previous Version</h5>
                        <table class="table">
                            <thead>
                                <tr>
                                    <td>Name</td>
                                    <td>Version</td>
                                    <td>Send Date</td>
                                    <td>Size(MB)</td>
                                </tr>
                            </thead>
                            <tbody>
                                 <tr>
                                     <td>54216952_lab1</td>
                                     <td>1</td>
                                     <td>13/03/55</td>
                                     <td>33.22</td>  
                                </tr>
                                <tr>
                                     <td>54216952_lab1</td>
                                     <td>2</td>
                                     <td>14/03/55</td>
                                     <td>31.22</td>  
                                </tr>
                                <tr>
                                     <td>54216952_lab1</td>
                                     <td>3</td>
                                     <td>14/03/55</td>
                                     <td>36.22</td>  
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <%@include file="META-INF/page/include_js.jsp" %>
</html>
