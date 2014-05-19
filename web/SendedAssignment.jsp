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
                        <li class="active"><a href="#">Assignment# 1....</a></li>
                    </ol>
                    <div style="text-align: center;margin-top:20px ">
                        <div class="col-md-4"><h4>12 <br> Sent</h4></div>
                        <div class="col-md-4"><h4>6/12 <br>Checked</h4></div>
                        <div class="col-md-4"><h4>30 <br> Leftovers</h4></div>
                    </div>
                    <hr style="clear:both">
                    <table class="table table-striped" ID="SendedAssignment">
                        <thead>
                            <tr>
                                <th><b>Name</b></th>
                                <th><b>Score</b></th>
                                <th><b>Sent</b></th>
                                <th><b>Status</b></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Panawut Ittitananun</td>
                                <td>10/10</td>
                                <td><span class="text-success">on time</span></td>
                                <td class="text-success"><span class="glyphicon glyphicon-ok"></span> Checked</td>
                                <td><a href="CheckAssignment.jsp?tab=AllAssignment">View</a></td>
                            </tr>
                            <tr>
                                <td>Thanakit Mahamutjinda</td>
                                <td>0/10</td>
                                <td><span class="text-success">on time</span></td>
                                <td>Not check</td>
                                <td><a href="CheckAssignment.jsp?tab=AllAssignment">View</a></td>
                            </tr>
                            <tr>
                                <td>Nitiwit Wungwiwatna</td>
                                <td>0/10</td>
                                <td><span class="text-danger">Late</span></td>
                                <td>Not check</td>
                                <td><a href="CheckAssignment.jsp?tab=AllAssignment">View</a></td>
                            </tr> 
                            <tr>
                                <td>Thanapan Suwankanit</td>
                                <td>7/10</td>
                                <td><span class="text-success">on time</span></td>
                                <td class="text-success"><span class="glyphicon glyphicon-ok"></span> checked</td>
                                <td><a href="CheckAssignment.jsp?tab=AllAssignment">View</a></td>
                            </tr>
                            <tr>
                                <td>Panawut Ittitananun</td>
                                <td>10/10</td>
                                <td><span class="text-danger">Late</span></td>
                                <td class="text-success"><span class="glyphicon glyphicon-ok"></span> Checked</td>
                                <td><a href="CheckAssignment.jsp?tab=AllAssignment">View</a></td>
                            </tr>
                            <tr>
                                <td>Steven Gerrard</td>
                                <td>0/10</td>
                                <td><span class="text-danger">Late</span></td>
                                <td>Not check</td>
                                <td><a href="CheckAssignment.jsp?tab=AllAssignment">View</a></td>
                            </tr>
                            <tr>
                                <td>Luis Suarez</td>
                                <td>0/10</td>
                                <td><span class="text-danger">Late</span></td>
                                <td>Not check</td>
                                <td><a href="CheckAssignment.jsp?tab=AllAssignment">View</a></td>
                            </tr> 
                            <tr>
                                <td>Filipe Coutinho</td>
                                <td>7/10</td>
                                <td><span class="text-success">on time</span></td>
                                <td class="text-success"><span class="glyphicon glyphicon-ok"></span> checked</td>
                                <td><a href="CheckAssignment.jsp?tab=AllAssignment">View</a></td>
                            </tr><tr>
                                <td>Kolo Toure</td>
                                <td>10/10</td>
                                <td><span class="text-danger">Late</span></td>
                                <td class="text-success"><span class="glyphicon glyphicon-ok"></span> Checked</td>
                                <td><a href="CheckAssignment.jsp?tab=AllAssignment">View</a></td>
                            </tr>
                            <tr>
                                <td>Charlette Lemon</td>
                                <td>0/10</td>
                                <td><span class="text-success">on time</span></td>
                                <td>Not check</td>
                                <td><a href="CheckAssignment.jsp?tab=AllAssignment">View</a></td>
                            </tr>
                            <tr>
                                <td>Marcy Mathis</td>
                                <td>0/10</td>
                                <td><span class="text-danger">Late</span></td>
                                <td>Not check</td>
                                <td><a href="CheckAssignment.jsp?tab=AllAssignment">View</a></td>
                            </tr> 
                            <tr>
                                <td>Rheba Leto</td>
                                <td>7/10</td>
                                <td><span class="text-success">on time</span></td>
                                <td class="text-success"><span class="glyphicon glyphicon-ok"></span> checked</td>
                                <td><a href="CheckAssignment.jsp?tab=AllAssignment">View</a></td>
                            </tr>
                        </tbody>
                    </table> 
                </div>
            </div>
        </div>
        <c:set var="wkt" value="${param.wkt}" scope="session" />
        <script>
            $(document).ready(function() {
                var aTable = $('#SendedAssignment').dataTable();
            });
        </script>
    </body>
</html>
