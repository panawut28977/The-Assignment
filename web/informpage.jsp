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
        <title>Inform</title>
        <c:if test="${param.msg ne null}">
            <c:set var="msg" value="${param.msg}"/>
        </c:if>
    </head>
    <body>
        <!-- 
                            1 = หน้าหลังจาก join course
                            2 = หน้าที่ใส่ code แล้ว join ไม่ได้
        -->
        <%@include file="META-INF/page/header_bar.jsp"%>
        <div class="container">
            <div class="row">
                <%@include file="META-INF/page/side_bar.jsp"%>
                <div class="col-md-9">
                    <c:choose>
                        <c:when test="${msg eq '1'}">
                            <div class="alert alert-success" role="alert">
                                <h3>Waiting for approve. <a href="home.jsp?tab=AllAnnouce">Go back to homepage</a></h3>
                            </div>
                        </c:when>
                        <c:when test="${msg eq '2'}">
                            <div class="alert alert-danger" role="alert">
                                <h3>Your are in that course or your code is wrong. Please try again</h3>
                            </div>
                            <form action="joinCourseServlet" method="post" role="form">
                                <div class="form-group">
                                    <label>Put course code</label>
                                    <input type="text" name="course_code" class="form-control">
                                </div>
                                <input type="submit" class="btn btn-primary" value="join"/>
                            </form>
                        </c:when>
                        <c:when test="${msg eq '3'}">
                            <div class="alert alert-success" role="alert">
                                <h3>Upload Assignment successful. <a href="sendAssignment?am_id=${param.am_id}">Go back to see your assignment</a></h3>
                            </div>
                        </c:when>
                        <c:when test="${msg eq '4'}">
                            <div class="alert alert-success" role="alert">
                                <h3>Send Assignment successful. <a href="sendAssignment?am_id=${param.am_id}">Go back to see your assignment</a></h3>
                            </div>
                        </c:when>
                        <c:when test="${msg eq '5'}">
                            <div class="alert alert-success" role="alert">
                                <h3>Update Assignment score successful. <br/><a href="GetSentAssignment?am_id=${am_id}">Go back to check another assignment</a></h3>
                            </div>
                        </c:when>
                        <c:when test="${msg eq '6'}">
                            <div class="alert alert-success" role="alert">
                                <h3>Check Assignment successful.  <br/><br/><a href="GetSentAssignment?am_id=${param.am_id}">Go back to check another assignment</a></h3>
                            </div>
                        </c:when>
                        <c:when test="${msg eq '7'}">
                            <div class="alert alert-warning" role="alert">
                                <h3><span class="glyphicon glyphicon-hand-left"></span> Please select your course on the left before.</h3>
                            </div>
                        </c:when>
                        <c:when test="${msg eq '8'}">
                            <div class="alert alert-warning" role="alert">
                                <h3>you out of course.  <a href="home.jsp?tab=AllAnnouce">Go back to homepage</a></h3>
                            </div>
                        </c:when>
                        <c:when test="${msg eq '9'}">
                            <div class="alert alert-warning" role="alert">
                                <h3>your course has been closed now. some function will be disable. <a href="CourseAnnounce">Go back to your course</a></h3>
                            </div>
                        </c:when>
                        <c:when test="${msg eq '10'}">
                            <div class="alert alert-success" role="alert">
                                <h3>your course is open now. <a href="CourseAnnounce">Go back to your course</a></h3>
                            </div>
                        </c:when>
                        <c:when test="${msg eq '11'}">
                            <div class="alert alert-warning" role="alert">
                                <h3>your request course is closed now. Please waiting before it open or put another course.</h3>
                            </div>
                            <form action="joinCourseServlet" method="post" role="form">
                                <div class="form-group">
                                    <label>Put course code</label>
                                    <input type="text" name="course_code" class="form-control">
                                </div>
                                <input type="submit" class="btn btn-primary" value="join"/>
                            </form>
                        </c:when>
                        <c:when test="${msg eq '12'}">
                            <div class="alert alert-warning" role="alert">
                                <h3> You are not teacher in that course. </h3>
                            </div>
                        </c:when>
                        <c:when test="${msg eq '13'}">
                            <div class="alert alert-warning" role="alert">
                                <h3> This assignment is deleted. </h3>
                            </div>
                        </c:when>
                         <c:when test="${msg eq '14'}">
                            <div class="alert alert-warning" role="alert">
                                <h3> This group or student assignment has been deleted. </h3>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>
        <!--        <a href="setSession.jsp?acct=th"><span>teacher mode</span></a>
                 <a href="setSession.jsp?acct=st"><span>student mode</span></a>-->
    </body>
</html>
