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
        <style>
            #messageBox div{
                clear: both;
                margin-bottom: 15px
            }
            .th-message {
                background-color: #40D47E;
               border-radius: 10px
            }
            
            .st-message{
                background-color: #ffffff;
               border-radius: 10px
            }
        </style>
        <title>Message</title>
    </head>
    <body>
        <%@include file="META-INF/page/header_bar.jsp"%>
        <div class="container">
            <div class="row">
                <%@include file="META-INF/page/side_bar.jsp"%>
                <div class="col-md-9" style="padding-bottom: 20px">
                    <div class="col-md-8">
                        <div class="well" style="height: 600px;overflow-y: scroll" id="messageBox" >
                            <div class="pull-left col-md-5 th-message">
                                <h6><b>AJ.aaa fsdf </b></h6>
                                ising pain was born and I will give you a complete account of the system, and expound the actual teac
                                <br>
                                <small class="pull-right text-muted">13/08/2556 23:55:00</small>
                            </div>
                            <div class="pull-right col-md-5 st-message">
                                <h6><b>orarmor arm</b> </h6>
                                mistaken id
                                <br>
                                <small class="pull-right text-muted">13/08/2556 23:55:00</small>
                            </div>
                            <div class="pull-left col-md-5 th-message">
                                <h6><b>AJ.aaa fsdf </b> </h6>
                                ill give you a complete account of the system, and expound the actual teac
                                <br>
                                <small class="pull-left text-muted">13/08/2556 23:55:00</small>
                            </div>
                            <div class="pull-right col-md-5 st-message">
                                <h6><b>orarmor arm</b> </h6>
                                I must explain to you how all this mistaken id<br>
                                <small class="pull-right text-muted">13/08/2556 23:55:00</small>
                            </div>
                            <div class="pull-left col-md-5 th-message">
                                <h6><b>AJ.aaa fsdf </b>  </h6>
                                and praising pain was born and I will give you a complete account of the system, and expound the actual teac<br>
                                <small class="pull-right text-muted">13/08/2556 23:55:00</small>
                            </div>
                            <div class="pull-right col-md-5 st-message">
                                <h6><b>orarmor arm</b> </h6>
                                I must explain to you how all this mistaken id<br>
                                <small class="pull-right text-muted">13/08/2556 23:55:00</small>
                            </div>
                            <div class="pull-left col-md-5 th-message">
                                <h6><b>AJ.aaa fsdf </b> </h6>
                                born and I will give you a complete account of the system, and expound the actual teac<br>
                                <small class="pull-right text-muted">13/08/2556 23:55:00</small>
                            </div>
                            <div class="pull-right col-md-5 st-message">
                                <h6><b>orarmor arm</b> </h6>
                                ut I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was<br>
                                <small class="pull-right text-muted">13/08/2556 23:55:00</small>
                            </div>
                            <div class="pull-right col-md-5 st-message">
                                <h6><b>orarmor arm</b> </h6>
                                complete account of the system, an<br>
                                <small class="pull-right text-muted">13/08/2556 23:55:00</small>
                            </div>
                        </div>
                        <form>
                            <textarea class="form-control"  placeholder="Tell your teacher here."></textarea>
                            <br>
                            <input type="submit" class="btn btn-primary pull-right" value="Send">
                        </form>
                    </div>
                    <div class="col-md-4"></div>
                </div>
            </div>
        </div>
    </body> 
</html>