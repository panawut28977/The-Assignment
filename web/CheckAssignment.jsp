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
        <title>Course ...</title>
        <style>
            #pvVs{
                text-align: center;
                background-color: #F5F5F5;
                padding: 10px 0;
            }

            .q_no{
                font-size: 20px;
                font-weight: bold;
            }

            #input_score .row{
                padding-top: 5px;
                padding-bottom: 5px;
            }

            .assignmentBox input[type="number"]{
                margin-left: 10px;
                margin-right: 10px;
            } 
            
            .match_word_check input[type="number"]{
                width: 40px;
                 margin-left: 2px;
                margin-right: 2px;
            }
        </style>
    </head>
    <body>
        <%@include file="META-INF/page/header_bar.jsp"%>
        <div class="container">
            <div class="row">
                <%@include file="META-INF/page/side_bar.jsp"%>
                <div class="col-md-9" style="padding-bottom: 20px">
                    <%@include file="META-INF/page/CourseHeader.jsp" %>
                    <%@include file="META-INF/page/CourseTab.jsp"%>
                    <ol class="breadcrumb" style="margin-top: 15px" >
                        <li><a href="course.jsp?tab=AllAssignment">Assignment</a></li>
                        <li><a href="SendedAssignment.jsp?tab=AllAssignment"">งานที่ 1.....</a></li>
                        <li class="active"><a href="#">Check งานที่ 1.....</a></li>
                    </ol>
                    <c:choose>
                        <c:when test="${sessionScope.wkt eq 'file'}">
                            <a href="Checkcopy.jsp?tab=AllAssignment" class="btn btn-primary" data-toggle="tooltip"  id="checkcopy" data-placement="bottom" title="If you want to know this person copied or not? click it!" type="button">
                                <span class="glyphicon glyphicon-copyright-mark"></span> 
                                Check copy
                            </a>
                            <div style="text-align: center">
                                <h4>Individual work</h4>
                                <div class="media">
                                    <a href="#">
                                        <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading">rrrr fff</h4>
                                    </div>
                                </div>
                            </div>
                            <iframe class="col-md-12" style="min-height: 600px;margin-top: 20px" src="https://crocodoc.com/view/6I6ZCzn-Oa76CUAaOoYDIN9aePfp_dC-fXxe8Yb6V5vSNpHp92goitG0WHzoECg1Hk3nY558OCHOExVKYkLJfbENlNk_U21XY_ssCg"/></iframe> 
                            <div style="text-align: center;background-color: gainsboro;clear: both;padding: 5px 0;"><a target="_blank" style="text-align: center" href="https://crocodoc.com/view/-ib0cktkcFMjSi4R8o7WuJA5h1jmqs1pz2zwaHEXY8S52MtxgfaIQc6TE82tLEa9onv9XVtz7_-zOBsX_ENcDScbUuPN2d55N970XA">see in new window.</a></div>
                            <div class="row" style="padding-top: 20px;clear: both;">
                                <form role="form" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Score (Max 10 point)</label>
                                        <div class="col-md-2">
                                            <input type="number" class="form-control">
                                        </div>
                                        <div class="col-md-2">
                                            <input type="submit" value="save" class="btn btn-primary btn-block">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </c:when>
                        <c:when test="${sessionScope.wkt eq 'web'}">
                            <div >
                                <div>
                                    <h4 style="text-align: center" >Group work</h4>
                                    <div class="row" style="text-align: center">
                                        <div class="col-md-2">
                                            <a href="#">
                                                <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                                            </a>
                                            <div class="media-body">
                                                <h4 class="media-heading">dddd bbb</h4>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <a href="#">
                                                <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                                            </a>
                                            <div class="media-body">
                                                <h4 class="media-heading">adfsa rrrrr</h4>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <a href="#">
                                                <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                                            </a>
                                            <div class="media-body">
                                                <h4 class="media-heading">rrrr fff</h4>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <a href="#">
                                                <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                                            </a>
                                            <div class="media-body">
                                                <h4 class="media-heading">dddd bbb</h4>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <a href="#">
                                                <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                                            </a>
                                            <div class="media-body">
                                                <h4 class="media-heading">adfsa rrrrr</h4>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <a href="#">
                                                <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                                            </a>
                                            <div class="media-body">
                                                <h4 class="media-heading">rrrr fff</h4>
                                            </div>
                                        </div>
                                    </div>
                                    <hr style="clear: both">
                                    <div class="assignmentBox col-md-12">
                                        <form>
                                            <h4><u>Let's do it !</u></h4>

                                            <h5><b>Fill your answer in the blank.</b></h5><!--[Question Title]-->
                                            <p class="match_word_check">1. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, <input disabled="yes" type="text" value="lit"><input type="number" name="score" value="1"><span class="text-success"><i class="glyphicon glyphicon-ok-circle"></i></span> sem 
                                                <input disabled="yes" type="text" value="eiusmod"><input type="number" name="score" value="1"><span class="text-success"><i class="glyphicon glyphicon-ok-circle"></i></span> quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et 
                                                <input disabled="yes" type="text"value="sed"><input type="number" name="score" value="1"><span class="text-success"><i class="glyphicon glyphicon-ok-circle"></i></span> ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit 
                                                <input disabled="yes" type="text" value="eeiudb"><input type="number" name="score" value="0"><span class="text-danger"><i class="glyphicon glyphicon-remove-circle"></i></span>amet nibh. Donec sodales sagittis magna. Sed consequat, leo 
                                                <input disabled="yes" type="text" value="epioan"><input type="number" name="score" value="1"><span class="text-success"><i class="glyphicon glyphicon-ok-circle"></i></span> eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Fusce 
                                                <input disabled="yes" type="text" value="eoirr"><input type="number" name="score" value="1"><span class="text-success"><i class="glyphicon glyphicon-ok-circle"></i></span> vulputate eleifend sapien. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia.
                                                
                                            </p>

                                            <h5><b>Matching a word.</b></h5><!--[Question Title]-->
                                            <div>
                                                <div>
                                                    <select disabled="yes" >
                                                        <option value="cheese">fggsdf</option>
                                                        <option value="tomatoes">fggsdf</option>
                                                        <option value="mozarella">fggsdf</option>
                                                    </select> 
                                                    <span>2. asdffsadf</span> 
                                                    <span class="pull-right">
                                                        <input type="number" placeholder="Max 1 point" value="0"> <span class="text-danger"><i class="glyphicon glyphicon-remove-circle"></i></span>
                                                    </span>
                                                    <span class="pull-right">fggsdf </span>
                                                </div>
                                                <br>
                                                <div>
                                                    <select disabled="yes" >
                                                        <option value="cheese">fggsdf</option>
                                                        <option value="tomatoes">fggsdf</option>
                                                        <option value="mozarella">fggsdf</option>
                                                    </select>  
                                                    <span>3. asdffsadf</span>
                                                    <span class="pull-right">
                                                        <input type="number" placeholder="Max 1 point" value="1"> <span class="text-success"><i class="glyphicon glyphicon-ok-circle"></i></span>
                                                    </span>
                                                    <span class="pull-right">fggsdf </span></div><br>
                                                <div>
                                                    <select disabled="yes" >
                                                        <option value="cheese">fggsdf</option>
                                                        <option value="tomatoes">fggsdf</option>
                                                        <option value="mozarella">fggsdf</option>
                                                    </select>  
                                                    <span>4. asdffsadf</span>
                                                    <span class="pull-right">
                                                        <input type="number" placeholder="Max 1 point" value="1"><span class="text-success"><i class="glyphicon glyphicon-ok-circle"></i></span>
                                                    </span>
                                                    <span class="pull-right">fggsdf </span></div><br>
                                                <div>
                                                    <select disabled="yes" >
                                                        <option value="cheese">fggsdf</option>
                                                        <option value="tomatoes">fggsdf</option>
                                                        <option value="mozarella">fggsdf</option>
                                                    </select>  
                                                    <span>5. asdffsadf</span>
                                                    <span class="pull-right">
                                                        <input type="number" placeholder="Max 1 point" value="1"><span class="text-success"><i class="glyphicon glyphicon-ok-circle"></i></span>
                                                    </span>
                                                    <span class="pull-right">fggsdf </span></div><br>
                                                <div>
                                                    <select disabled="yes" >
                                                        <option value="cheese">fggsdf</option>
                                                        <option value="tomatoes">fggsdf</option>
                                                        <option value="mozarella">fggsdf</option>
                                                    </select>  
                                                    <span>6. asdffsadf</span>
                                                    <span class="pull-right">
                                                        <input type="number" placeholder="Max 1 point" value="0"> <span class="text-danger"><i class="glyphicon glyphicon-remove-circle"></i></span>
                                                    </span>
                                                    <span class="pull-right">fggsdf </span></div><br>
                                                <div>
                                                    <select disabled="yes">
                                                        <option value="cheese">fggsdf</option>
                                                        <option value="tomatoes">fggsdf</option>
                                                        <option value="mozarella">fggsdf</option>
                                                    </select>  
                                                    <span>7. asdffsadf</span>
                                                    <span class="pull-right">
                                                        <input type="number" placeholder="Max 1 point" value="0"> <span class="text-danger"><i class="glyphicon glyphicon-remove-circle"></i></span>
                                                    </span>
                                                    <span class="pull-right">fggsdf </span></div><br>
                                            </div>
                                            <h5><b>Choose collect answer</b></h5>
                                            <div>
                                                <h5>8. which one collect?</h5>
                                                <input disabled="yes" type="radio"> A. aaaaa
                                                <input disabled="yes" type="radio"> B. aaaaa
                                                <input disabled="yes" type="radio" checked="yes"> C. aaaaa
                                                <input disabled="yes" type="radio"> D. aaaaa
                                                <input type="number" placeholder="Max 1 point" value="1"><span class="text-success"><i class="glyphicon glyphicon-ok-circle"></i></span>
                                            </div>
                                            <div>
                                                <h5>9. which one collect?</h5>
                                                <input disabled="yes" type="radio"  checked="yes"> A. aaaaa
                                                <input disabled="yes" type="radio"> B. aaaaa
                                                <input disabled="yes" type="radio"> C. aaaaa
                                                <input disabled="yes" type="radio"> D. aaaaa
                                                <input type="number" placeholder="Max 1 point" value="1"><span class="text-success"><i class="glyphicon glyphicon-ok-circle"></i></span>
                                            </div>
                                            <div>
                                                <h5>10. which one collect(more than one answer)?</h5>
                                                <input disabled="yes" type="checkbox" checked="yes"> A. aaaaa
                                                <input disabled="yes" type="checkbox"> B. aaaaa
                                                <input disabled="yes" type="checkbox"> C. aaaaa
                                                <input disabled="yes" type="checkbox"> D. aaaaa
                                                <input type="number" placeholder="Max 1 point" value="0"> <span class="text-danger"><i class="glyphicon glyphicon-remove-circle"></i></span>
                                            </div>
                                            <h5><b>Explain answer</b></h5>
                                            <div>
                                                <h5>11. please explain concept briefly.</h5>
                                                <p>tinctio. Nam libero <span class="hilight">tempore,</span> cum soluta nobis est eligendi <span class="hilight">optio</span>  cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. <span class="hilight">Temporibus autem quibusdam et</span>  aut officiis debitis aut rerum necessitatibus saepe eveniet ut et <span class="hilight">voluptates repudiandae sint</span>  et molestiae non recusandae. <span class="hilight">Itaque earum rerum</span> hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis dol</p>
                                                <br>
                                                <input type="number" placeholder="Max 1 point" value="">
                                            </div>
                                            <br>
                                            <input type="submit" value="save" class="btn btn-primary">
                                        </form>
                                    </div>
                                </div>
                                <br>
                            </div> 
                        </c:when>
                    </c:choose>
                    <div style="clear: both;padding: 10px 0"></div>  
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
        <script>
            $(document).ready(function() {
                var aTable = $('#SendedAssignment').dataTable();
                $('#checkcopy').tooltip("hide");
            });
        </script>
    </body>
</html>
