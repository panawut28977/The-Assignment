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

            .leftAm{
                display: none;
            }

            #leftAm,#sentAm{
                cursor: pointer;
                text-decoration: none;
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
                        <div class="col-md-4"><a id="sentAm"><h4>12 <br> Sent</h4></a></div>
                        <div class="col-md-4"><h4>6/12 <br>Checked</h4></div>
                        <div class="col-md-4"><a id="leftAm"><h4>30 <br> Leftovers</h4></a></div>
                    </div>
                    <hr style="clear:both">
                    <div class="sentAm">
                        <table class="table table-striped" ID="SentAssignment">
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
                    <div class="leftAm">
                        <table class="table table-striped" ID="leftAssignment">
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
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <c:set var="wkt" value="${param.wkt}" scope="session" />
        <script>
            $(document).ready(function() {
                $("#sentAm").click(function() {
                    $(".sentAm").show();
                    $(".leftAm").hide();
                });
                $("#leftAm").click(function() {
                    $(".leftAm").show();
                    $(".sentAm").hide();
                });
                var aTable = $('#SentAssignment').dataTable();
                var bTable = $('#leftAssignment').dataTable();
            });
        </script>
    </body>
</html>
