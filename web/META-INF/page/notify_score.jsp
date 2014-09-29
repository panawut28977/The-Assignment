<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cf" uri="/WEB-INF/tlds/functions.tld" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div><h3>${param.nt}<a class='btn btn-default pull-right' href="clearNotify">Clear all</a></h3></div>
<c:forEach items="${noti}" var="n"> 
    <c:set value="${cf:getNameByID(n.acc_id)}" var="ann_acc"/>
    <div class="media">
        <span class="glyphicon glyphicon-stats pull-left" style="font-size: 64px"></span>
        <div class="media-body">
            <p>${n.text}</p>
        </div>
    </div>
</c:forEach>
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