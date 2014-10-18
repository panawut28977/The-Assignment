<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/timeline.css"/>
<style>
    .media-body{
        padding-left: 10px;
    }
</style>
<div><h3>${nt} <a class='btn btn-default pull-right' href="clearNotify">Clear all</a></h3></div>

<div style="margin-top: 20px">
    <div class="timeline-centered">
        <c:forEach items="${noti}" var="n"> 
            <c:set value="${cf:getNameByID(n.acc_id)}" var="ann_acc"/>
            <article class="timeline-entry">
                <div class="timeline-entry-inner">
                    <div class="timeline-icon bg-success">
                        <img src="${ann_acc.profile_pic}" width="40"/>
                    </div>
                    <div class="timeline-label">
                        <h2>${ann_acc.firstname} ${n.text} 
                            <a href="${n.link}">
                                <span class="label label-default">${cf:getCourseNameByID(n.course_id)}</span>
                            </a>
                            <small class="pull-right">${cf:formatTime(n.noti_date)}</small></h2>
                    <!--<p>${n.text}</p>-->
                    </div>
                </div>
            </article>
            <!--            <div class="media">
                            <a class="pull-left" href="#">
                                <img width="64" src="${ann_acc.profile_pic}">
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">${ann_acc.firstname}  <small>(${cf:getCourseNameByID(n.course_id)})</small><small class="pull-right">${cf:formatTime(n.noti_date)}</small></h4>
                                <p>${n.text}</p>
                            </div>
                        </div>-->
        </c:forEach>
    </div>
</div>
<!--<div class="media">
    <a href="course.jsp">
        <span class="glyphicon glyphicon-check pull-left" style="font-size: 64px"></span>
    </a> 
    <div class="media-body">
        <h4 class="media-heading">Your request to join <a href="course.jsp"><b>INT206 Software Development Process II</b></a> is <b>approved</b></h4>
    </div> 
</div>
<div class="media">
    <a href="message.jsp"> 
        <span class="glyphicon glyphicon-envelope pull-left" style="font-size: 64px"></span>
    </a> 
    <div class="media-body">
        <h4 class="media-heading">AJ.Kittiphan Puapholthep <a href="message.jsp">message</a> to you.</h4>
        <h4><b>5/10</b></h4>
    </div>
</div>-->