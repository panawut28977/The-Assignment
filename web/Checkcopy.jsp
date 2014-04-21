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
        <style>
            #pvVs{
                text-align: center;
                background-color: #F5F5F5;
                padding: 10px 0;
            }

            .q_no{
                font-size: 20px;
                font-weight: bold;
            }

            #input_score .row{
                padding-top: 5px;
                padding-bottom: 5px;
            }

            .assignmentBox input[type="number"]{
                margin-left: 10px;
                margin-right: 10px;
            } 
        </style>
    </head>
    <body>
        <%@include file="META-INF/page/header_bar.jsp"%>
        <div class="container">
            <div class="row">
                <%@include file="META-INF/page/side_bar.jsp"%>
                <div class="col-md-9" style="padding-bottom: 20px">
                    <%@include file="META-INF/page/CourseHeader.jsp" %>
                    <%@include file="META-INF/page/CourseTab.jsp"%>
                    <ol class="breadcrumb" style="margin-top: 15px" >
                        <li><a href="course.jsp?tab=AllAssignment">Assignment</a></li>
                        <li><a href="SendedAssignment.jsp?tab=AllAssignment">งานที่ 1.....</a></li>
                        <li><a href="CheckAssignment.jsp?tab=AllAssignment">Check งานที่ 1.....</a></li>
                        <li class="active"><a href="#">Check copy งานที่ 1.....</a></li>
                    </ol>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th><b>Name</b></th>
                                <th><b>Like</b></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>natus error</td>
                                <td>1.10</td>
                                <td><a href="">See</a></td>
                            </tr>
                            <tr>
                                <td>natus error</td>
                                <td>1.10</td>
                                <td><a href="">See</a></td>
                            </tr>
                            <tr>
                                <td>natus error</td>
                                <td>1.10</td>
                                <td><a href="">See</a></td>
                            </tr>
                            <tr>
                                <td>oluptatem accusantium</td>
                                <td>0.5</td>
                                <td><a href="">See</a></td>
                            </tr>
                            <tr>
                                <td>oluptatem accusantium</td>
                                <td>0.5</td>
                                <td><a href="">See</a></td>
                            </tr>
                            <tr>
                                <td>oluptatem accusantium</td>
                                <td>0.5</td>
                                <td><a href="">See</a></td>
                            </tr>
                            <tr>
                                <td>denouncing ple</td>
                                <td>0.44</td>
                                <td><a href="">See</a></td>
                            </tr> 
                            
                        </tbody>
                    </table> 
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function() {
                var aTable = $('#SendedAssignment').dataTable();
                $('#checkcopy').tooltip("hide");
            });
        </script>
    </body>
</html>
