<%-- 
    Document   : compareCopy
    Created on : Sep 16, 2014, 1:48:59 AM
    Author     : Orarmor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="META-INF/page/include_css.jsp" %>
        <%@include file="META-INF/page/include_js.jsp" %>
        <title>Compare Student Assignment </title>
    </head>
    <body>
        <div class="container-fluid">
            <div class="col-md-6">
                <h3 class="text-center">Your current keyword Assignment</h3>
                <iframe class="col-md-12"  style="height:800px" src="https://crocodoc.com/view/${csessionKey}"/></iframe> 
            </div>
            <div class="col-md-6">
                <h3 class="text-center">Copy Assignment</h3>
                <iframe class="col-md-12" style="height:800px" src="https://crocodoc.com/view/${csessionKey2}"/></iframe> 
            </div>
        </div>
    </body>
</html>
