<%-- 
    Document   : home
    Created on : Apr 6, 2014, 5:08:52 PM
    Author     : JenoVa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="/WEB-INF/tlds/functions.tld" prefix="cf" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="META-INF/page/include_css.jsp" %>
        <%@include file="META-INF/page/include_js.jsp" %>
        <title>Group work</title>
        <style>
            .media:hover{
                border: #40D47E solid thin;
                cursor: pointer;
                box-shadow: #40D47E;
            }

            .media{
                height: 100px;
                padding-top: 5px;
                padding-bottom: 5px;
            }

            .media:first-child{
                margin-top: 15px;
            }
            .media,.media-body{
                overflow: visible !important;
            }

            .member-selected{
                position: absolute;
                margin-top: 20px;
                margin-left: 40px;
                font-size: 30px;
            }

            .listOfGroupWork img{
                margin-top: 3px;
                margin-bottom:3px;
            }

            .listOfGroupWork tbody tr{
                font-size: 40px;
            }

            .listOfGroupWork tbody tr td:first-child{
                width: 60px;
            }
        </style>
    </head>
    <body>
        <%@include file="META-INF/page/header_bar.jsp"%>
        <div class="container">
            <div class="row">
                <%@include file="META-INF/page/side_bar.jsp"%>
                <div class="col-md-9" style="padding-bottom: 20px">
                    <%--<c:choose>
                        <c:when test="${param.ct eq 'allAm'}">
                            <div><h3>All Course</h3></div>
                            <%@include file="META-INF/page/allCourseTab.jsp"%>
                            <ol class="breadcrumb" style="margin-top: 15px" >
                                <li><a href="home.jsp?tab=AllAssignment">Assignment</a></li>
                                <li class="active"><a href="#">Member</a></li>
                            </ol>
                        </c:when>
                        <c:otherwise>
                            <%@include file="META-INF/page/CourseHeader.jsp"%>
                            <%@include file="META-INF/page/CourseTab.jsp"%>
                            <ol class="breadcrumb" style="margin-top: 15px" >
                                <li><a href="course.jsp?tab=AllAssignment">Assignment</a></li>
                                <li class="active"><a href="#">Member</a></li>
                            </ol>
                        </c:otherwise>
                    </c:choose>--%>
                    <%@include file="META-INF/page/CourseHeader.jsp"%>
                    <%@include file="META-INF/page/CourseTab.jsp"%>
                    <ol class="breadcrumb" style="margin-top: 15px" >
                        <li><a href="course.jsp?tab=AllAssignment">Assignment</a></li>
                        <li class="active"><a href="#">Member</a></li>
                    </ol>
                    <c:choose>
                        <c:when test="${ac.courseList.get(cId).role eq 'TH' || msg eq 'joined'}">
                            <c:if test="${msg eq 'joined'}">
                                <div class="bg-primary" style="margin-bottom: 10px;padding: 10px">
                                    <h3> You are in group.</h3>
                                </div>
                            </c:if>
                            <div class="col-md-7 bg-success" style="padding-top: 10px;padding-bottom: 10px;">
                                <h4><b>People who joined group</b></h4>
                                <div class="table-responsive">
                                    <table class="table listOfGroupWork" >
                                        <tbody>
                                            <c:forEach items="${gList}" var="g">
                                                <tr>
                                                    <td><b>${g.g_no}</b></td>
                                                    <td>
                                                        <c:forEach var="splt" items="${fn:split(g.acc_id, ',')}">
                                                            <c:set value="${cf:getNameByID(splt)}" var="m" /> 
                                                            <img style="width:50px" src="${m.profile_pic}" data-toggle="tooltip" data-placement="top" title="${m.firstname}">
                                                        </c:forEach>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <!--                                            <tr>
                                                                                            <td><b>1</b></td>
                                                                                            <td>
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Christopher Clive">
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Cherokee Graham">
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Panawut Ittitananun!">
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td><b>2</b></td>
                                                                                            <td>
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Panawut Ittitananun!">
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Lon Zach">
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Shaunte Sowa">
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Harry Haig">
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Joanne Cockburn">
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td><b>3</b></td>
                                                                                            <td>
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Christopher Clive">
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Cherokee Graham">
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Panawut Ittitananun!">
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td><b>4</b></td>
                                                                                            <td>
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Christopher Clive">
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Cherokee Graham">
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Panawut Ittitananun!">
                                            
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Cherokee Graham">
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Panawut Ittitananun!">
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td><b>5</b></td>
                                                                                            <td>
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Christopher Clive">
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Cherokee Graham">
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Panawut Ittitananun!">
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Cherokee Graham">
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Panawut Ittitananun!">
                                            
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Cherokee Graham">
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Panawut Ittitananun!">
                                            
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td><b>6</b></td>
                                                                                            <td>
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Christopher Clive">
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Cherokee Graham">
                                                                                                <img style="width:50px" src="img/avatar.jpg" data-toggle="tooltip"  id="checkcopy" data-placement="top" title="Panawut Ittitananun!">
                                                                                            </td>
                                                                                        </tr>-->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-5" >
                                <div class="col-md-11 col-md-offset-1 bg-danger" style="padding-top: 10px;padding-bottom: 10px;">
                                    <h4><b>People who have not group.</b></h4>
                                    <c:forEach items="${noGMember}" var="noGm">
                                        <img style="width:50px" src="${noGm.profile_pic}" data-toggle="tooltip"  data-placement="top" title="${noGm.firstname} ${noGm.lastname}">&nbsp;
                                    </c:forEach>

                                </div>
                            </div>
                        </c:when>
                        <c:when test="${ac.courseList.get(cId).role eq 'ST'}">
                            <div style="text-align: center">
                                <span class="text-danger"><h3>Select your group member</h3></span>
                                <hr>
                                <c:forEach items="${noGMember}" var="m">
                                    <div class="media col-md-4" id="<c:if test="${m.acc_id == ac.acc_id}">youracc</c:if>" data-id="${m.acc_id}">
                                        <img width="64" src="${m.profile_pic}">
                                        <div class="media-body">
                                            <h4 class="media-heading" >${m.firstname} ${m.lastname}</h4>
                                        </div>
                                    </div>
                                </c:forEach>
                                <!--                                <div class="media col-md-4">
                                                                    <img width="64" src="img/avatar.jpg">
                                                                    <div class="media-body">
                                                                        <h4 class="media-heading" >Panawut Ittitananun</h4>
                                                                    </div>
                                                                </div>
                                                                <div class="media col-md-4">
                                                                    <img width="64" src="img/avatar.jpg">
                                                                    <div class="media-body">
                                                                        <h4 class="media-heading">Thanakit Mahamutjinda</h4>
                                                                    </div>
                                                                </div>
                                                                <div class="media col-md-4">
                                                                    <img width="64" src="img/avatar.jpg">
                                                                    <div class="media-body">
                                                                        <h4 class="media-heading">Nitiwit Wungwiwatna</h4>
                                                                    </div>
                                                                </div>
                                                                <div class="media col-md-4">
                                                                    <img width="64" src="img/avatar.jpg">
                                                                    <div class="media-body">
                                                                        <h4 class="media-heading">Thanapan Suwankanit</h4>
                                                                    </div>
                                                                </div>
                                                                <div class="media col-md-4">
                                                                    <img width="64" src="img/avatar.jpg">
                                                                    <div class="media-body">
                                                                        <h4 class="media-heading" >Panawut Ittitananun</h4>
                                                                    </div>
                                                                </div>
                                                                <div class="media col-md-4">
                                                                    <img width="64" src="img/avatar.jpg">
                                                                    <div class="media-body">
                                                                        <h4 class="media-heading">Thanakit Mahamutjinda</h4>
                                                                    </div>
                                                                </div>
                                                                <div class="media col-md-4">
                                                                    <img width="64" src="img/avatar.jpg">
                                                                    <div class="media-body">
                                                                        <h4 class="media-heading" >Panawut Ittitananun</h4>
                                                                    </div>
                                                                </div>
                                                                <div class="media col-md-4">
                                                                    <img width="64" src="img/avatar.jpg">
                                                                    <div class="media-body">
                                                                        <h4 class="media-heading">Thanakit Mahamutjinda</h4>
                                                                    </div>
                                                                </div>-->
                                <div style="clear: both;padding-top: 20px;">
                                    <form action="addMember" id="groupmember" method="post">
                                        <label><h4><span id="count"></span> seleted</h4> </label><br>
                                        <input type="hidden" id="acc_id" name="acc_id" value=""/>
                                        <input type="submit" value="Submit !" class="btn btn-primary"/>
                                    </form>
                                </div>
                            </div>
                        </c:when>
                    </c:choose>

                </div>
            </div>
        </div>
        <script>
            $(function() {
                var max_member = '${am.total_member}';
                var count = 0;
                var iconok = '<span class="text-success"><i class="member-selected glyphicon glyphicon-ok-circle"></i></span>';

                $(".media[id='youracc'] div").prepend(iconok);
                var oldv = $("#youracc").attr("data-id");
                $("#acc_id").val(oldv);
                count++;

                $(".media[id='youracc']").click(function() {
                    alert("Cannot check out your own.");
                });

                $("#groupmember").submit(function() {
                    if (confirm("Cannot change your group member later, If you sure press yes")) {
                        return  true;
                    } else {
                        return false;
                    }
                });
                $(".media[id!='youracc']").click(function() {
                    if ($(this).find("div .member-selected").length == 0) {
                        if (count == max_member) {
                            alert("Max Member in group !");
                            return false;
                        }
                        $(this).find("div").prepend(iconok);
                        var oldv = "";
                        if ($("#acc_id").val().length == 0) {
                            oldv = $(this).attr("data-id");
                        } else {
                            oldv = $("#acc_id").val() + "," + $(this).attr("data-id");
                        }
                        $("#acc_id").val(oldv);
                        count++;
                    } else {
                        $(this).find("div .member-selected").remove();
                        var id = $(this).attr("data-id");
                        var acc_id = $("#acc_id").val().split(",");
                        var newv = "";
                        for (var i = 0; i < acc_id.length; i++) {
                            if (acc_id[i] != id) {
                                newv += "," + acc_id[i];
                            }
                        }
                        $("#acc_id").val(newv.slice(1, newv.length));
                        count--;
                    }
                    $("#count").text(count);
                });
                $('img').tooltip("hide");
            });
        </script>
    </body>
</html>
