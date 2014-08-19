<%-- 
    Document   : home
    Created on : Apr 6, 2014, 5:08:52 PM
    Author     : JenoVa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@taglib uri="/WEB-INF/tlds/functions.tld" prefix="cf" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="META-INF/page/include_css.jsp" %>
        <%@include file="META-INF/page/include_js.jsp" %>
        <title>Upload Assignment</title>
        <style>
            #pvVs{
                text-align: center;
                background-color: #F5F5F5;
                padding: 10px 0;
            }

            #newComment{
                display: none;
            }
        </style>
    </head>
    <body>
        <%@include file="META-INF/page/header_bar.jsp"%>
        <div class="container">
            <div class="row">
                <%@include file="META-INF/page/side_bar.jsp"%>
                <div class="col-md-9" style="padding-bottom: 20px">
                    <!--<c:choose>
                        <c:when test="${param.ct eq 'allAm'}">
                            <div><h3>All Course</h3></div>
                            <%@include file="META-INF/page/allCourseTab.jsp"%>
                            <ol class="breadcrumb" style="margin-top: 15px" >
                                <li><a href="home.jsp?tab=AllAssignment">Assignment</a></li>
                                <li class="active"><a href="#">Assignment# 1...</a></li>
                            </ol>
                        </c:when>
                        <c:otherwise>
                            <div><h3>INT202 Software Development Process II</h3></div>
                            <%@include file="META-INF/page/CourseTab.jsp"%>
                            <ol class="breadcrumb" style="margin-top: 15px" >
                                <li><a href="course.jsp?tab=AllAssignment">Assignment</a></li>
                                <li class="active"><a href="#">Assignment# 1...</a></li>
                            </ol>
                        </c:otherwise>
                    </c:choose>-->
                    <div><h3>${ac.courseList.get(cId).course.name}</h3></div>
                    <%@include file="META-INF/page/CourseTab.jsp"%>
                    <ol class="breadcrumb" style="margin-top: 15px" >
                        <li><a href="course.jsp?tab=AllAssignment">Assignment</a></li>
                        <li class="active"><a href="#">Assignment# 1...</a></li>
                    </ol>
                    <div >
                        <div  class="pull-left">
                            <c:choose>
                                <c:when test="${curAm.total_member==1}">
                                    <h4>Individual work</h4>
                                    <div class="member">
                                        <img width="64" src="${ac.profile_pic}">
                                        <h4>${ac.firstname} ${ac.lastname}</h4>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <h4>Group work</h4>
                                    <c:forEach items="${gAm}" var="m">
                                        <div class="member">
                                            <img width="64" src="${m.profile_pic}">
                                            <h4>${m.firstname} ${m.lastname}</h4>
                                        </div>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <hr style="clear: both">
                        <div style="text-align: center"> 
                            <h4 >Send your assignment <span class="text-danger">(Late)</span></h4>
                            <form role="form" class="form-inline">
                                <input type="file" class="form-control">
                                <input type="submit" value="Upload" class="form-control btn btn-primary">
                            </form>
                            <br>
                            <h5 id="pvVs" class="usepointer">See your previous version.<span class="glyphicon glyphicon-chevron-right"></span></h5>
                        </div>
                        <div id="pvVersionTable">
                            <table class="table" >
                                <thead>
                                    <tr>
                                        <td>Name</td>
                                        <td>Version</td>
                                        <td>Sent date</td>
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
                    <br><hr>  
                    <h3>Comment</h3>
                    <form>
                        <textarea class="form-control" placeholder="Tell your teacher and friends here." id="text"></textarea><br>
                        <input type="button" value="comment"  id="addComment" class="btn btn-primary col-md-3 pull-right">
                    </form>
                    <br/><br/><br/>
                    <div id="listComment">
                        <c:forEach items="${sa.comment}" var="c">
                            <div class="media">
                                <a class="pull-left" href="#">
                                    <img width="64" src="${c.acc.profile_pic}">
                                </a>
                                <div class="media-body">
                                    <h4 class="media-heading">${c.acc.firstname} ${c.acc.lastname}<small class="pull-right">${cf:formatTime(c.comment_date)}</small></h4>
                                    <p>${c.text}<p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
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
            $("#addComment").click(function() {
                var pic = '${ac.profile_pic}';
                var fullname = '${ac.firstname}' + '${ac.lastname}';
                var d = new Date();
                var dateSt = d.getFullYear() + "-" + ('0' + (d.getMonth() + 1)).slice(-2) + "-" + ('0' + d.getDate()).slice(-2) + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getMilliseconds();
                $.ajax({
                    type: "POST",
                    url: "commentStAm",
                    data: {text: $("#text").val()}
                }).done(function(msg) {
                    var html = '<div class="media" id="newComment"><a class="pull-left" href="#"><img class="img-circle" width="64" src="' + pic + '"></a><div class="media-body"><h4 class="media-heading">' + fullname + '<small class="pull-right">' + dateSt + '</small></h4><p>' + $("#text").val() + '</p></div></div>';
                    $("#listComment").prepend(html);
                    $("#newComment").slideDown().removeAttr("id");
                    $("#text").val("");
                });
            });
        });
    </script>
</html>
