<%-- 
    Document   : home
    Created on : Apr 6, 2014, 5:08:52 PM
    Author     : JenoVa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="/WEB-INF/tlds/functions.tld" prefix="cf" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="META-INF/page/include_css.jsp" %>
        <%@include file="META-INF/page/include_js.jsp" %>
        <script type="text/javascript" src="https://cdn.goinstant.net/v1/platform.min.js"></script>
        <script type="text/javascript" src="https://cdn.goinstant.net/widgets/user-list/latest/user-list.min.js"></script>
        <script type="text/javascript" src="https://cdn.goinstant.net/widgets/form/latest/form.min.js"></script>
        <script type="text/javascript" src="https://cdn.goinstant.net/widgets/click-indicator/latest/click-indicator.min.js"></script>
        <script type="text/javascript" src="https://cdn.goinstant.net/widgets/notifications/latest/notifications.min.js"></script>
        <script type="text/javascript" src="https://cdn.goinstant.net/widgets/chat/latest/chat.min.js"></script>
        <!-- CSS is optional -->
        <link rel="stylesheet" href="https://cdn.goinstant.net/widgets/user-list/latest/user-list.css" />
        <link rel="stylesheet" href="https://cdn.goinstant.net/widgets/form/latest/form.css" />
        <link rel="stylesheet" href="https://cdn.goinstant.net/widgets/click-indicator/latest/click-indicator.css" />
        <link rel="stylesheet" href="https://cdn.goinstant.net/widgets/notifications/latest/notifications.css" />
        <link rel="stylesheet" href="https://cdn.goinstant.net/widgets/chat/latest/chat.css" />
        <title>On web Assignment ...</title>
        <style>
            #pvVs{
                text-align: center;
                background-color: #F5F5F5;
                padding: 10px 0;
            }

            #questionList h5{
                margin-top: 20px;
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
                        <li class="active"><a href="#">${curAm.name}</a></li>
                    </ol>
                    <div >
                        <div >
                            <form role="form" id="questionList" action="uploadAssignmentOnWeb" method="post">
                                <div class="pull-left">
                                    <c:choose>
                                        <c:when test="${curAm.total_member==1}">
                                            <h4>Individual work</h4>
                                            <div class="member">
                                                <img width="64" src="${ac.profile_pic}">
                                                <h4>${ac.firstname} ${ac.lastname}</h4>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <h4>Group No. ${g.g_no}</h4>
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
                                <div class="assignmentBox col-md-12">
                                    <h4><u>Let's do it !</u></h4>
                                            <c:set value="1" var="seqno" />
                                            <c:set value="0" var="used_id" />
                                            <c:set value="0" var="no_seq" />
                                            <c:set value="" var="inst"/>
                                            <c:forEach  items="${curAm.questionList}" var="q">
                                                <c:if test="${inst ne q.instruction && q.instruction ne 'null'}">
                                            <div>
                                                <h5><b><u>Instruction:</u> ${q.instruction}</b></h5><!--[Question Instruction]-->
                                                <input type="hidden" name="${seqno}q_id" value="${q.q_id}"/>
                                                <input type="hidden" value="instruction" name="${seqno}q_type">
                                                <input type="hidden" name="seqno" value="${seqno}">
                                                <c:set value="${q.instruction}" var="inst"/>
                                                <c:set value="${seqno+1}" var="seqno" />
                                                <c:set value="${no_seq+1}" var="no_seq" />
                                            </div>
                                        </c:if>
                                        <c:choose>
                                            <c:when test="${q.q_type eq 'multiple_choice' || q.q_type eq 'tfQuestion'}">
                                                <c:set var="clist" value="${fn:substring(q.q_choice_list, 1, q.q_choice_list.length()-1)}"/>
                                                <c:set var="anslist" value="${fn:substring(q.q_answer_list, 1, q.q_answer_list.length()-1)}"/>
                                                <c:set var="choicesp" value="${fn:split(clist, ', ')}" />
                                                <div>
                                                    <p>${q.q_no}.) ${q.q_text}</p>
                                                    <c:choose>
                                                        <c:when test="${q.q_category eq 'one'}">
                                                            <c:forEach items="${choicesp}" var="choice">
                                                                <input type="radio" name="${seqno}answer" value="${choice}"> ${choice}
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:when test="${q.q_category eq 'multiple'}">
                                                            <c:forEach items="${choicesp}" var="choice">
                                                                <input type="checkbox" name="${seqno}answer" value="${choice}"> ${choice}
                                                            </c:forEach>
                                                        </c:when>
                                                        <c:when test="${q.q_category eq 'tf'}">
                                                            <input type="radio" name="${seqno}answer" value="true"> True
                                                            <input type="radio" name="${seqno}answer" value="false"> False
                                                        </c:when>
                                                    </c:choose>
                                                    <input type="hidden" name="${seqno}q_id" value="${q.q_id}"/>
                                                    <input type="hidden" value="multiple_choice" name="${seqno}q_type">
                                                    <input type="hidden" name="seqno" value="${seqno}">
                                                </div>
                                                <c:set value="${seqno+1}" var="seqno" />
                                            </c:when>
                                            <c:when test="${q.q_type eq 'explain'}">
                                                <div>
                                                    <p>${q.q_no}.) ${q.q_text}</p>
                                                    <textarea class="form-control" name="${seqno}answer"></textarea>
                                                    <input type="hidden" name="${seqno}q_id" value="${q.q_id}"/>
                                                    <input type="hidden" value="explain" name="${seqno}q_type">
                                                    <input type="hidden" name="seqno" value="${seqno}">
                                                </div>
                                                <c:set value="${seqno+1}" var="seqno" />
                                            </c:when>
                                            <c:when test="${q.q_type eq 'matchWord'}">
                                                <c:if test="${q.q_id != used_id}">
                                                    <!-- set new var-->
                                                    <c:set value="" var="listchs"/>
                                                    <c:set value="" var="listans"/>

                                                    <!-- loop concat string of each question -->
                                                    <c:forEach  items="${curAm.questionList}" var="m">
                                                        <c:if test="${q.q_id  eq m.q_id}">
                                                            <!--<input type="hidden" value="${m.q_order}" name="${seqno}q_order"/>-->
                                                            <c:set value="${listchs.concat(',').concat(m.q_text)}" var="listchs"/>
                                                            <c:set value="${listans.concat(',').concat(m.q_answer)}" var="listans"/>
                                                        </c:if>
                                                    </c:forEach> 

                                                    <!-- shuffle concantinate string -->
                                                    <c:set value="${ct_cf:shuffleString(listans)}" var="listans"/>

                                                    <!-- split new shffle string for display-->
                                                    <c:set value="${fn:split(listchs,', ')}" var="listchs"/>
                                                    <c:set value="${fn:split(listans,', ')}" var="listans"/>
                                                    <div class="row">
                                                        <p>${q.q_no}.) ${q.q_title}</p>
                                                        <div class="col-md-8">
                                                            <c:forEach items="${listchs}" var="c">
                                                                <select name="${seqno}answer">
                                                                    <c:forEach items="${listans}" var="ansl">
                                                                        <option value="${ansl}">${ansl}</option>
                                                                    </c:forEach>
                                                                </select>
                                                                <span>${c}</span>
                                                                <br/><br/>
                                                            </c:forEach>
                                                        </div>
                                                        <div class="col-md-2 col-md-offset-2">
                                                            <c:forEach items="${listans}" var="ansl">
                                                                <span>${ansl}</span><br/><br/>
                                                            </c:forEach>
                                                        </div>
                                                        <input type="hidden" name="${seqno}q_id" value="${q.q_id}"/>
                                                        <input type="hidden" value="matchWord"  name="${seqno}q_type">
                                                        <input type="hidden" name="seqno" value="${seqno}">
                                                    </div>
                                                    <c:set value="${q.q_id}" var="used_id" />
                                                    <c:set value="${seqno+1}" var="seqno" />
                                                </c:if>
                                            </c:when>
                                            <c:when test="${q.q_type eq 'fillBlank'}">
                                                <c:if test="${q.q_id != used_id}">
                                                    <div>
                                                        <!-- algor for replace string index with input text-->
                                                        <c:set value="${q.q_text}" var="q_text"/>
                                                        <c:set var="countb" value="${curAm.questionList.size()}"/>
                                                        <c:forEach begin="1" end="${curAm.questionList.size()}" var="f">
                                                            <c:set var="countb" value="${countb-1}"/>
                                                            <c:if test="${q.q_id  eq curAm.questionList.get(countb).q_id}">
                                                                <c:set var="q_start_index" value="${curAm.questionList.get(countb).q_start_index}" />
                                                                <c:set var="q_end_index" value="${curAm.questionList.get(countb).q_end_index}"/>
                                                                <c:set var="reptext" value="<input type='text' name='${seqno}answer'/>"/>
                                                                <c:set value="${ct_cf:replaceStringByIndex(q_text, q_start_index, q_end_index,reptext)}" var="q_text"/>
                                                            </c:if>
                                                        </c:forEach>
                                                        <!-- end algor-->

                                                        <p>${q.q_no}.) ${q_text}</p>

                                                        <!-- set value-->
                                                        <input type="hidden" name="${seqno}q_id" value="${q.q_id}"/>
                                                        <input type="hidden" name="seqno" value="${seqno}">
                                                        <input type="hidden" value="fillBlank" name="${seqno}q_type">
                                                        <c:set value="${q.q_id}" var="used_id" />
                                                        <c:set value="${seqno+1}" var="seqno" />
                                                    </div>
                                                </c:if>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                    <br>
                                    <input type="submit" class="btn btn-primary pull-right" value="Send !!">
                                </div>
                            </form>
                        </div>
                        <div style="clear: both;padding: 10px 0"><hr/></div> 
                        <h3>Teacher Comment</h3>
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
            <div class="gi-override gi-userlist">
                <div class="gi-options"></div>
                <ul class="gi-inner">
                    <li class="gi-user" data-goinstant-id="1234">
                        <div class="gi-color">
                            <div class="gi-avatar">
                                <img class="gi-avatar-img">
                            </div>
                        </div>
                        <div class="gi-name">
                            <span>Guest</span>
                        </div>
                    </li>
                </ul>
                <div class="gi-collapse"></div>
            </div>
            <div class="gi-override gi-form">
                <div class="gi-indicator">
                    <div class="gi-user">
                        <!-- The displayname of the user interacting with this input -->
                    </div>
                    <div class="gi-bar">
                    </div>
                </div>
            </div>

            <div class="gi-chat gi-override">
                <div class="gi-collapse-wrapper">
                    <div class="gi-collapse">
                        <span class="gi-icon"></span>
                    </div>
                </div>
                <div class="gi-chat-wrapper">
                    <ul class="gi-message-list">
                        <li class="gi-message">
                            <div class="gi-color"></div>
                            <div class="gi-avatar">
                                <img class="gi-avatar-img" src="http://YOURDOMAIN.com/YOURAVATAR.png">
                            </div>
                            <div class="gi-name">Guest</div>
                            <div class="gi-text">Hi</div>
                            <span class="gi-time">Monday, 1:10 pm</span>
                        </li>
                    </ul>
                    <div class="gi-message-form">
                        <input class="gi-message-input" type="text">
                        <button class="gi-message-btn">Send</button>
                    </div>
                </div>
            </div>
            <div class="gi-override gi-click-container">
                <div class="gi-click">
                    <div class="gi-cursor">
                        <!-- Cursor image background -->
                    </div>
                    <div class="gi-animation">
                        <!-- Click animation image background-->
                    </div>
                    <div class="gi-name">
                        <!-- User's display name -->
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
            $(".gi-chat ").hide();
            $(".gi-click-container ").hide();

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
            // Connect URL
            /*var url = 'https://goinstant.net/701ad7c04624/CollaborateAssignment';
             
             var connection = new goinstant.Connection(url);
             connection.connect(function(err) {
             if (err) {
             // there was an error connecting OR the token was invalid.
             return;
             }
             
             var room = connection.room('lobby1');
             
             // Create a new instance of the Notifications widget
             var notifications = new goinstant.widgets.Notifications();
             
             // Get all notifications
             notifications.subscribe(room, function(err) {
             if (err) {
             throw err;
             }
             // We're now receiving notifications
             });
             
             room.join({displayName: 'Custom'}, function(err, yourRoom, userData) {
             if (err) {
             console.log("Error joining room:", err);
             // Failed to join room; clean up or retry.
             return;
             }
             
             // Joined the room. Start getting and manipulating keys.
             
             // Create a new instance of the UserList widget
             var userList = new goinstant.widgets.UserList({
             room: yourRoom,
             collapsed: false,
             position: 'right'
             });
             
             // Initialize the UserList widget
             userList.initialize(function(err) {
             if (err) {
             throw err;
             }
             });
             
             // Create a new instance of the Chat widget
             var chat = new goinstant.widgets.Chat({
             room: yourRoom
             });
             
             // Initialize the Chat widget
             chat.initialize(function(err) {
             if (err) {
             throw err;
             }
             // Now it should render on the page
             });
             
             // Create a key to store the form data
             var formKey = yourRoom.key('example-form-key');
             
             // Create a new instance of the widget
             var form = new goinstant.widgets.Form({
             el: document.getElementById('questionList'),
             key: formKey,
             room: yourRoom
             });
             
             form.initialize(function(err) {
             if (err) {
             throw err;
             }
             // Your form should now be initialized!
             });
             
             // Create a new instance of the Click Indicator widget
             var clickIndicator = new goinstant.widgets.ClickIndicator({room: yourRoom});
             
             // Initialize the Click Indicator widget
             clickIndicator.initialize(function(err) {
             if (err) {
             throw err;
             }
             // Click Indicator widget ready to use
             });
             
             console.log("Your name is " + userData.displayName); // "Your name is Custom"
             });
             
             // The listener will fire everytime a user leaves the Room
             room.on('leave', function(userData) {
             // Set options for the notification we're about to publish
             var options = {
             room: room,
             type: 'warning',
             message: 'user' + userData.displayName + ' left the lobby!',
             displayToSelf: true
             };
             
             // Send a single notification
             notifications.publish(options, function(err) {
             if (err) {
             throw err;
             }
             // Notification has been sent
             });
             });
             
             // The listener will fire every time another user joins the room
             room.on('join', function(userData) {
             // Set options for the notification we're about to publish
             var options = {
             room: room,
             type: 'success',
             message: 'user ' + userData.displayName + ' join the lobby!',
             displayToSelf: true
             };
             
             // Send a single notification
             notifications.publish(options, function(err) {
             if (err) {
             throw err;
             }
             // Notification has been sent
             });
             });
             });*/
        });
    </script>
</html> 
