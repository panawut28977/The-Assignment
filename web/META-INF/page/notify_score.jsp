<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cf" uri="/WEB-INF/tlds/functions.tld" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/timeline.css"/>
<script>
    function setCourse(course_id, link) {
        var nexturl = link;
        var queryStringText = encodeURIComponent(nexturl);
        var url = "setCourseSession?cId=" + course_id + "&&nexturl=" + queryStringText;
        location.href = url;
    }
</script>
<div><h3>${param.nt}<a class='btn btn-default pull-right' href="clearNotify">Clear all</a></h3></div>

<div style="margin-top: 20px">
    <div class="timeline-centered">
        <c:forEach items="${noti}" var="n"> 
            <c:set value="${cf:getNameByID(n.acc_id)}" var="ann_acc"/>
            <article class="timeline-entry">
                <div class="timeline-entry-inner">
                    <!--                    <div class="timeline-icon bg-success">
                                            <span class="glyphicon glyphicon-stats" style="font-size: 36px"></span>
                                        </div>-->
                    <div class="timeline-icon bg-success">
                        <img src="${ann_acc.profile_pic}" width="40"/>
                    </div>
                    <div class="timeline-label">
                        <h2>${n.text} <a onclick="setCourse(${n.course_id},'${n.link}')" class="usepointer"><span class="label label-default ">${cf:getCourseNameByID(n.course_id)}</span></a>  <small class="pull-right">${cf:formatTime(n.noti_date)}</small></h2>
                        <!--<p>${n.text}</p>-->
                    </div>
                </div>
            </article>
            <!--            <div class="media">
                            <span class="glyphicon glyphicon-stats pull-left" style="font-size: 64px"></span>
                            <div class="media-body">
                                <p>${n.text}</p>
                            </div>
                        </div>-->
        </c:forEach>
    </div>
</div>
<!--        
<div class="media">
    <span class="glyphicon glyphicon-stats pull-left" style="font-size: 64px"></span>
    <div class="media-body">
        <h4 class="media-heading">Assignment# 1 ( INT206 Software Development Process II )</h4>
        <h4><b>9/10</b></h4>
    </div>
</div>
<div class="media">
     <span class="glyphicon glyphicon-stats pull-left" style="font-size: 64px"></span>
    <div class="media-body">
        <h4 class="media-heading">Assignment# 2 ( INT206 Software Development Process II )</h4>
        <h4><b>5/10</b></h4>
    </div>
</div> -->