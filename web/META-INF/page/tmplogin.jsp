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
        <style>
            body{
                /*background-image: url('img/Education-knowledge-PowerPoint-PPT-hd-87622487.jpg');*/
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
            <!--<p class="navbar-text navbar-right" style="padding-right: 10px">IT 54-24</p>-->
        </nav>
        <div class="container-fluid" style="margin-top: 4%">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <c:if test="${msg ne ''}">
                        <div class="alert alert-danger"><h1 class="text-center">${msg}</h1></div><br/>
                        </c:if>
                    <div class="well well-lg" style="height: 240px">
                        <h3><b>Sign in to The Assignment</b></h3>
                        <form role="form" action="LoginServletTmp" method="post">
                            <div class="form-group">
                                <input type="email" class="form-control" id="email" name="email" value="${email}" placeholder="E-mail" >
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" id="password" name="password" placeholder="Password">
                            </div>
                            <div class="form-group">
                                <input type="submit" value="Sign in" class="btn btn-primary pull-right">
                            </div>
                        </form>
                    </div>
                </div> 
            </div>
        </div>
    </body>
</html>

<script>
    $(function() {
//        $("#email").on("change", function() {
//
//            var value = $(this).val();
//            if (value.length == 0) {
//                addCheckingStatus('false');
//            } else {
//                $.ajax({
//                    type: "POST",
//                    url: "isExistingEmail",
//                    data: {email: value}
//                }).done(function(msg) {
////                    alert(msg);
//                    addCheckingStatus(msg);
//                });
//            }
//        });

//        function addCheckingStatus(msg) {
            //true if it's a existing email
//            if (msg == 'false') {
//                $("#email").parent().removeClass("has-success   has-feedback").find("span").remove("span");
//                $("#email").parent().addClass("has-error  has-feedback").append('<span class="glyphicon glyphicon-remove form-control-feedback"></span>');
//                $("#submit").attr("disabled", "disabled");
//            } else {
//                $("#email").parent().removeClass("has-error  has-feedback").find("span").remove("span");
//                $("#email").parent().addClass("has-success   has-feedback").append('<span class="glyphicon glyphicon-ok form-control-feedback"></span>');
//                $("#submit").removeAttr("disabled");
//            }
//        }
    });

</script>