<%@page contentType="text/html" pageEncoding="UTF-8"%>
${ac.listStudentScore}
<c:if test="${ac.announcement.size()==0}">
        <h1 class="text-muted" style="text-align: center">ยังไม่มีข่าวหรือประกาศครับ XD</h1>
    </c:if>
<c:forEach items="${ac.announcement}" var="ann">
    <div class="media">
        <a class="pull-left" href="#">
            <img width="64" src="${ann.an_acc.profile_pic}">
        </a>
        <div class="media-body">
            <h4 class="media-heading">${ann.title} - <small>${ann.an_acc.firstname} ${ann.an_acc.lastname}</small><small class="pull-right">${cf:formatTime(ann.announce_date)}</small></h4>
            <p>${ann.content}</p>
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