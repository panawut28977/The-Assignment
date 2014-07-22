<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${param.upload eq 'success'}">
        <%@include file="selectColumn.jsp" %>
    </c:when>
    <c:otherwise>
        <button class="btn btn-primary" style="margin-top: 20px" id="autoApprove"><span class="glyphicon glyphicon-ok"></span> Auto Approve</button>
        <button class="btn btn-default" style="margin-top: 20px" id="updateList">update list</button>
        <div id="uploadStList">
            <hr>
            <form role="form">
                <div class="form-group">
                    <label class="text-warning">Please upload your student list before(Excel file). See <a href="">example file</a></label>
                    <input type="file" class="form-control">
                </div>
                <!--<input type="submit" value="upload" class="btn btn-primary">-->
                <a href="course.jsp?tab=request&&upload=success" class="btn btn-primary">upload</a>
            </form>
            <hr>
        </div>
        <div class="row"> 
            <div class="media col-md-8">
                <a class="pull-left" href="#">
                    <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                </a>
                <div class="media-body">
                    <h4 class="media-heading" >Steven Gerrard</h4>
                    <br>
                    <small class="text-muted">Request date: 16/01/57</small>
                </div>
            </div>
            <div class="media col-md-4 approve_box">
                <button class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span>  Approve</button>
                <button class="btn btn-default">Not now</button>
            </div>
        </div>
        <div class="row">
            <div class="media col-md-8">
                <a class="pull-left" href="#">
                    <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                </a>
                <div class="media-body">
                    <h4 class="media-heading" >Luis Suarez</h4>
                    <br>
                    <small class="text-muted">Request date: 16/01/57</small>
                </div>
            </div>
            <div class="media col-md-4 approve_box">
                <button class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span> Approve</button>
                <button class="btn btn-default">Not now</button>
            </div>
        </div>
        <div class="row">
            <div class="media col-md-8">
                <a class="pull-left" href="#">
                    <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                </a>
                <div class="media-body">
                    <h4 class="media-heading" >Filipe Coutinho</h4>
                    <br>
                    <small class="text-muted">Request date: 16/01/57</small>
                </div>
            </div>
            <div class="media col-md-4 approve_box">
                <button class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span>  Approve</button>
                <button class="btn btn-default">Not now</button>
            </div>
        </div>
        <div class="row">
            <div class="media col-md-8">
                <a class="pull-left" href="#">
                    <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
                </a>
                <div class="media-body">
                    <h4 class="media-heading" >Kolo Toure</h4>
                    <br>
                    <small class="text-muted">Request date: 16/01/57</small>
                </div>
            </div>
            <div class="media col-md-4 approve_box">
                <button class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span>  Approve</button>
                <button class="btn btn-default">Not now</button>
            </div>
        </div>
        <script>
            $(function() {
                $("#uploadStList").hide();
                $("#autoApprove,#updateList").click(function() {
                    $("#uploadStList").slideToggle();
                });
            });
        </script>
        <style>
            .media:first-child{
                margin-top: 15px;
            }
            .media,.media-body{
                overflow: visible !important;
            }

            .row .approve_box{
                height: 64px;
                text-align: center;
            }
        </style>
    </c:otherwise>
</c:choose>