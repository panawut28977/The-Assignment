<%-- 
    Document   : home
    Created on : Apr 6, 2014, 5:08:52 PM
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
        <script src="js/jquery.Jcrop.js"></script>
        <link rel="stylesheet" href="css/jquery.Jcrop.min.css" type="text/css" />
        <title>Profile</title>
        <style>
            .user-row {
                margin-bottom: 14px;
            }

            .user-row:last-child {
                margin-bottom: 0;
            }

            .dropdown-user {
                margin: 13px 0;
                padding: 5px;
                height: 100%;
            }

            .dropdown-user:hover {
                cursor: pointer;
            }

            .table-user-information > tbody > tr {
                border-top: 1px solid rgb(221, 221, 221);
            }

            .table-user-information > tbody > tr:first-child {
                border-top: 0;
            }


            .table-user-information > tbody > tr > td {
                border-top: 0;
            }
            .toppad
            {margin-top:20px;
            }

            .statusbox{
                font-weight: bold;
                font-size: 16px;
                text-align: center;
            }

            .statusbox .panel-body .col-md-4,.statusbox .panel-body .col-md-6{
                padding: 10px 0;
            }

            #croppic img{
                border-radius: 0;
            }

            .modal-dialog {
                width: 540px;
                height: auto;
            }

            .jcrop-keymgr{
                left: -99999px !important;
            }

            .jcrop-holder{
                background: transparent !important;
            }

            .bootstrap-filestyle{
                display: none !important;
            }

            /*            #uploadedPic{
                            width: 300px !important;
                            height: 600px !important;
                        }*/
        </style>
    </head>
    <body>
        <!-- 
                            1 = หน้าหลังจาก join course
                            2 = หน้าที่ใส่ code แล้ว join ไม่ได้
        -->
        <%@include file="META-INF/page/header_bar.jsp"%>
        <div class="container">
            <div class="col-xs-12 col-sm-12 col-md-5 col-lg-5" >
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">${ac.firstname} ${ac.lastname} <a href="edit.html" data-original-title="Edit this user" data-toggle="tooltip" type="button" ><i class="glyphicon glyphicon-edit"></i></a></h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="${ac.profile_pic}" class="img-circle" width="100"> </div>

                            <!--<div class="col-xs-10 col-sm-10 hidden-md hidden-lg"> <br>
                              <dl>
                                <dt>DEPARTMENT:</dt>
                                <dd>Administrator</dd>
                                <dt>HIRE DATE</dt>
                                <dd>11/12/2013</dd>
                                <dt>DATE OF BIRTH</dt>
                                   <dd>11/12/2013</dd>
                                <dt>GENDER</dt>
                                <dd>Male</dd>
                              </dl>
                            </div>-->
                            <div class=" col-md-9 col-lg-9 "> 
                                <table class="table table-user-information">
                                    <tbody>
                                        <tr>
                                            <td>Email:</td>
                                            <td>${ac.email}</td>
                                        </tr>
                                        <tr>
                                            <td>Type:</td>
                                            <td>${ac.account_type}</td>
                                        </tr>
                                        <tr>
                                            <td>Register date:</td>
                                            <td>${ac.register_date}</td>
                                        </tr>

                                    </tbody>
                                </table>
                                <a href="#" id="changePic">Change profile picture</a><br/>
                                <a href="#" class="s">Forgot your password?</a>
                                <!--<a href="#" class="btn btn-primary">Team Sales Performance</a>-->
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer" style="height: 50px;">
                        <span class="pull-right">
                            <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="panel panel-default statusbox">
                    <div class="panel-heading">
                        <h3 class="panel-title">Assignment status</h3>
                    </div>
                    <div class="panel-body">
                        <div >
                            <div onclick="view_assignment_by_status('on time')" class="col-md-4" style="background-color: #40d47e;cursor: pointer;">
                                <span>${ontime}</span><br><span>On time</span>
                            </div>
                            <div onclick="view_assignment_by_status('Hurry up')" class="col-md-4" style="background-color: #f1c40f;cursor: pointer;">
                                <span>${hurry}</span><br><span>Hurry up</span>
                            </div>
                            <div onclick="view_assignment_by_status('Late')" class="col-md-4" style="background-color: #e74c3c;cursor: pointer;">
                                <span>${late}</span><br><span>Late</span>
                            </div>                    
                        </div>
                        <div>
                            <div onclick="view_assignment_by_status('sent')" class="col-md-6" style="background-color: #5F8BCA;cursor: pointer;">
                                <span>${sent}</span><br><span>Sent</span>
                            </div>
                            <div onclick="view_assignment_by_status('miss')" class="col-md-6" style="background-color: #999;cursor: pointer;">
                                <span>${miss}</span><br><span>Miss</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <h3 class="panel-title">Course you are wait for approve</h3>
                    </div>
                    <div class="panel-body">
                        <c:if test="${waitingcourse.size() eq 0}">
                            <h3 class="text-muted text-center">no course</h3>
                        </c:if>
                        <table class="table table-condensed">
                            <tbody>
                                <c:forEach items="${waitingcourse}" var="c">
                                    <tr>
                                        <td>
                                            ${c.course.name}
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!--<h1>Comming soon</h1>-->
            </div>
        </div>
        <div class="modal fade" id="croppic" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Crop image</h4>
                    </div>
                    <div class="modal-body" style="text-align: center;min-height: 500px">
                        <form action="ImageCrop" method="post" onsubmit="return checkCoords();" >
                            <input type="hidden" id="x" name="l" />
                            <input type="hidden" id="y" name="t" />
                            <input type="hidden" id="w" name="w" />
                            <input type="hidden" id="h" name="h" />
                            <input type="hidden" id="f" name="f" value="" />
                            <input type="hidden" id="image" name="image" />
                            <input type="hidden" id="width" name="width" />
                            <input type="hidden" id="height" name="height" />
                            <img src="" id="uploadedPic"/>
                            <input type="submit" value="Done cropping" id="donecrop" class="btn btn-primary" style="margin-top: 20px; display: none"/>
                        </form>
                        <form id="uploadnew" >
                            <input type="file" id="inputpic" name="inputpic"/>
                            <a href="#" id="uploadPic">Upload picture</a><br/>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            var jcrop_api = null;
            $(function() {
                $(".jcrop-keymgr").remove();
                $("#changePic").click(function() {
                    $("#croppic").modal({
                        backdrop: 'static'
                    });
                });
                $("#uploadPic").click(function() {
                    $("#inputpic").click();
                });

                $("#inputpic").change(function() {
                    var loading = '<div class="text-center" id="loader"><i class="fa fa-spinner fa-5x fa-spin"></i></div>';
                    $("#croppic .modal-body").prepend(loading);
                    submitUploadForm();
                });

                $('#croppic').on('hidden.bs.modal', function(e) {
                    $("#inputpic").val('');
                })

            });
            function view_assignment_by_status(status) {
                location.href = "home.jsp?tab=AllAssignment&st=" + status;
            }

            function updateCoords(c) {
                $('#x').val(c.x);
                $('#y').val(c.y);
                $('#w').val(c.w);
                $('#h').val(c.h);
            }

            function checkCoords() {
                if (parseInt($('#w').val()))
                    return true;
                alert('Please select a crop region then press submit.');
                return false;
            }

            function submitUploadForm() {
                var fd = new FormData(document.getElementById("uploadnew"));
                $.ajax({
                    url: "uploadProfilePic",
                    type: "POST",
                    data: fd,
                    enctype: 'multipart/form-data',
                    processData: false,
                    contentType: false
                }).done(function(data) {
//                    console.log(data);
                    var obj = JSON.parse(data);
                    // do it after upload successful
                    var newPicture = obj.newPicture;
                    $("#uploadPic").hide();
                    $("#loader").remove();
                    $("#donecrop").show();
                    $("#croppic img").attr("src", "img/full_images/" + newPicture);
                    $("#image").val(newPicture);
                    var ext = $("#inputpic").val().split('.').pop().toLowerCase();
                    $("#f").val(ext);

                    resizeAspectRation(obj.width, obj.height);
                });
                return false;
            }

            function resizeAspectRation(w, h) {
                var maxWidth = 500; // Max width for the image
                var maxHeight = 500; // Max height for the image
                var ratio = 0; // Used for aspect ratio
                var width = w;    // Current image width
                var height = h;  // Current image height

                // Check if the current width is larger than the max
                if (width > maxWidth) {
//                    alert("if width");
                    ratio = maxWidth / width; // get ratio for scaling image
                    console.log(ratio);
                    $("#croppic img,.jcrop-tracker,.jcrop-holder img").css("width", maxWidth); // Set new width
                    $("#croppic img,.jcrop-tracker,.jcrop-holder img").css("height", height * ratio); // Scale height based on ratio
                    height = height * ratio; // Reset height to match scaled image
                    width = width * ratio; // Reset width to match scaled image
                } else if (height > maxHeight) {
//                    alert("if height");
                    ratio = maxHeight / height; // get ratio for scaling image
                    console.log(ratio);
                    $("#croppic img,.jcrop-tracker,.jcrop-holder img").css("height", maxHeight); // Set new height
                    $("#croppic img,.jcrop-tracker,.jcrop-holder img").css("width", width * ratio); // Scale width based on ratio
                    width = width * ratio;    // Reset width to match scaled image
                    height = height * ratio;    // Reset height to match scaled image
                }
                $("#width").val(width);
                $("#height").val(height);
                iniJCrop(width, height);
            }

            function iniJCrop(width, height) {
//                $('#uploadedPic').Jcrop({
//                    aspectRatio: 1,
//                    onSelect: updateCoords,
//                    boxWidth: width,
//                    boxHeight: height
//                });
                if (jcrop_api != null) {
                    jcrop_api.destroy();
                }
                jcrop_api = $.Jcrop('#uploadedPic', {
                    aspectRatio: 1,
                    onSelect: updateCoords,
                    boxWidth: width,
                    boxHeight: height
                });
            }
        </script>
        <!--        <a href="setSession.jsp?acct=th"><span>teacher mode</span></a>
                 <a href="setSession.jsp?acct=st"><span>student mode</span></a>-->
    </body>
</html>
