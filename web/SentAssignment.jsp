<%-- 
    Document   : home
    Created on : Apr 6, 2014, 5:08:52 PM
    Author     : JenoVa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@taglib uri="/WEB-INF/tlds/functions" prefix="cf" %>
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

            .showGroup{
                cursor: pointer;
            }
            .toolbar ,.toolbar2{
                float: left;
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
                        <li class="active"><a href="#">${am.name}</a></li>
                    </ol>
                    <div style="text-align: center;margin-top:20px ">
                        <div class="col-md-4"><a id="sentAm"><h4>${sent} <br> Sent</h4></a></div>
                        <div class="col-md-4"><h4>${checked}/${total} <br>Checked</h4></div>
                        <div class="col-md-4"><a id="leftAm"><h4>${left} <br> Leftovers</h4></a></div>
                    </div>
                    <hr style="clear:both">

                    <!-- div สำหรับแสดงการบ้านของคนที่ส่งแล้ว-->
                    <div class="sentAm">
                        <c:choose>
                            <c:when test="${sentList!=null}">
                                <table class="table table-striped" ID="SentAssignment">
                                    <thead>
                                        <tr>
                                            <th><b>Name</b></th>
                                            <th><b>Score</b></th>
                                            <th><b>Lasted Sent</b></th>
                                            <th><b>Status</b></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${sentList}" var="sentSa" >
                                            <tr>
                                                <td>
                                                    <!-- ถ้ามีกลุ่มให้แสดงค่าชื่อเป็นชื่อกลุ่มกับเลขกลุ่ม -->
                                                    <!--ถ้าไม่ใช่ให้แสดงชื่อเลย -->
                                                    <c:choose>
                                                        <c:when test="${sentSa.g_id ne 0}">
                                                            <c:set value="${cf:getNameByGIDandAmID(sentSa.g_id,sentSa.am_id)}" var="stGroup"/>
                                                            <c:set value="${cf:createPopoverGroup(stGroup)}" var="dataContent"/>
                                                            <a class="showGroup" data-toggle="popover" data-html="true" data-content="${dataContent}">Group no. ${ct_cf:getGNOById(sentSa.g_id)}</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:set value="${cf:getNameByID(sentSa.acc_id)}" var="stAcc"/>
                                                            <img class='img-circle' src='img/avatar.jpg' width='24'> ${stAcc.firstname}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${sentSa.score}/${am.fully_mark}</td>
                                                <td>
                                                    <c:set value="${cf:lastedSentStatus(sentSa.lasted_send_date, am)}" var="status"/>
                                                    <c:choose>
                                                        <c:when test="${status eq 'late'}">
                                                            <span class="text-danger">Late</span>
                                                        </c:when>
                                                        <c:when test="${status eq 'ontime'}">
                                                            <span class="text-success">On time</span>
                                                        </c:when>
                                                        <c:when test="${status eq 'hurryup'}">
                                                            <span class="text-warning">Hurry up!</span>
                                                        </c:when>
                                                        <c:when test="${status eq 'sent'}">
                                                            <span class="text-muted">Sent <span class="glyphicon glyphicon-check"></span></span>
                                                            </c:when>
                                                        </c:choose>
                                                </td>
                                                <td <c:if test="${sentSa.score != 0.0}">class="text-success"</c:if>>
                                                    <c:choose>
                                                        <c:when test="${sentSa.score == 0.0}">
                                                            Not check
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="glyphicon glyphicon-ok"></span> Checked
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td><a href="checkAssignment?tab=AllAssignment&&st_am_id=${sentSa.st_am_id}">View</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:when>
                        </c:choose>
                    </div>

                    <!-- div สำหรับแสดงกลุ่ม / คนที่ยังไม่ส่งการบ้าน -->
                    <div class="leftAm">
                        <!-- ถ้า list ของคนที่เข้าไปดูการบ้านแต่ยังไม่ส่งการบ้าน ไม่เป็น null -->
                        <c:choose>
                            <c:when test="${leftList!=null}">
                                <c:set value="" var="tableid"/>
                                <c:choose>
                                    <c:when test="${am.total_member > 1}">
                                        <c:set value="leftAssignment" var="tableid"/>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set value="wholeftAssignment" var="tableid"/>
                                    </c:otherwise>
                                </c:choose>
                                <table class="table table-striped" ID="${tableid}">
                                    <thead>
                                        <tr>
                                            <th><b>Name</b></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${leftList}" var="leftSa" >
                                            <tr>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${leftSa.g_id ne 0}">
                                                            <c:set value="${cf:getNameByGIDandAmID(leftSa.g_id,leftSa.am_id)}" var="stGroup"/>
                                                            <c:set value="${cf:createPopoverGroup(stGroup)}" var="dataContent"/>
                                                            <a class="showGroup" data-toggle="popover" data-html="true" data-content="${dataContent}">Group no. ${ct_cf:getGNOById(leftSa.g_id)}</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:set value="${cf:getNameByID(leftSa.acc_id)}" var="stAcc"/>
                                                            <img class='img-circle' src='${stAcc.profile_pic}' width='24'> ${stAcc.firstname}
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <!-- ถ้าเป็นการบ้านแบบทำด้วยตัวเองให้ไปหาชื่อของคนที่ไม่ได้เข้ามาดูการบ้าน แล้วดึงมาแสดงให้หมด -->
                                        <c:if test="${am.total_member == 1}">
                                            <c:forEach items="${leftAccId}" var="lai" >
                                                <tr>
                                                    <td>
                                                        <c:set value="${cf:getNameByID(lai)}" var="stAcc"/>
                                                        <img class='img-circle' src='${stAcc.profile_pic}' width='24'> ${stAcc.firstname}
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                    </tbody>
                                </table>
                            </c:when>
                        </c:choose>
                        <hr style="clear:both"/>

                        <!-- ถ้าเป็นการบ้านแบบกลุ่มให้แสดงชื่อของคนที่ไม่ยังไม่เข้ากลุ่มด้วย(ถ้ามี) -->
                        <c:if test="${am.total_member > 1}">
                            <c:choose>
                                <c:when test="${leftAccId!=null}">
                                    <table class="table table-striped" ID="wholeftAssignment">
                                        <thead>
                                            <tr>
                                                <th><b>Name</b></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${leftAccId}" var="lai" >
                                                <tr>
                                                    <td>
                                                        <c:set value="${cf:getNameByID(lai)}" var="stAcc"/>
                                                        <img class='img-circle' src='${stAcc.profile_pic}' width='24'> ${stAcc.firstname}
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:when>
                            </c:choose>
                        </c:if>
                        <!--                        <table class="table table-striped" ID="leftAssignment">
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
                                                            <td><a class="showGroup" data-toggle="popover" data-html="true" data-content="<img class='img-circle' src='img/avatar.jpg' width='24'> panawut <br/><img class='img-circle' width='24' src='img/avatar.jpg'> panawut <br/><img class='img-circle' src='img/avatar.jpg' width='24'> panawut <br/>">Group no. 1</a></td>
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
                                                </table>-->
                    </div>
                </div>
            </div>
        </div>
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
                $(".showGroup").popover(
                        {placement: 'top'}
                );
                var aTable = $('#SentAssignment').dataTable({
                     "bLengthChange": false
                });
                var bTable = $('#leftAssignment').dataTable({
                    "bLengthChange": false,
                    "sDom": '<"toolbar">frtip'
                });
                $("div.toolbar").html('<b>A group that have not send assignment.</b>');

                var cTable = $('#wholeftAssignment').dataTable({
                    "bLengthChange": false,
                    "sDom": '<"toolbar2">frtip'
                });
                $("div.toolbar2").html('<b>People who not have a group.</b>');
            });
        </script>
    </body>
</html>
