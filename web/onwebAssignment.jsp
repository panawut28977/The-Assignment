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
                    </c:choose>
                    <div >
                        <div >
                            <form role="form" id="questionList">
                                <div class="pull-left">
                                    <h4>Group No.1 <small class="text-muted">(Require 1-3 members in group)</small></h4>
                                    <div class="member">
                                        <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                                        <h4>Panawut</h4>
                                    </div>
                                    <div class="member">
                                        <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                                        <h4>Thanakit</h4>
                                    </div>
                                    <div class="member">
                                        <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                                        <h4 class="">Nitiwit</h4>
                                    </div>
                                </div>
                                <hr style="clear: both">
                                <div class="assignmentBox col-md-12">
                                    <h4><u>Let's do it !</u></h4>

                                    <h5><b><u>Instruction:</u> Fill in the blank</b></h5><!--[Question Title]-->
                                    <p>1.) Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, <input type="text"name="a1"> sem <input type="text" name="a1"> quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et <input type="text" name="a1"> ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit <input type="text" name="a1"> amet nibh. Donec sodales sagittis magna. Sed consequat, leo <input type="text" name="a1"> eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Fusce <input type="text" name="a1"> vulputate eleifend sapien. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia.</p>
                                    <h5><b><u>Instruction:</u> Match the words</b></h5><!--[Question Title]-->
                                    <div>
                                        <h5>2.) Please match the suitable words form below</h5>
                                        <div>
                                            <select name="a2" >
                                                <option value="cheese">fggsdf</option>
                                                <option value="tomatoes">fggsdf</option>
                                                <option value="mozarella">fggsdf</option>
                                            </select> 
                                            <span>asdffsadf</span><span class="pull-right">fggsdf</span></div><br>
                                        <div>
                                            <select name="a2">
                                                <option value="cheese">fggsdf</option>
                                                <option value="tomatoes">fggsdf</option>
                                                <option value="mozarella">fggsdf</option>
                                            </select>  
                                            <span>asdffsadf</span><span class="pull-right">fggsdf</span></div><br>
                                        <div>
                                            <select name="a2">
                                                <option value="cheese">fggsdf</option>
                                                <option value="tomatoes">fggsdf</option>
                                                <option value="mozarella">fggsdf</option>
                                            </select>  
                                            <span>asdffsadf</span><span class="pull-right">fggsdf</span></div><br>
                                        <div>
                                            <select name="a2" >
                                                <option value="cheese">fggsdf</option>
                                                <option value="tomatoes">fggsdf</option>
                                                <option value="mozarella">fggsdf</option>
                                            </select>  
                                            <span>asdffsadf</span><span class="pull-right">fggsdf</span></div><br>
                                        <div>
                                            <select name="a2">
                                                <option value="cheese">fggsdf</option>
                                                <option value="tomatoes">fggsdf</option>
                                                <option value="mozarella">fggsdf</option>
                                            </select>  
                                            <span>asdffsadf</span><span class="pull-right">fggsdf</span></div><br>
                                        <div>
                                            <select name="a2">
                                                <option value="cheese">fggsdf</option>
                                                <option value="tomatoes">fggsdf</option>
                                                <option value="mozarella">fggsdf</option>
                                            </select>  
                                            <span>asdffsadf</span><span class="pull-right">fggsdf</span></div><br>
                                    </div>
                                    <h5><b><u>Instruction:</u> Choose the best answer(Multiple choices)</b></h5>
                                    <div>
                                        <h5>3.) which one collect?</h5>
                                        <input type="radio" name="a3"> A. aaaaa
                                        <input type="radio" name="a3"> B. aaaaa
                                        <input type="radio" name="a3"> C. aaaaa
                                        <input type="radio" name="a3"> D. aaaaa
                                    </div>
                                    <div> 
                                        <h5>4.) which one collect?</h5>
                                        <input type="radio" name="a4"> A. aaaaa
                                        <input type="radio" name="a4"> B. aaaaa
                                        <input type="radio" name="a4"> C. aaaaa
                                        <input type="radio" name="a4"> D. aaaaa
                                    </div>
                                    <div>
                                        <h5>5.) which one collect(more than one answer)?</h5>
                                        <input type="checkbox" name="a5"> A. aaaaa
                                        <input type="checkbox" name="a5"> B. aaaaa
                                        <input type="checkbox" name="a5"> C. aaaaa
                                        <input type="checkbox" name="a5"> D. aaaaa
                                    </div>
                                    <h5><b><u>Instruction:</u> Explain answer</b></h5>
                                    <div>
                                        <h5>6.) please brief explain concept.</h5>
                                        <textarea class="form-control" name="a6"></textarea>
                                    </div>
                                    <br>
                                    <a href="course.jsp?tab=AllAssignment" class="btn btn-primary">Send !!</a>
                                </div>
                                <br>
                            </form>
                        </div>
                    </div>
                    <div style="clear: both;padding: 10px 0"></div> 
                    <h3>Teacher Comment</h3>
                    <div class="media">
                        <a class="pull-left" href="#">
                            <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                        </a>
                        <div class="media-body">
                            <h4 class="media-heading">AJ.Kittipong Warasup<small class="pull-right">16/01/57</small></h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                        </div>
                    </div>
                    <div class="media">
                        <a class="pull-left" href="#">
                            <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                        </a>
                        <div class="media-body">
                            <h4 class="media-heading">AJ.Kittipong Warasup<small class="pull-right">16/01/57</small></h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                        </div> 
                    </div>
                    <form>
                        <textarea class="form-control" placeholder="Tell your teacher here."></textarea><br>
                        <input  type="submit" value="comment" class="btn btn-primary col-md-3 pull-right">
                    </form>
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
