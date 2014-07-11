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
        <title>The Assignment</title>
    </head>
    <body>
        <nav class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">The Assignment</a>
            </div>
            <p class="navbar-text navbar-right" style="padding-right: 10px">IT 54-24</p>
        </nav>
        <div class="container-fluid" style="margin-top: 10%">
            <div class="row">
                <div class="col-md-7"></div> 
                <div class="col-md-4">
                    <div class="well well-lg">
                        <form role="form" action="Register" method="post">
                            <h3><b> <c:choose>
                                <c:when test="${param.rg eq 'ST'}">
                                    I'm Student
                                </c:when>
                                <c:otherwise> 
                                    I'm Teacher
                                </c:otherwise>
                            </c:choose></b></h3><hr>
                            <span class="text-danger">${msg}</span>
                            <div class="form-group">
                                <label>First Name<span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Firstname" required="yes">
                            </div>
                            <div class="form-group">
                                <label>Last Name<span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Lastname" required="yes">
                            </div>            
                            <div class="form-group">
                                <label>E-mail<span class="text-danger">*</span></label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="E-mail" required="yes">
                            </div>
                            <div class="form-group">
                                <label>Password<span class="text-danger">*</span></label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required="yes">
                            </div>
                            <c:choose>
                                <c:when test="${param.rg eq 'ST'}">
                                    <input type="hidden" value="ST" name="type">
                                </c:when>
                                <c:otherwise> 
                                    <input type="hidden" value="TH" name="type">
                                </c:otherwise>
                            </c:choose>
                            <input type="submit" id="submit" class="btn btn-primary" style="width: 49%;" value="Sign up">
                            <a href="index.jsp" class="btn btn-default" style="width: 49%;">Cancel</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

<script>
    $(function() {
        $("#email").on("focusout", function() {
            var value = $(this).val();
            if (value.length == 0) {
                addCheckingStatus('true');
            } else {
                $.ajax({
                    type: "POST",
                    url: "isExistingEmail",
                    data: {email: value}
                }).done(function(msg) {
                    addCheckingStatus(msg);
                });
            }
        });

        function addCheckingStatus(msg) {
            //true if it's a existing email
            if (msg == 'true') {
                $("#email").parent().removeClass("has-success   has-feedback").find("span").remove("span");
                $("#email").parent().addClass("has-error  has-feedback").append('<span class="glyphicon glyphicon-remove form-control-feedback"></span>');
                $("#submit").attr("disabled", "disabled");
            } else {
                $("#email").parent().removeClass("has-error  has-feedback").find("span").remove("span");
                $("#email").parent().addClass("has-success   has-feedback").append('<span class="glyphicon glyphicon-ok form-control-feedback"></span>');
                $("#submit").removeAttr("disabled");
            }
        }
    });

</script>