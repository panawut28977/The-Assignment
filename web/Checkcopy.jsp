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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="META-INF/page/include_css.jsp" %>
        <%@include file="META-INF/page/include_js.jsp" %>
        <title>Check Assignment</title>
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
                        <li><a href="CourseAssignment">Assignment</a></li>
                        <li><a href="GetSentAssignment?am_id=${curAm.am_id}">${curAm.name}.</a></li>
                        <li><a href="checkAssignment?tab=AllAssignment&&st_am_id=${sa.st_am_id}">Check Assignment</a></li>
                        <li class="active"><a href="#">Check copy Assignment</a></li>
                    </ol>
                    <h3>Your student assignment text. <small class="text-muted">(keyword for check with another student assignment)</small>
                    </h3>
                    <p>${keyword}</p>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th><b>Hilight copy text</b></th>
                                <th><b>Like score</b></th>
                                <th><b>Owner</b></th>
                                <!--<th></th>-->
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${indexsetList}" var="index">
                                <tr class="checktext usepointer">
                                    <td>${index[1]}</td><!-- 1 is hltext-->
                                    <td>${index[3]}</td><!-- 3 is score -->
                                    <td>${index[2]}</td><!-- 2 is owner html generate form servlet-->
                                    <!--<td><a href="#" onclick="compareView()">compare view</a></td>-->
                                </tr>
                                <c:set value="${ct_cf:getSafvBySafv(index[4])}" var="detail"/>
                                <c:set value="${ct_cf:getStAm(index[0])}" var="stinfo"/>
                                <tr class="stDetails">
                                    <td>
                                        <b>Name :</b> ${detail.path_file}<br>
                                        <b>Send date :</b> ${ct_cf:formatTime(detail.send_date)}<br>
                                        <b  <c:if test="${stinfo.checked_time != null}">class="text-success"</c:if>>Check status :</b>
                                        <c:choose>
                                            <c:when test="${stinfo.checked_time == null}">
                                                Not check
                                            </c:when>
                                            <c:otherwise>
                                                <span class="glyphicon glyphicon-ok"></span> Checked
                                            </c:otherwise>
                                        </c:choose>

                                    </td>
                                    <td><b>Score : ${stinfo.score}</b></td>
                                    <td><a href="compareCopySl?uuid1=${nowUUid}&&uuid2=${detail.uuid}" target="_blank">Compare view</a></td>
                                </tr>
                            </c:forEach>
                            <!--                            <tr>
                                                            <td>truth</td>
                                                            <td>1.10</td>
                                                            <td><a href="#" onclick="compareView()">compare view</a></td>
                                                        </tr>
                                                        <tr>
                                                            <td>natus error</td>
                                                            <td>1.10</td>
                                                            <td><a href="#" onclick="compareView()">compare view</a></td>
                                                        </tr>
                                                        <tr>
                                                            <td>great explorer</td>
                                                            <td>0.5</td>
                                                            <td><a href="#" onclick="compareView()">compare view</a></td>
                                                        </tr>
                                                        <tr>
                                                            <td>the actual</td>
                                                            <td>0.5</td>
                                                            <td><a href="#" onclick="compareView()">compare view</a></td>
                                                        </tr>
                                                        <tr>
                                                            <td>oluptatem accusantium</td>
                                                            <td>0.5</td>
                                                            <td><a href="#" onclick="compareView()">compare view</a></td>
                                                        </tr>
                                                        <tr>
                                                            <td>denouncing ple</td>
                                                            <td>0.44</td>
                                                            <td><a href="#" onclick="compareView()">compare view</a></td>
                                                        </tr> -->
                        </tbody>
                    </table> 
                    <!--                    <div id="compareBox">
                                            <div class="col-md-6 ">
                                                <h4>rrrr fff work</h4>
                                                and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because
                                            </div>
                                            <div class="col-md-6">
                                                <h4>natus error work</h4>
                                                <p>tinctio. Nam libero <span class="hilight">tempore,</span> cum soluta nobis est eligendi <span class="hilight">optio</span>  cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. <span class="hilight">Temporibus autem quibusdam et</span>  aut officiis debitis aut rerum necessitatibus saepe eveniet ut et <span class="hilight">voluptates repudiandae sint</span>  et molestiae non recusandae. <span class="hilight">Itaque earum rerum</span> hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis dol</p>
                                            </div>
                                        </div>-->
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function() {
                var aTable = $('#SentAssignment').dataTable();
                $('.stDetails').hide();
                $('#checkcopy').tooltip("hide");
                $('#compareBox').hide();
                $('img').tooltip("hide");
                $(".showGroup").popover(
                        {placement: 'top'}
                );
                $(".checktext").click(function() {
                    if (!$(this).next('.stDetails').is(":visible")) {
                        $(this).next('.stDetails').show();
                    } else {
                        $(this).next('.stDetails').hide();
                    }
                });
            });
            function compareView() {
                $('#compareBox').show();
                $("html, body").animate({scrollTop: $('body').height()}, "slow");
            }
        </script>
    </body>
</html>
