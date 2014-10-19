<%-- 
    Document   : index
    Created on : Apr 6, 2014, 3:58:09 PM
    Author     : JenoVa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="META-INF/page/include_css.jsp" %>
        <%@include file="META-INF/page/include_js.jsp" %>
        <style>
            body{
                background-image: url('img/ta_background.jpg');
                background-repeat: repeat-x;
                background-size: 100%;
            }
 
            hr{
                clear: both;
                border:1px solid #808080 !important;
                border-width: 3px;
            }
            
            .well{
                background-color: rgba(245, 245, 245,0.7);
            }
        </style>
        <title>The Assignment</title>
    </head>
    <body>
        <nav class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">The Assignment</a>
            </div>
            <p class="navbar-text navbar-right" style="padding-right: 10px">IT 54-27</p>
        </nav>
        <div class="container-fluid" style="margin-top: 10%">
            <div class="row">
                <div class="col-md-6 col-md-offset-1" style="color: white">
                    <p style="font-size: 60px;font-weight: bold;text-shadow: 2px 5px 8px #72485a;">The Assignment</p> 
                    <p style="font-size: 36px;text-shadow: 2px 5px 8px #72485a;">Let us be a part of your education.</p>
                </div> 
                <%@include file="META-INF/page/login.jsp" %>
            </div>
        </div>
    </body>
</html>
