<%-- 
    Document   : home
    Created on : Apr 6, 2014, 5:08:52 PM
    Author     : JenoVa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@taglib uri="/WEB-INF/tlds/functions.tld" prefix="cf" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="META-INF/page/include_css.jsp" %>
        <%@include file="META-INF/page/include_js.jsp" %>
        <title>${curAm.name}</title>
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

            .matchWord input[type="number"],.fillBlank input[type="number"]{
                width: 40px;
                margin-left: 2px;
                margin-right: 2px;
            }

            #newComment{
                display: none;
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
                    <%@include file="META-INF/page/CourseHeader.jsp" %>
                    <%@include file="META-INF/page/CourseTab.jsp"%>
                    <ol class="breadcrumb" style="margin-top: 15px" >
                        <li><a href="course.jsp?tab=AllAssignment">Assignment</a></li>
                        <li><a href="GetSentAssignment?am_id=${curAm.am_id}">${curAm.name}</a></li>
                        <li class="active"><a href="#">Check Assignment# 1.....</a></li>
                    </ol>
                    <c:choose>
                        <c:when test="${curAm.ass_type eq 'file'}">
                            <a href="Checkcopy.jsp?tab=AllAssignment" class="btn btn-primary pull-right" data-toggle="tooltip"  id="checkcopy" data-placement="bottom" title="If you want to know this person copied or not? click it!" type="button">
                                <span class="glyphicon glyphicon-copyright-mark"></span> 
                                Check copy
                            </a>
                            <a class="btn pull-right"  data-toggle="modal" data-target="#allAmVersion"  id="allversion">
                                See all versions
                            </a>
                            <br/><br/>
                            <div>
                                <c:choose>
                                    <c:when test="${curAm.total_member eq 1 && send_acc ne null}">
                                        <h4>Individual work</h4>
                                        <div class="media">
                                            <a href="#">
                                                <img width="64" src="${send_acc.profile_pic}">
                                            </a>
                                            <div class="media-body">
                                                <h4 class="media-heading">${send_acc.firstname} ${send_acc.lastname}</h4>
                                            </div>
                                        </div>
                                    </c:when>
                                    <c:when test="${gAm ne null}">
                                        <h4>Group No. ${g.g_no}</h4>
                                        <c:forEach items="${gAm}" var="m">
                                            <div class="member">
                                                <img width="64" src="${m.profile_pic}">
                                                <h4>${m.firstname} ${m.lastname}</h4>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                </c:choose>
                            </div>
                            <iframe class="col-md-12" style="min-height: 600px;margin-top: 20px" src="https://crocodoc.com/view/${sessionKey}"/></iframe> 
                            <div style="text-align: center;background-color: gainsboro;clear: both;padding: 5px 0;"><a target="_blank" style="text-align: center" href="https://crocodoc.com/view/${sessionKey}">see in new window.</a></div>
                            <div class="row" style="padding-top: 20px;clear: both;">
                                <form role="form" method="post" action="updateScoreStAmFile" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-md-4 control-label">Score (Max ${curAm.fully_mark} point)</label>
                                        <div class="col-md-2">
                                            <input type="number" min="0" max="${curAm.fully_mark}" class="form-control" value="${sa.score}" required="yes" name="score">
                                        </div>
                                        <div class="col-md-2">
                                            <input type="submit" value="save" class="btn btn-primary btn-block">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </c:when>
                        <c:when test="${curAm.ass_type eq 'web'}">
                            <div >
                                <div>
                                    <a href="#" class="btn btn-primary pull-right" data-toggle="tooltip"  id="checkcopy" data-placement="bottom" title="Auto Checking answer like a magic click here." type="button">
                                        <span class="glyphicon glyphicon-ok-circle"></span> 
                                        Auto Checking
                                    </a>
                                    <br/><br/>
                                    <div>
                                        <c:choose>
                                            <c:when test="${curAm.total_member eq 1 && send_acc ne null}">
                                                <h4>Individual work</h4>
                                                <div class="media">
                                                    <a href="#">
                                                        <img width="64" src="${send_acc.profile_pic}">
                                                    </a>
                                                    <div class="media-body">
                                                        <h4 class="media-heading">${send_acc.firstname} ${send_acc.lastname}</h4>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:when test="${gAm ne null}">
                                                <h4>Group No. ${g.g_no}</h4>
                                                <c:forEach items="${gAm}" var="m">
                                                    <div class="member">
                                                        <img width="64" src="${m.profile_pic}">
                                                        <h4>${m.firstname} ${m.lastname}</h4>
                                                    </div>
                                                </c:forEach>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                    <hr style="clear: both">
                                    <form>
                                        <div class="assignmentBox col-md-12">
                                            <h4><u>Let's check it !</u></h4>
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
                                                        <c:set var="stanswer" value="${ct_cf:getStAMQuestion(sa.st_am_id, q.q_id)}"/>
                                                        <c:set var="clist" value="${fn:substring(q.q_choice_list, 1, q.q_choice_list.length()-1)}"/>
                                                        <c:set var="anslist" value="${fn:substring(q.q_answer_list, 1, q.q_answer_list.length()-1)}"/>
                                                        <c:set var="stans" value="${fn:substring(stanswer.get(0).answer, 1, stanswer.get(0).answer.length()-1)}"/>
                                                        <c:set var="choicesp" value="${fn:split(clist, ', ')}" />
                                                        <c:set var="stanssp" value="${fn:split(stans, ', ')}" />
                                                        <div>
                                                            <p>${q.q_no}.) ${q.q_text}</p>
                                                            <c:choose>
                                                                <c:when test="${q.q_category eq 'one'}">
                                                                    <c:forEach items="${choicesp}" var="choice">
                                                                        <input type="radio" name="${seqno}answer" value="${choice}" disabled="yes"
                                                                               <c:forEach items="${stanssp}" var="sans">
                                                                                   ${sans}
                                                                                   <c:if test="${sans eq choice}">
                                                                                       checked="yes"
                                                                                   </c:if>
                                                                               </c:forEach>
                                                                               > ${choice}
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:when test="${q.q_category eq 'multiple'}">
                                                                    <c:forEach items="${choicesp}" var="choice">
                                                                        <input type="checkbox" name="${seqno}answer" value="${choice}" disabled="yes"
                                                                               <c:forEach items="${stanssp}" var="sans">
                                                                                   ${sans}
                                                                                   <c:if test="${sans eq choice}">
                                                                                       checked="yes"
                                                                                   </c:if>
                                                                               </c:forEach>
                                                                               > ${choice}
                                                                    </c:forEach>
                                                                </c:when>
                                                                <c:when test="${q.q_category eq 'tf'}">
                                                                    <input type="radio" name="${seqno}answer" value="true" disabled="yes" <c:if test="${stans eq 'true'}">checked="yes"</c:if>> True
                                                                    <input type="radio" name="${seqno}answer" value="false" disabled="yes" <c:if test="${stans eq 'true'}">checked="yes"</c:if>> False
                                                                </c:when>
                                                            </c:choose>
                                                            <input type="number" name="score" placeholder="score"/>
                                                            <input type="hidden" name="${seqno}q_id" value="${q.q_id}"/>
                                                            <input type="hidden" value="multiple_choice" name="${seqno}q_type">
                                                            <input type="hidden" name="seqno" value="${seqno}">
                                                        </div>
                                                        <c:set value="${seqno+1}" var="seqno" />
                                                    </c:when>
                                                    <c:when test="${q.q_type eq 'explain'}">
                                                        <c:set var="stanswer" value="${ct_cf:getStAMQuestion(sa.st_am_id, q.q_id)}"/>
                                                        <div>
                                                            <p>${q.q_no}.) ${q.q_text}</p>
                                                            <textarea class="form-control" name="${seqno}answer" disabled="yes">${stanswer.get(0).answer}</textarea><br/>
                                                            <input type="number" name="score" placeholder="score"/>
                                                            <input type="hidden" name="${seqno}q_id" value="${q.q_id}"/>
                                                            <input type="hidden" value="explain" name="${seqno}q_type">
                                                            <input type="hidden" name="seqno" value="${seqno}">
                                                        </div>
                                                        <c:set value="${seqno+1}" var="seqno" />
                                                    </c:when>
                                                    <c:when test="${q.q_type eq 'matchWord'}">
                                                        <c:if test="${q.q_id != used_id}">
                                                            <c:set var="stanswer" value="${ct_cf:getStAMQuestion(sa.st_am_id, q.q_id)}"/>
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
                                                            <div class="matchWord">
                                                                <p>${q.q_no}.) ${q.q_title}</p>
                                                                <div class="col-md-8">
                                                                    <c:forEach begin="0" end="${stanswer.size()-1}" var="a">
                                                                        <b><u>${stanswer.get(a).answer}</u></b> <span>${listchs[a]} <input type="number" name="score" placeholder="score"/></span>
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
                                                            <c:set var="stanswer" value="${ct_cf:getStAMQuestion(sa.st_am_id, q.q_id)}"/>
                                                            <div class="fillBlank">
                                                                <!-- algor for replace string index with input text-->
                                                                <c:set value="${q.q_text}" var="q_text"/>
                                                                <!-- variable for loop back -->
                                                                <c:set var="countb" value="${curAm.questionList.size()}"/>
                                                                <!-- variable for loop st answer -->
                                                                <c:set var="countStAns" value="${stanswer.size()}"/>
                                                                <c:forEach begin="1" end="${curAm.questionList.size()}" var="f">
                                                                    <c:set var="countb" value="${countb-1}"/>
                                                                    <c:if test="${q.q_id  eq curAm.questionList.get(countb).q_id}">
                                                                        <c:set var="countStAns" value="${countStAns-1}"/>
                                                                        <c:set var="q_start_index" value="${curAm.questionList.get(countb).q_start_index}" />
                                                                        <c:set var="q_end_index" value="${curAm.questionList.get(countb).q_end_index}"/>
                                                                        <c:set var="reptext" value="<input type='text' name='${seqno}answer' value='${stanswer.get(countStAns).answer}' disabled='yes'/><input type='number' name='score' placeholder='score'/>"/>
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
                                            <!--                                            
                                                                                                                                    <h5><b><u>Instruction:</u> Fill in the blank</b></h5>[Question Title]
                                                                                                                                    <p class="match_word_check">1.) Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, <input disabled="yes" type="text" value="lit"><input type="number" name="score" value="1"><span class="text-success"><i class="glyphicon glyphicon-ok-circle"></i></span> sem 
                                                                                                                                        <input disabled="yes" type="text" value="eiusmod"><input type="number" name="score" value="1"><span class="text-success"><i class="glyphicon glyphicon-ok-circle"></i></span> quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et 
                                                                                                                                        <input disabled="yes" type="text"value="sed"><input type="number" name="score" value="1"><span class="text-success"><i class="glyphicon glyphicon-ok-circle"></i></span> ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit 
                                                                                                                                        <input disabled="yes" type="text" value="eeiudb"><input type="number" name="score" value="0"><span class="text-danger"><i class="glyphicon glyphicon-remove-circle"></i></span>amet nibh. Donec sodales sagittis magna. Sed consequat, leo 
                                                                                                                                        <input disabled="yes" type="text" value="epioan"><input type="number" name="score" value="1"><span class="text-success"><i class="glyphicon glyphicon-ok-circle"></i></span> eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Fusce 
                                                                                                                                        <input disabled="yes" type="text" value="eoirr"><input type="number" name="score" value="1"><span class="text-success"><i class="glyphicon glyphicon-ok-circle"></i></span> vulputate eleifend sapien. Vestibulum purus quam, scelerisque ut, mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia.
                                                                                        
                                                                                                                                    </p>
                                                                                                                                    <h5><b><u>Instruction:</u> Match the words</b></h5>    
                                                                                                                                    <h5>2.) Please match the suitable words form below.</h5>[Question Title]
                                                                                                                                    <div>
                                                                                                                                        <div>
                                                                                                                                            <select disabled="yes" >
                                                                                                                                                <option value="cheese">fggsdf</option>
                                                                                                                                                <option value="tomatoes">fggsdf</option>
                                                                                                                                                <option value="mozarella">fggsdf</option>
                                                                                                                                            </select> 
                                                                                                                                            <span>asdffsadf</span> 
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
                                                                                                                                            <span>asdffsadf</span>
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
                                                                                                                                            <span>asdffsadf</span>
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
                                                                                                                                            <span>asdffsadf</span>
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
                                                                                                                                            <span>asdffsadf</span>
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
                                                                                                                                            <span>asdffsadf</span>
                                                                                                                                            <span class="pull-right">
                                                                                                                                                <input type="number" placeholder="Max 1 point" value="0"> <span class="text-danger"><i class="glyphicon glyphicon-remove-circle"></i></span>
                                                                                                                                            </span>
                                                                                                                                            <span class="pull-right">fggsdf </span></div><br>
                                                                                                                                    </div>
                                                                                                                                    <h5><b><u>Instruction:</u> Choose the best answer(Multiple choices)</b></h5>
                                                                                                                                    <div>
                                                                                                                                        <h5>3.) which one collect?</h5>
                                                                                                                                        <input disabled="yes" type="radio"> A. aaaaa
                                                                                                                                        <input disabled="yes" type="radio"> B. aaaaa
                                                                                                                                        <input disabled="yes" type="radio" checked="yes"> C. aaaaa
                                                                                                                                        <input disabled="yes" type="radio"> D. aaaaa
                                                                                                                                        <input type="number" placeholder="Max 1 point" value="1"><span class="text-success"><i class="glyphicon glyphicon-ok-circle"></i></span>
                                                                                                                                    </div>
                                                                                                                                    <div>
                                                                                                                                        <h5>4.) which one collect?</h5>
                                                                                                                                        <input disabled="yes" type="radio"  checked="yes"> A. aaaaa
                                                                                                                                        <input disabled="yes" type="radio"> B. aaaaa
                                                                                                                                        <input disabled="yes" type="radio"> C. aaaaa
                                                                                                                                        <input disabled="yes" type="radio"> D. aaaaa
                                                                                                                                        <input type="number" placeholder="Max 1 point" value="1"><span class="text-success"><i class="glyphicon glyphicon-ok-circle"></i></span>
                                                                                                                                    </div>
                                                                                                                                    <div>
                                                                                                                                        <h5>5.) which one collect(more than one answer)?</h5>
                                                                                                                                        <input disabled="yes" type="checkbox" checked="yes"> A. aaaaa
                                                                                                                                        <input disabled="yes" type="checkbox"> B. aaaaa
                                                                                                                                        <input disabled="yes" type="checkbox"> C. aaaaa
                                                                                                                                        <input disabled="yes" type="checkbox"> D. aaaaa
                                                                                                                                        <input type="number" placeholder="Max 1 point" value="0"> <span class="text-danger"><i class="glyphicon glyphicon-remove-circle"></i></span>
                                                                                                                                    </div>
                                                                                                                                    <h5><b><u>Instruction:</u> Explain answer</b></h5>
                                                                                                                                    <div>
                                                                                                                                        <h5>6.) please explain concept briefly.</h5>
                                                                                                                                        <p>tinctio. Nam libero <span class="hilight">tempore,</span> cum soluta nobis est eligendi <span class="hilight">optio</span>  cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. <span class="hilight">Temporibus autem quibusdam et</span>  aut officiis debitis aut rerum necessitatibus saepe eveniet ut et <span class="hilight">voluptates repudiandae sint</span>  et molestiae non recusandae. <span class="hilight">Itaque earum rerum</span> hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis dol</p>
                                                                                                                                        <br>
                                                                                                                                        <input type="number" placeholder="Max 1 point" value="">
                                                                                                                                    </div>
                                                                                                                                    <br>
                                                                                                                                    <input type="submit" value="save" class="btn btn-primary">-->
                                        </div>
                                    </form>
                                </div>
                                <br>
                            </div> 
                        </c:when>
                    </c:choose>
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
        <div class="modal fade" id="allAmVersion" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">All Assignment version</h4>
                    </div>
                    <div class="modal-body">
                        <table class="table" >
                            <thead>
                                <tr>
                                    <td>Version</td>
                                    <td>Name</td>
                                    <td>Sent date</td>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="count" value="${safv.size()}"/>
                                <c:forEach  items="${safv}" var="f">
                                    <tr >
                                        <td>${count}</td>
                                        <td><a href="anotherAmFile?uuid=${f.uuid}">${f.path_file}</a></td>
                                        <td>${f.send_date}</td>
                                        <c:set value="${cf:getNameByID(f.send_acc_id)}" var="a"/>
                                    </tr>
                                    <c:set var="count" value="${count-1}"/>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function() {
                var aTable = $('#SentAssignment').dataTable();
                $('#checkcopy').tooltip("hide");
                $('#allversion').tooltip("hide");

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
            });
        </script>
    </body>
</html>
