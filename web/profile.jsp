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
                        <h3 class="panel-title">${ac.firstname} ${ac.lastname}</h3>
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
                                <a href="#" class="">Change profile picture</a><br/>
                                <a href="#" class="s">Forgot your password?</a>
                                <!--<a href="#" class="btn btn-primary">Team Sales Performance</a>-->
                            </div>
                        </div>
                    </div>
                    <div class="panel-footer" style="height: 50px;">
                        <span class="pull-right">
                            <a href="edit.html" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                            <a data-original-title="Remove this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-danger"><i class="glyphicon glyphicon-remove"></i></a>
                        </span>
                    </div>
                </div>
            </div>

            <div class="col-md-7 statusbox">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Assignment status</h3>
                    </div>
                    <div class="panel-body">
                        <div >
                            <div class="col-md-4" style="background-color: #40d47e;cursor: pointer;">
                                <span>${ontime}</span><br><span>On time</span>
                            </div>
                            <div class="col-md-4" style="background-color: #f1c40f;cursor: pointer;">
                                <span>${hurry}</span><br><span>Hurry up</span>
                            </div>
                            <div class="col-md-4" style="background-color: #e74c3c;cursor: pointer;">
                                <span>${late}</span><br><span>Late</span>
                            </div>                    
                        </div>
                        <div>
                            <div class="col-md-6" style="background-color: #5F8BCA;cursor: pointer;">
                                <span>${sent}</span><br><span>Sent</span>
                            </div>
                            <div class="col-md-6" style="background-color: #999;cursor: pointer;">
                                <span>${miss}</span><br><span>Miss</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <h3 class="panel-title">Course you are wait for approval</h3>
                    </div>
                    <div class="panel-body">
                        
                    </div>
                </div>
                <!--<h1>Comming soon</h1>-->
            </div>
        </div>
        <!--        <a href="setSession.jsp?acct=th"><span>teacher mode</span></a>
                 <a href="setSession.jsp?acct=st"><span>student mode</span></a>-->
    </body>
</html>
