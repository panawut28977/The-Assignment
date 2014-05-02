<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .media-body{
        padding-left: 10px;
    }
</style>
<div><h3>${param.nt} <button class='btn btn-default pull-right'>clear all</button></h3></div>
<div class="media">
    <a href="course.jsp">
        <span class="glyphicon glyphicon-check pull-left" style="font-size: 64px"></span>
    </a> 
    <div class="media-body">
        <h4 class="media-heading">Your request to join <a href="course.jsp"><b>INT202 Software Development Process II</b></a> is <b>approved</b></h4>
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
</div>