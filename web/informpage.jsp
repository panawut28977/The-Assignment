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
                                <h3>Waiting for approve. <a href="home.jsp?tab=AllAnnouce">Go back to home page</a></h3>
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
                                <h3>Check Assignment successful. <br/><a href="GetSentAssignment?am_id=${param.am_id}">Go back to check another assignment</a></h3>
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
