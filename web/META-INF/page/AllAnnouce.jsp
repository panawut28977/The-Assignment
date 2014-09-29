<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cf" uri="/WEB-INF/tlds/functions.tld" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script>
    $(function() {
        var aTable = $('#AllAnnounce').dataTable({
            /* Disable initial sort */
            "aaSorting": [],
            "bLengthChange": false,
            "bFilter": true,
            "bInfo": false,
            "bSort": false
        });
    });
</script>
<c:choose>
    <c:when test="${announcement.size()==0}">
        <h1 class="text-muted" style="text-align: center">No announement.</h1>
    </c:when>
    <c:otherwise>
        <div class="table-responsive" style="min-height: 520px; margin-top: 30px">
            <table class="table table-striped " id="AllAnnounce">
                <thead>
                    <tr>
                        <td></td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${announcement}" var="ann">
                        <tr>
                            <td>
                                <div class="media">
                                    <a class="pull-left" href="#">
                                        <img width="64" src="${ann.an_acc.profile_pic}">
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading"><small>${ann.an_acc.firstname} ${ann.an_acc.lastname} (${cf:getCourseNameByID(ann.course)})</small><small class="pull-right">${cf:formatTime(ann.announce_date)}</small></h4>
                                        <p>${ann.content}</p>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:otherwise>
</c:choose>
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