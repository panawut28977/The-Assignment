<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cf" uri="/WEB-INF/tlds/functions.tld" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    a{
        text-decoration: none;
    }
</style>
<div><h3>${nt}<button class='btn btn-default pull-right'>Clear all</button></h3></div>
<c:forEach items="${noti}" var="n"> 
    <c:set value="${cf:getNameByID(n.acc_id)}" var="ann_acc"/>
    <div class="media">
        <a class="pull-left" href="#">
            <img width="64" src="${ann_acc.profile_pic}">
        </a>
        <div class="media-body">
            <h4 class="media-heading">${ann_acc.firstname}  <small>(${cf:getCourseNameByID(n.course_id)})</small><small class="pull-right">${n.noti_date}</small></h4>
            <p>${n.text}</p>
            <a href="${n.link}">see more</a>
        </div>
    </div>
</c:forEach>

<!--<div class="media">
    <a class="pull-left" href="assignment.jsp">
        <span class="glyphicon glyphicon-file" style="font-size: 64px"></span>
    </a>
    <div class="media-body">
        <h4 class="media-heading">Assignment# 1 ( INT202 Software Development Process II )<small class="pull-right">16/01/57</small></h4>
        <p>ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
        <small class="text-muted">Due date: 18/01/57</small>
    </div>
</div>-->