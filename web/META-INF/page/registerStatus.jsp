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
        <%@include file="include_css.jsp" %>
        <%@include file="include_js.jsp" %>
        <title>The Assignment</title>
        <style>
            body{
                background-image: url('img/Education-knowledge-PowerPoint-PPT-hd-87622487.jpg');
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
    </head>
    <body>
        <nav class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">The Assignment</a>
            </div>
            <p class="navbar-text navbar-right" style="padding-right: 10px">IT 54-24</p>
        </nav>
        <div class="container-fluid"  style="margin-top: 10%" >
            <div class="row">
                <div class="col-md-6 col-md-offset-3" style="text-align: center">
                    <div class="well well-lg">
                        <h1>Registration successful !!</h1>
                        <small>ระบบจะพาไปยังหน้า Log in อัตโนมัติ , หากไม่ไปให้ <a href="index.jsp">กดที่นี่</a></small>
                    </div>
                </div> 
            </div>
        </div>
    </body>
</html>
