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
                                <li class="active"><a href="#">งานที่ 1...</a></li>
                            </ol>
                        </c:when>
                        <c:otherwise>
                            <div><h3>INT202 Software Development Process II</h3></div>
                            <%@include file="META-INF/page/CourseTab.jsp"%>
                            <ol class="breadcrumb" style="margin-top: 15px" >
                                <li><a href="course.jsp?tab=AllAssignment">Assignment</a></li>
                                <li class="active"><a href="#">งานที่ 1...</a></li>
                            </ol>
                        </c:otherwise>
                    </c:choose>
                    <div >
                        <div style="text-align: center">
                            <form role="form" id="questionList">
                                <h4>Group No.1 <small class="text-muted">(Require 1-3 members in group)</small></h4>
                                <select class="multiselect" multiple="multiple">
                                    <option value="cheese">Cheese</option>
                                    <option value="tomatoes">Tomatoes</option>
                                    <option value="mozarella">Mozzarella</option>
                                    <option value="mushrooms">Mushrooms</option>
                                    <option value="pepperoni">Pepperoni</option>
                                    <option value="onions">Onions</option>
                                </select>
                                <hr>
                                <div style="text-align: left">
                                    <h4><u>Let's do it !</u></h4>

                                    <h5><b>Fill your answer in the blank.</b></h5><!--[Question Title]-->
                                    <p>1. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, <input type="text"> sem <input type="text"> quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et <input type="text"> ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit <input type="text"> amet nibh. Donec sodales sagittis magna. Sed consequat, leo <input type="text"> eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Fusce <input type="text"> vulputate eleifend sapien. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia.</p>
                                    <h5><b>Matching a word.</b></h5><!--[Question Title]-->
                                    <div>
                                        <div>
                                            <select >
                                                <option value="cheese">fggsdf</option>
                                                <option value="tomatoes">fggsdf</option>
                                                <option value="mozarella">fggsdf</option>
                                            </select> 
                                            <span>2. asdffsadf</span><span class="pull-right">fggsdf</span></div><br>
                                        <div>
                                            <select >
                                                <option value="cheese">fggsdf</option>
                                                <option value="tomatoes">fggsdf</option>
                                                <option value="mozarella">fggsdf</option>
                                            </select>  
                                            <span>3. asdffsadf</span><span class="pull-right">fggsdf</span></div><br>
                                        <div>
                                            <select >
                                                <option value="cheese">fggsdf</option>
                                                <option value="tomatoes">fggsdf</option>
                                                <option value="mozarella">fggsdf</option>
                                            </select>  
                                            <span>4. asdffsadf</span><span class="pull-right">fggsdf</span></div><br>
                                        <div>
                                            <select >
                                                <option value="cheese">fggsdf</option>
                                                <option value="tomatoes">fggsdf</option>
                                                <option value="mozarella">fggsdf</option>
                                            </select>  
                                            <span>5. asdffsadf</span><span class="pull-right">fggsdf</span></div><br>
                                        <div>
                                            <select >
                                                <option value="cheese">fggsdf</option>
                                                <option value="tomatoes">fggsdf</option>
                                                <option value="mozarella">fggsdf</option>
                                            </select>  
                                            <span>6. asdffsadf</span><span class="pull-right">fggsdf</span></div><br>
                                        <div>
                                            <select>
                                                <option value="cheese">fggsdf</option>
                                                <option value="tomatoes">fggsdf</option>
                                                <option value="mozarella">fggsdf</option>
                                            </select>  
                                            <span>7. asdffsadf</span><span class="pull-right">fggsdf</span></div><br>
                                    </div>
                                    <h5><b>Choose collect answer</b></h5>
                                    <div>
                                        <h5>8. which one collect?</h5>
                                        <input type="radio"> A. aaaaa
                                        <input type="radio"> B. aaaaa
                                        <input type="radio"> C. aaaaa
                                        <input type="radio"> D. aaaaa
                                    </div>
                                    <div>
                                        <h5>9. which one collect?</h5>
                                        <input type="radio"> A. aaaaa
                                        <input type="radio"> B. aaaaa
                                        <input type="radio"> C. aaaaa
                                        <input type="radio"> D. aaaaa
                                    </div>
                                    <div>
                                        <h5>10. which one collect(more than one answer)?</h5>
                                        <input type="checkbox"> A. aaaaa
                                        <input type="checkbox"> B. aaaaa
                                        <input type="checkbox"> C. aaaaa
                                        <input type="checkbox"> D. aaaaa
                                    </div>
                                    <h5><b>Explain answer</b></h5>
                                    <div>
                                        <h5>11. please explain concept briefly.</h5>
                                        <textarea class="form-control"></textarea>
                                    </div>
                                    <br>
                                    <input type="submit" value="Send !!" class="btn btn-primary center-block">
                                </div>
                                <br>
                            </form>
                        </div>
                    </div>
                    <br><hr>  
                    <h3>Comment</h3>
                    <div class="media">
                        <a class="pull-left" href="#">
                            <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                        </a>
                        <div class="media-body">
                            <h4 class="media-heading">AJ.AAA SSSSS<small class="pull-right">16/01/57</small></h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                        </div>
                    </div>
                    <div class="media">
                        <a class="pull-left" href="#">
                            <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                        </a>
                        <div class="media-body">
                            <h4 class="media-heading">AJ.AAA SSSSS<small class="pull-right">16/01/57</small></h4>
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


    </body>
    <script>
        $(function() {
            $("#pvVersionTable").hide();
            $("#pvVs").click(function() {
                $("#pvVersionTable").slideToggle();
                $(this).find("span").toggleClass("glyphicon-chevron-down");
            });
            $('.multiselect').multiselect();
        });
    </script>
</html>
