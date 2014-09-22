<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cf" uri="/WEB-INF/tlds/functions.tld" %>  
<div><h3>${nt} <button class='btn btn-default pull-right'>Clear all</button></h3></div>
<c:forEach items="${noti}" var="n"> 
    <c:set value="${cf:getNameByID(n.acc_id)}" var="ann_acc"/>
    <div class="media">
        <a class="pull-left" href="#">
            <img width="64" src="${ann_acc.profile_pic}">
        </a>
        <div class="media-body">
            <h4 class="media-heading">${ann_acc.firstname}  <small>(${cf:getCourseNameByID(n.course_id)})</small><small class="pull-right">${cf:formatTime(n.noti_date)}</small></h4>
            <p>${n.text}</p>
        </div>
    </div>
</c:forEach>
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