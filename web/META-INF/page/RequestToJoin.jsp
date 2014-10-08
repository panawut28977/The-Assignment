<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Waitacc is declare in coursetab file -->
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
<c:choose>
    <c:when test="${param.upload eq 'success'}">
        <%@include file="selectColumn.jsp" %>
    </c:when>
    <c:otherwise>
        <div class="pull-right" style="margin-bottom: 20px">
            <button class="btn btn-primary" style="margin-top: 20px" id="autoApprove"><span class="glyphicon glyphicon-ok"></span> Auto Approve</button>
            <button class="btn btn-default" style="margin-top: 20px" id="updateList">upload list</button>
        </div>
        <div id="uploadStList" style="clear: both;">
            <hr>
            <form role="form"   onsubmit="return checkFile()" action="ImportStudentList"  method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label class="text-warning">Please upload your student list before(Excel file). Download <a href="file/student_list.xlsx">example file</a></label>
                    <input type="file" class="form-control" id="listSt" name="file" required="yes">
                    <span class="text-danger" id="errmsg"><b></b></span>
                </div>
                <input type="submit" id="submit" value="upload" class="btn btn-primary">
                <!--<a href="course.jsp?tab=request&&upload=success" class="btn btn-primary">upload</a>-->
            </form>
            <hr>
        </div>

        <c:choose>
            <c:when test="${rowadded ne null}">
                <div class="alert alert-success alert-dismissible" role="alert" style="clear: both">
                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <strong>${rowadded}</strong> rows added.
                </div>
            </c:when>
             <c:when test="${autApproveMsg ne null}">
                <div class="alert alert-success alert-dismissible" role="alert" style="clear: both">
                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <strong>${autApproveMsg}</strong>.
                </div>
            </c:when>
            <c:when test="${msg ne null}">
                <div class="alert alert-danger alert-dismissible" role="alert" style="clear: both">
                    <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    ${msg}
                </div>
            </c:when>
        </c:choose>
        <c:if test="${waitAcc.size() == 0}">
            <h1 class="text-muted" style="text-align: center;clear: both">No request.</h1>
        </c:if>
        <c:forEach items="${waitAcc}" var="a">
            <div class="row" style="margin-top: 20px;clear: both"> 
                <div class="media col-md-8">
                    <a class="pull-left" href="#">
                        <img width="64" src="${a.profile_pic}">
                    </a>
                    <div class="media-body">
                        <h4 class="media-heading" >${a.firstname} ${a.lastname}</h4>
                        <br>
                        <!--<small class="text-muted">Request date:     </small>-->
                    </div>
                </div>
                <div class="media col-md-4 approve_box">
                    <button class="btn btn-primary approve" acc_id="${a.acc_id}" cId="${cId}"><span class="glyphicon glyphicon-ok"></span>  Approve now</button>
                    <button class="btn btn-default disapprove" acc_id="${a.acc_id}" cId="${cId}">Not now</button>
                </div>
            </div>
        </c:forEach>
        <!--        <div class="row"> 
                    <div class="media col-md-8">
                        <a class="pull-left" href="#">
                            <img width="64" src="img/avatar.jpg">
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
                            <img width="64" src="img/avatar.jpg">
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
                            <img width="64" src="img/avatar.jpg">
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
                            <img width="64" src="img/avatar.jpg">
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
                </div>-->
        <script>
            $(function() {
                $("#uploadStList").hide();
                $("#updateList").click(function() {
                    $("#uploadStList").slideToggle();
                });
                $(".approve").click(function() {
                    var pos = $(this).parent().parent();
                    $.ajax({
                        type: "POST",
                        url: "approvesl",
                        data: {acc_id: $(this).attr("acc_id"), course_id: $(this).attr("cId")}
                    }).done(function(msg) {
                        if (msg == 1) {
                            pos.slideUp("slow", function() {
                                pos.html('<div class="col-md-12"><div class="alert alert-success" role="alert"><button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button><strong>Approved !!</strong></div></div>');
                                pos.slideDown("slow");
                            });
                        } else {
                            alert("Error occur");
                        }
                    });
                });
                $(".disapprove").click(function() {
                    var pos = $(this).parent().parent();
                    $.ajax({
                        type: "POST",
                        url: "disapprovesl",
                        data: {acc_id: $(this).attr("acc_id"), course_id: $(this).attr("cId")}
                    }).done(function(msg) {
                        if (msg == 1) {
                            pos.slideUp("slow", function() {
                                pos.html('<div class="col-md-12"><div class="alert alert-warning" role="alert"><button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button><strong>Dispproved !!</strong></div></div>');
                                pos.slideDown("slow");
                            });
                        } else {
                            alert("Error occur");
                        }
                    });
                });
                $("#autoApprove").click(function() {
                    var reqNo = '${waitAcc.size()}';
                    if (reqNo == 0) {
                        alert('No requset  for approve.');
                    } else {
                       location.href = 'AutoApprove';     
                    }
                });
            });
            function checkFile() {
                var ext = $("#listSt").val().split('.').pop().toLowerCase();
                if ($.inArray(ext, ['xls', 'xlsx']) == -1) {
                    $("#errmsg b").text("Invalid file type");
                    return false;
                }
            }

        </script>
    </c:otherwise>
</c:choose>