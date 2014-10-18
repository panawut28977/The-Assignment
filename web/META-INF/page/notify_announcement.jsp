<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cf" uri="/WEB-INF/tlds/functions.tld" %>  
<link rel="stylesheet" href="css/timeline.css"/>
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
                        <h2>${ann_acc.firstname} <span class="text-muted"><span class="glyphicon glyphicon-bullhorn"></span> announces  in</span> <a href="setCourseSession?cId=${n.course_id}"><span class="label label-default">${cf:getCourseNameByID(n.course_id)}</span></a><small class="pull-right">${cf:formatTime(n.noti_date)}</small></h2>
                        <!--<p>${n.text}</p>-->
                    </div>
                </div>
            </article>
            <!--    <div class="media">
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
    <a class="pull-left" href="#">
        <img width="64" src="img/avatar.jpg">
    </a>
    <div class="media-body">
        <h4 class="media-heading">AJ.Kittiphan Puapholthep<small class="pull-right">16/01/57</small></h4>
        <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
    </div>
</div>
<div class="media">
    <a class="pull-left" href="#">
        <img width="64" src="img/avatar.jpg">
    </a>
    <div class="media-body">
        <h4 class="media-heading">AJ.Kittiphan Puapholthep<small class="pull-right">16/01/57</small></h4>
        <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
    </div>
</div>
<div class="media">
    <a class="pull-left" href="#">
        <img width="64" src="img/avatar.jpg">
    </a>
    <div class="media-body">
        <h4 class="media-heading">AJ.Kittiphan Puapholthep<small class="pull-right">16/01/57</small></h4>
        <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
    </div>
</div>-->