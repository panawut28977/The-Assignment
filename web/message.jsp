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
        <c:set value="" var="cId" scope="session"/>
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

            #teacherSelectionBox,#studentSelectionBox{
                height: 300px;
                overflow-y: scroll;
                padding:  0;
            }

            #teacherSelectionBox hr,#studentSelectionBox hr{
                margin: 0;
            }

            #teacherSelectionBox .media,#studentSelectionBox .media{
                cursor: pointer;
                margin-top: 0;
            }

            #teacherSelectionBox .media:hover,#studentSelectionBox.media:hover{
                background-color:#DADCFF;
            }

            #teacherSelectionBox .media h5,#studentSelectionBox .media h5{
                padding-top: 8px;
            }

            .seen{
                background: aliceblue;
            }
        </style>
        <title>Message</title>
    </head>
    <body>
        <c:set value="${cf:getNameByID(to_acc_id)}" var="dest_id" />
        <%@include file="META-INF/page/header_bar.jsp"%>
        <div class="container">
            <div class="row">
                <%@include file="META-INF/page/side_bar.jsp"%>
                <div class="col-md-9" style="padding-bottom: 20px">
                    <div class="col-md-8">
                        <h4 style="padding-bottom: 20px">
                            <span class="pull-left"><img src="${dest_id.profile_pic}" width="24"/>  ${dest_id.firstname}</span>
                            <span class="pull-right text-muted"><i class="glyphicon glyphicon-envelope"></i> Private Message</span>
                        </h4>
                        <div class="well" style="height: 600px;overflow-y: scroll;clear: both;margin-top: 20px;" id="messageBox" >
                            <c:choose>
                                <c:when test="${msg eq 'nopvmsg'}">
                                    <div class="alert alert-info" role="alert">
                                        <h3>Select people before. <span class="glyphicon glyphicon-hand-right pull-right"></span></h3>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${mList}" var="m">
                                        <c:choose>
                                            <c:when test="${m.source_acc_id.acc_id== ac.acc_id}">
                                                <div class="pull-right col-md-5 st-message">
                                                    <h6><b>${m.source_acc_id.firstname} ${m.source_acc_id.lastname}</b> </h6>
                                                    ${m.message}
                                                    <br>
                                                    <small class="pull-right text-muted">${cf:formatTime(m.send_date)}</small>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="pull-left col-md-5 th-message">
                                                    <h6><b>${m.source_acc_id.firstname} ${m.source_acc_id.lastname}</b> </h6>
                                                    ${m.message}
                                                    <br>
                                                    <small class="pull-right text-muted">${cf:formatTime(m.send_date)}</small>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <!--                                    <div class="pull-left col-md-5 th-message">
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
                                                                        </div>-->
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <c:if test="${msg ne 'nopvmsg'}">
                            <form>
                                <textarea class="form-control" id="messagetext"  placeholder="Tell your teacher here." required="yes"></textarea>
                                <br>
                                <input type="button"  id="sendMessage"  class="btn btn-primary pull-right" value="Send">
                            </form>
                        </c:if>
                    </div>
                    <div class="col-md-4" style="margin-top: 36px;">
                        <c:if test="${ac.account_type eq 'TH'}">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Message to your student</h3>
                                </div>
                                <div class="panel-body" id="studentSelectionBox">
                                    <c:if test="${yourStudent.size()==0}">
                                        <br/>
                                        <p class="text-center text-muted"><b>You don't have a Student</b></p>
                                    </c:if>
                                    <c:forEach items="${yourStudent}" var="s">
                                        <div class="media <c:if test="${s.key.isAllSeen eq false}">seen</c:if>" style="padding: 10px" data-id="${s.value.acc_id}" onclick="getMessage(this)">
                                                <a class="pull-left" href="#">
                                                    <img width="32" src="${s.value.profile_pic}">
                                            </a>
                                            <div class="media-body">
                                                <h5 class="media-heading">${s.value.firstname} ${s.value.lastname} <c:if test="${s.key.isAllSeen eq false}"><span class="label label-info">new</span></c:if></h5>
                                                </div>
                                            </div>
                                            <hr>
                                    </c:forEach>
                                </div>
                            </div>
                        </c:if>
                        <c:choose>
                            <c:when test="${ac.account_type eq 'ST'}">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Message to your teacher</h3>
                                    </div>
                                    <div class="panel-body" id="teacherSelectionBox">
                                        <c:if test="${youTeacher.size()==0}">
                                            <br/>
                                            <p class="text-center text-muted"><b>You don't have a Teacher</b></p>
                                        </c:if>
                                        <c:forEach items="${youTeacher}" var="t">
                                            <div class="media <c:if test="${t.key.isAllSeen eq false}">seen</c:if>" style="padding: 10px" data-id="${t.value.acc_id}" onclick="getMessage(this)">
                                                    <a class="pull-left" href="#">
                                                        <img width="32" src="${t.value.profile_pic}">
                                                </a>
                                                <div class="media-body">
                                                    <h5 class="media-heading">${t.value.firstname} ${t.value.lastname} <c:if test="${t.key.isAllSeen eq false}"><span class="label label-info">new</span></c:if></h5>
                                                    </div>
                                                </div>
                                                <hr>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:when>
                            <c:when test="${ac.account_type eq 'TH'}">
                                <c:if test="${dontShowDash == 1}">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">Message to your teacher</h3>
                                        </div>
                                        <div class="panel-body" id="teacherSelectionBox">
                                            <c:if test="${youTeacher.size()==0}">
                                                <br/>
                                                <p class="text-center text-muted"><b>You don't have a Teacher</b></p>
                                            </c:if>
                                            <c:forEach items="${youTeacher}" var="t">
                                                <div class="media <c:if test="${t.key.isAllSeen eq false}">seen</c:if>" style="padding: 10px" data-id="${t.value.acc_id}" onclick="getMessage(this)">
                                                        <a class="pull-left" href="#">
                                                            <img width="32" src="${t.value.profile_pic}">
                                                    </a>
                                                    <div class="media-body">
                                                        <h5 class="media-heading">${t.value.firstname} ${t.value.lastname} <c:if test="${t.key.isAllSeen eq false}"><span class="label label-info">new</span></c:if></h5>
                                                        </div>
                                                    </div>
                                                    <hr>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </c:if>
                            </c:when>
                        </c:choose>


                    </div>
                </div>
            </div>
        </div>
        <script>
            $(function() {
                $("#message_menu").addClass("active");
                $("#home_menu").removeClass("active");
                $('#messageBox').animate({
                    scrollTop: $("#messageBox").offset().top + $("#messageBox")[0].scrollHeight
                }, 0);
                $("#sendMessage").click(function() {
                    var text = $("#messagetext").val();
                    if (text.length == 0) {
                        alert("Please enter some text.");
                    } else {
                        var send_acc_id = '${ac.acc_id}';
                        var to_acc_id = '${to_acc_id}';
                        var d = new Date();
                        var dateSt = d.getFullYear() + "-" + ('0' + (d.getMonth() + 1)).slice(-2) + "-" + ('0' + d.getDate()).slice(-2) + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getMilliseconds();
                        $.ajax({
                            type: 'POST',
                            url: "smessage",
                            data: {text: text, send_acc_id: send_acc_id, to_acc_id: to_acc_id},
                            success: function(data) {
                                if (data == "success") {
                                    var html = '<div class="pull-right col-md-5 st-message">' +
                                            '        <h6><b>${ac.firstname} ${ac.lastname}</b> </h6>' +
                                            '        ' + text + '<br>' +
                                            '        <small class="pull-right text-muted">' + dateSt + '</small>' +
                                            '    </div>';
                                    $("#messageBox").append(html);
                                    $('#messageBox').animate({
                                        scrollTop: $("#messageBox").offset().top + $("#messageBox")[0].scrollHeight
                                    }, 500);
                                    $("#messagetext").val('');
                                } else {
                                    alert("failed");
                                }
                            }
                        });
                    }

                });
            });
            function getMessage(t) {
                var to_acc_id = $(t).attr("data-id");
                location.href = "gmessage?to_acc_id=" + to_acc_id;
            }
        </script>
    </body> 
</html>
