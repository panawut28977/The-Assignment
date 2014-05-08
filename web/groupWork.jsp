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
                                <li class="active"><a href="#">select member</a></li>
                            </ol>
                        </c:when>
                        <c:otherwise>
                            <div><h3>INT202 Software Development Process II</h3></div>
                            <%@include file="META-INF/page/CourseTab.jsp"%>
                            <ol class="breadcrumb" style="margin-top: 15px" >
                                <li><a href="course.jsp?tab=AllAssignment">Assignment</a></li>
                                <li class="active"><a href="#">select member</a></li>
                            </ol>
                        </c:otherwise>
                    </c:choose>
                    <div style="text-align: center">
                        <span class="text-danger"><h3>Select your group member</h3></span>
                        <hr>
                        <div class="media col-md-4">
                            <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                            <div class="media-body">
                                <h4 class="media-heading" >Panawut Ittitananun</h4>
                            </div>
                        </div>
                        <div class="media col-md-4">
                            <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                            <div class="media-body">
                                <h4 class="media-heading">Thanakit Mahamutjinda</h4>
                            </div>
                        </div>
                        <div class="media col-md-4">
                            <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                            <div class="media-body">
                                <h4 class="media-heading">Nitiwit Wungwiwatna</h4>
                            </div>
                        </div>
                        <div class="media col-md-4">
                            <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                            <div class="media-body">
                                <h4 class="media-heading">Thanapan Suwankanit</h4>
                            </div>
                        </div>
                        <div class="media col-md-4">
                            <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                            <div class="media-body">
                                <h4 class="media-heading" >Panawut Ittitananun</h4>
                            </div>
                        </div>
                        <div class="media col-md-4">
                            <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                            <div class="media-body">
                                <h4 class="media-heading">Thanakit Mahamutjinda</h4>
                            </div>
                        </div>
                        <div class="media col-md-4">
                            <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                            <div class="media-body">
                                <h4 class="media-heading" >Panawut Ittitananun</h4>
                            </div>
                        </div>
                        <div class="media col-md-4">
                            <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                            <div class="media-body">
                                <h4 class="media-heading">Thanakit Mahamutjinda</h4>
                            </div>
                        </div>
                        <div style="clear: both;padding-top: 20px;">
                            <form action="" id="groupmember">
                                <label><h4><span id="count"></span> seleted</h4> </label><br>
                                <input type="submit" value="Submit !" class="btn btn-primary">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(function() {
                var count = 0;
                $(".media").click(function() {
                    var iconok = ' <span class="text-success"><i class="member-selected glyphicon glyphicon-ok-circle"></i></span>';
                    var hiddenVar ='<input type="hidden" name="member" value="1">'
                    if ($(this).find("div .member-selected").length == 0) {
                        $(this).find("div").prepend(iconok);
                        $("#groupmember").append(hiddenVar);
                        count++;
                    }else{
                         $(this).find("div .member-selected").remove();
                        $("#groupmember").find("input[value='1']").remove();
                        count--;
                    }
                    $("#count").text(count);
                });
            });
        </script>
    </body>
</html>
