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
        <c:set var="am" value="${cf:getAmByAmID(param.amId)}" scope="session" target="Model.Assignment"/>
        <title>${am.name}</title>
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
                    <div class="details">
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
                                    <a href="http://localhost:8084/TheAssignment/SentAssignment.jsp?tab=AllAssignment&&wkt=${wkt}" style="text-align: center;text-decoration: none" class="center-block">
                                        <span class="glyphicon glyphicon-check center-block" style="font-size: 150px;margin: 40px auto;"></span><h4>Go to check : ) !</h4>
                                    </a>
                                </c:when>
                                <c:when test="${am.ass_type eq 'file'}">
                                    <a href="file/assignment_file/${am.path_file}" style="text-align: center;text-decoration: none" class="center-block">
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
                                    <td>${am.due_date}
                                        <span class="text-danger pull-right">
                                            <b>
                                                <c:set value="${cf:remainingTimeforSend(am,ac.acc_id)}" var="status"/>
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
                                                    <c:otherwise>
                                                        <span class="text-muted">Sent <span class="glyphicon glyphicon-check"></span></span>
                                                        </c:otherwise>
                                                    </c:choose>
                                            </b>
                                        </span>
                                    </td>
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
                                    <c:choose >
                                        <c:when test="${ac.courseList.get(cId).role eq 'TH'}">
                                            <c:choose>
                                                <c:when test="${am.ass_type eq 'file'}">
                                                    <td>
                                                        <button class="btn btn-primary"><span class="glyphicon glyphicon-upload"></span> Update</button>
                                                        <button class="btn btn-danger delete" style="margin-left: 10px" data-id="${am.am_id}"><span class="glyphicon glyphicon-remove"></span> Delete</button>
                                                    </td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>
                                                        <button class="btn btn-primary"><span class="glyphicon glyphicon-upload"></span> Edit</button>
                                                        <button class="btn btn-danger delete" style="margin-left: 10px" data-id="${am.am_id}"><span class="glyphicon glyphicon-remove"></span> Delete</button>
                                                    </td>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                            <td></td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td></td>
                                </tr>
                            </table>
                        </div>
                        <div class="clearboth"><hr></div> 
                        <h3>Comment</h3>
                        <div id="listComment">
                            <c:forEach items="${am.comment}" var="c">
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
                            <br/>
                            <form>
                                <textarea class="form-control" placeholder="Tell your teacher here." name="text" id="text"></textarea><br>
                                <input  type="button" class="btn btn-primary col-md-3 pull-right" id="addComment" value="Comment">
                            </form>
                        </div>
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
            $(".delete").click(function() {
                if (confirm('Are you sure you want to delete?')) {
                    var am_id = $(this).attr("data-id");
                    $.ajax({
                        type: 'POST',
                        url: "deleteAssignment",
                        data: {am_id: am_id}
                    }).done(function(msg) {
                        console.log(msg);
                        if (msg == 'true') {
                            var html = '<div class="alert alert-success" role="alert"><h3>Delete Successful. <a href="CreateAssignment.jsp?tab=AllAssignment">Go to create assignment</a></h3></div>'
                            $(".details").html(html);
                        }
                    });
                }
            });

            var pic = '${ac.profile_pic}';
            var fullname = '${ac.firstname}' + '${ac.lastname}';
            var d = new Date();
            var dateSt = d.getFullYear() + "-" + ('0' + (d.getMonth()+1)).slice(-2) + "-" + ('0' + d.getDate()).slice(-2) + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getMilliseconds();
            $("#addComment").click(function() {
                $.ajax({
                    type: "POST",
                    url: "comment",
                    data: {text: $("#text").val()}
                }).done(function(msg) {
                    var html = '<div class="media" id="newComment"><a class="pull-left" href="#"><img class="img-circle" width="64" src="' + pic + '"></a><div class="media-body"><h4 class="media-heading"><small class="text-muted">' + fullname + '</small><small class="pull-right">' + dateSt + '</small></h4><p>' + $("#text").val() + '</p></div></div>';
                    $("#listComment").prepend(html);
                    $("#newComment").slideDown().removeAttr("id");
                    $("#text").val("");
                });
            });
        });
    </script>
</html>
