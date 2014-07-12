<%-- 
    Document   : home
    Created on : Apr 6, 2014, 5:08:52 PM
    Author     : JenoVa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@taglib uri="/WEB-INF/tlds/functions.tld" prefix="cf"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="META-INF/page/include_css.jsp" %>
        <%@include file="META-INF/page/include_js.jsp" %>
        <c:set var="am" value="${cf:getAmByAmID(param.amId)}" target="Model.Assignment"/>
        <title>${am.name}</title>
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
                    <c:choose>
                        <c:when test="${param.ct eq 'allAm'}">
                            <div><h3>All Course</h3></div>
                            <%@include file="META-INF/page/allCourseTab.jsp"%>
                            <ol class="breadcrumb" style="margin-top: 15px" >
                                <li><a href="home.jsp?tab=AllAssignment">Assignment</a></li>
                                <li class="active"><a href="#">${am.name}</a></li>
                            </ol>
                        </c:when>
                        <c:otherwise>
                            <%@include file="META-INF/page/CourseHeader.jsp" %>
                            <%@include file="META-INF/page/CourseTab.jsp"%>
                            <ol class="breadcrumb" style="margin-top: 15px" >
                                <li><a href="course.jsp?tab=AllAssignment">Assignment</a></li>
                                <li class="active"><a href="#">${am.name}</a></li>
                            </ol>
                        </c:otherwise>
                    </c:choose>
                    <div>
                        <h3 class="">${am.name}</h3>
                        <small class="text-muted">Created date : ${am.create_date} </small><br>   
                    </div>
                    <div class="col-md-5 well"> 
                        <c:choose>
                            <c:when test="${ac.courseList.get(cId).role eq 'TH'}">
                                <c:choose>
                                    <c:when  test="${am.ass_type eq 'file'}">
                                        <c:set value="file" var="wkt" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set value="web" var="wkt" />
                                    </c:otherwise>
                                </c:choose>
                                <a href="http://localhost:8084/TheAssignment/SendedAssignment.jsp?tab=AllAssignment&&wkt=${wkt}" style="text-align: center;text-decoration: none" class="center-block">
                                    <span class="glyphicon glyphicon-check center-block" style="font-size: 150px;margin: 40px auto;"></span><h4>Go to check : ) !</h4>
                                </a>
                            </c:when>
                            <c:when test="${am.ass_type eq 'file'}">
                                <a href="file/${am.path_file}" style="text-align: center;text-decoration: none" class="center-block">
                                    <span class="glyphicon glyphicon-file center-block" style="font-size: 150px;margin: 40px auto;"></span><h4>Download</h4>
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="onwebAssignment.jsp?tab=AllAssignment<c:if test="${param.ct eq 'allAm'}">&&ct=allAm</c:if>" style="text-align: center;text-decoration: none" class="center-block">
                                        <span class="glyphicon glyphicon-upload center-block" style="font-size: 150px;margin: 40px auto;"></span><h4>Let's do it.</h4>
                                    </a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-md-7">
                        <table class="table">
                            <tr>
                                <td><b>Due date</b></td>
                                <td>${am.due_date}<span class="text-danger pull-right"><b>Late</b></span></td>
                            </tr>
                            <tr>
                                <td><b>Description</b></td>
                                <td>${am.description} </td>
                            </tr>
                            <tr>
                                <td><b>Work on</b></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${am.ass_type eq 'file'}">
                                            <span class="glyphicon glyphicon-file"></span> File
                                        </c:when>
                                        <c:otherwise>
                                            <span class="glyphicon glyphicon-list-alt"></span> Web
                                        </c:otherwise>
                                    </c:choose>

                                </td>
                            </tr>
                            <tr>
                                <td><b>Member</b></td>
                                <td> 
                                    <c:choose>
                                        <c:when test="${am.total_member == 1}">
                                            Individual
                                        </c:when>
                                        <c:otherwise>
                                            ${am.total_member}
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <c:if test="${ac.courseList.get(cId).role eq 'TH'}">
                                    <c:choose>
                                        <c:when test="${am.ass_type eq 'file'}">
                                            <td><button class="btn btn-primary"><span class="glyphicon glyphicon-upload"></span> Update</button></td>
                                            <td><button class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Delete</button></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td><button class="btn btn-primary"><span class="glyphicon glyphicon-upload"></span> Edit</button></td>
                                            <td><button class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Delete</button></td>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                            </tr>
                        </table>
                    </div>
                    <div class="clearboth"><hr></div>  
                    <h3>Comment</h3>
                    <div class="media">
                        <a class="pull-left" href="#">
                            <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                        </a>
                        <div class="media-body">
                            <h4 class="media-heading">AJ.Kittipong Warasup<small class="pull-right">16/01/57</small></h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                        </div>
                    </div>
                    <div class="media">
                        <a class="pull-left" href="#">
                            <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                        </a>
                        <div class="media-body">
                            <h4 class="media-heading">AJ.Kittipong Warasup<small class="pull-right">16/01/57</small></h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                        </div>
                    </div>
                    <form>
                        <textarea class="form-control" placeholder="Tell your teacher here."></textarea><br>
                        <input  type="submit" value="comment" class="btn btn-primary col-md-3 pull-right">
                    </form>
                </div>
            </div>
        </div>


    </body>
    <script>
        $(function() {
            $("#pvVersionTable").hide();
            $("#pvVs").click(function() {
                $("#pvVersionTable").slideToggle();
                $(this).find("span").toggleClass("glyphicon-chevron-down");
            });
            $('.multiselect').multiselect();
        });
    </script>
</html>
