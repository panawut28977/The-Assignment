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

            #teacherSelectionBox{
                height: 400px;
                overflow-y: scroll;
                padding:  0;
            }
            
            #teacherSelectionBox hr{
                margin: 0;
            }
            
            #teacherSelectionBox .media{
                cursor: pointer;
                margin-top: 0;
            }
            
            #teacherSelectionBox .media:hover{
                background-color:#DADCFF;
            }
            
            #teacherSelectionBox .media h5{
                padding-top: 8px;
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
                        <h4>Private Message</h4>
                        <div class="well" style="height: 600px;overflow-y: scroll" id="messageBox" >
                            <div class="pull-left col-md-5 th-message">
                                <h6><b>AJ.Kittiphan Puapholthep </b></h6>
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
                                <h6><b>AJ.Kittiphan Puapholthep </b> </h6>
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
                                <h6><b>AJ.Kittiphan Puapholthep </b>  </h6>
                                and praising pain was born and I will give you a complete account of the system, and expound the actual teac<br>
                                <small class="pull-right text-muted">13/08/2556 23:55:00</small>
                            </div>
                            <div class="pull-right col-md-5 st-message">
                                <h6><b>orarmor arm</b> </h6>
                                I must explain to you how all this mistaken id<br>
                                <small class="pull-right text-muted">13/08/2556 23:55:00</small>
                            </div>
                            <div class="pull-left col-md-5 th-message">
                                <h6><b>AJ.Kittiphan Puapholthep </b> </h6>
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
                    <div class="col-md-4" style="margin-top: 36px;">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">Select your teacher</h3>
                            </div>
                            <div class="panel-body" id="teacherSelectionBox">
                                <div class="media">
                                    <a class="pull-left" href="#">
                                        <img width="32" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                                    </a>
                                    <div class="media-body">
                                        <h5 class="media-heading">AJ.Kittiphan Puapholthep</h5>
                                    </div>
                                </div>
                                <hr>
                                <div class="media">
                                    <a class="pull-left" href="#">
                                        <img width="32" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                                    </a>
                                    <div class="media-body">
                                        <h5 class="media-heading">AJ.Unhawa Ninrutsirikun</h5>
                                    </div> 
                                </div>
                                <hr>
                                <div class="media">
                                    <a class="pull-left" href="#">
                                        <img width="32" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                                    </a>
                                    <div class="media-body">
                                        <h5 class="media-heading">AJ.Ekapong Jungcharoensukying</h5>
                                    </div>
                                </div>
                                <hr>
                                <div class="media">
                                    <a class="pull-left" href="#">
                                        <img width="32" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                                    </a>
                                    <div class="media-body">
                                        <h5 class="media-heading">AJ.Kittipong Warasup</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(function(){
               $("#teacherSelectionBox .media").click(function(){
                   
               });
            });
        </script>
    </body> 
</html>
