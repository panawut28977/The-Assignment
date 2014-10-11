<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cf" uri="/WEB-INF/tlds/functions.tld" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/timeline.css"/>
<style>
    a{
        text-decoration: none;
    }
</style>
<div><h3>${nt}<a class='btn btn-default pull-right' href="clearNotify">Clear all</a></h3></div>

<div style="margin-top: 20px">
    <div class="timeline-centered">
        <c:forEach items="${noti}" var="n"> 
            <c:set value="${cf:getNameByID(n.acc_id)}" var="ann_acc"/>
            <article class="timeline-entry">
                <div class="timeline-entry-inner">
                    <div class="timeline-icon bg-success">
                       <span class="glyphicon glyphicon-file" style="font-size: 36px"></span>
                    </div>
                    <div class="timeline-label">
                        <h2>${ann_acc.firstname} <span><small>(${cf:getCourseNameByID(n.course_id)})</small></span><small class="pull-right">${cf:formatTime(n.noti_date)}</small></h2>
                        <p>${n.text}</p>
                        <a href="${n.link}">see more</a>
                    </div>
                </div>
            </article>
<!--            <div class="media">
                <span class="pull-left" href="#">
                    <span class="glyphicon glyphicon-file" style="font-size: 64px"></span>
                </span>
                <div class="media-body">
                    <h4 class="media-heading">${ann_acc.firstname}  <small>(${cf:getCourseNameByID(n.course_id)})</small><small class="pull-right">${cf:formatTime(n.noti_date)}</small></h4>
                    <p>${n.text}</p>
                    <a href="${n.link}">see more</a>
                </div>
            </div>-->
        </c:forEach>
    </div>
</div>
<!--<div class="media">
    <span class="pull-left" href="#">
        <span class="glyphicon glyphicon-file" style="font-size: 64px"></span>
    </span>
    <div class="media-body">
        <p><b>aj. afffff fsdf </b> comment in  <b>zxcvxvxbdffgdf</b> assignment.</p>
        <a href="${n.link}">see more</a>
    </div>
</div>

<div class="media">
    <span class="pull-left" href="#">
        <span class="glyphicon glyphicon-file" style="font-size: 64px"></span>
    </span>
    <div class="media-body">
        <p><b>aj. afffff fsdf </b> tell you something in your <b>zxcvxvxbdffgdf</b> work.</p>
        <a href="${n.link}">see more</a>
    </div>
</div>    -->
<!--<div class="media">
    <span class="pull-left" href="#">
            <span class="glyphicon glyphicon-file" style="font-size: 64px"></span>
        </span>
    <div class="media-body">
        <h4 class="media-heading">Assignment# 1 ( INT202 Software Development Process II )<small class="pull-right">16/01/57</small></h4>
        <p>ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
        <small class="text-muted">Due date: 18/01/57</small>
    </div>
</div>-->