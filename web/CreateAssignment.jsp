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
        <link href="css/bootstrap-datetimepicker.min.css"  rel="stylesheet">
        <style>
            .bwizard-steps {
                display: inline-block;
                margin: 0; padding: 0;
                background: #fff }
            .bwizard-steps .active {
                color: #fff;
                background: #007ACC }
            .bwizard-steps .active:after {
                border-left-color: #007ACC }
            .bwizard-steps .active a {
                color: #fff;
                cursor: default }
            .bwizard-steps .label {
                position: relative;
                top: -1px;
                margin: 0 5px 0 0; padding: 1px 5px 2px }
            .bwizard-steps .active .label {
                background-color: #333;}
            .bwizard-steps li {
                display: inline-block; position: relative;
                margin-right: 5px;
                padding: 12px 17px 10px 30px;
                *display: inline;
                *padding-left: 17px;
                background: #efefef;
                line-height: 18px;
                list-style: none;
                zoom: 1; }
            .bwizard-steps li:first-child {
                padding-left: 12px;
                -moz-border-radius: 4px 0 0 4px;
                -webkit-border-radius: 4px 0 0 4px;
                border-radius: 4px 0 0 4px; }
            .bwizard-steps li:first-child:before {
                border: none }
            .bwizard-steps li:last-child {
                margin-right: 0;
                -moz-border-radius: 0 4px 4px 0;
                -webkit-border-radius: 0 4px 4px 0;
                border-radius: 0 4px 4px 0; }
            .bwizard-steps li:last-child:after {
                border: none }
            .bwizard-steps li:before {
                position: absolute;
                left: 0; top: 0;
                height: 0; width: 0;
                border-bottom: 20px inset transparent;
                border-left: 20px solid #fff;
                border-top: 20px inset transparent;
                content: "" }
            .bwizard-steps li:after {
                position: absolute;
                right: -20px; top: 0;
                height: 0; width: 0;
                border-bottom: 20px inset transparent;
                border-left: 20px solid #efefef;
                border-top: 20px inset transparent;
                content: "";
                z-index: 2; }
            .bwizard-steps a {
                color: #333 }
            .bwizard-steps a:hover {
                text-decoration: none }
            .bwizard-steps.clickable li:not(.active) {
                cursor: pointer }
            .bwizard-steps.clickable li:hover:not(.active) {
                background: #ccc }
            .bwizard-steps.clickable li:hover:not(.active):after {
                border-left-color: #ccc }
            .bwizard-steps.clickable li:hover:not(.active) a {
                color: #08c }
            @media (max-width: 480px) { 
                /* badges only on small screens */
                .bwizard-steps li:after,
                .bwizard-steps li:before {
                    border: none }
                .bwizard-steps li,
                .bwizard-steps li.active,
                .bwizard-steps li:first-child,
                .bwizard-steps li:last-child {
                    margin-right: 0;
                    padding: 0;
                    background-color: transparent }
            }
        </style>

        <%@include file="META-INF/page/include_js.jsp" %>
        <script src="module/tabwizard/jquery.bootstrap.wizard.js"></script>
        <title>Create Assignment</title>
    </head>
    <body>
        <%@include file="META-INF/page/header_bar.jsp"%>
        <div class="container">
            <div class="row">
                <%@include file="META-INF/page/side_bar.jsp"%>
                <div class="col-md-9" style="padding-bottom: 20px">
                    <%@include file="META-INF/page/CourseHeader.jsp" %>
                    <%@include file="META-INF/page/CourseTab.jsp"%>
                    <ol class="breadcrumb" style="margin-top: 15px" >
                        <li><a href="course.jsp?tab=AllAssignment">Assignment</a></li>
                        <li class="active"><a href="#">Create Assignment</a></li>
                    </ol>
                    <div id="rootwizard" >
                        <ul class="pull-right">
                            <li><a href="#tab1" data-toggle="tab"><span class="label">1</span> Enter Info</a></li>
                            <li><a href="#tab2" data-toggle="tab"><span class="label">2</span> Create Assignment</a></li>
                        </ul>
                        <div class="tab-content" style="clear: both" >
                            <div class="tab-pane" id="tab1">
                                <div class="col-md-8 col-md-offset-2" style="margin-top: 20px">
                                    <form class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <label for="name" class="col-md-3 control-label">Name</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" id="name" >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="description" class="col-md-3 control-label">Description</label>
                                            <div class="col-md-9">
                                                <textarea  rows="3"  id="description" class="form-control"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="description" class="col-md-3 control-label">Work with</label>
                                            <div class="col-md-9">
                                                <input type="radio" name="total_member" value="1" id="individual" > Individual
                                                <br>
                                                <input type="radio" name="total_member" id="groupwork" value=""> Group of <input type="number" id="inputpepole" disabled="yes"> People
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="dtp_input2" class="col-md-3 control-label">Due date</label>
                                            <div class="input-group date form_date col-md-9" style="padding-right: 15px;  padding-left: 15px;" data-date="" data-date-format="dd MM yyyy hh:mm" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd hh:mm">
                                                <input class="form-control" size="16" type="text" value="" readonly="yes">
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                            <input type="hidden" id="dtp_input2" value="" /><br/>
                                        </div>
                                        <div class="form-group">
                                            <label for="type" class="col-md-3 control-label">Assignment Type</label>
                                              <div class="col-md-4">
                                                  <select class="form-control">
                                                      <option value="f">File</option>
                                                      <option value="w">Doing on web</option>
                                                  </select>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab2">
                                2
                            </div>
                            <ul class="pager wizard" style="clear: both" >
                                <li class="previous first" style="display:none;"><a href="#">First</a></li>
                                <li class="previous"><a href="#">Previous</a></li>
                                <li class="next last" style="display:none;"><a href="#">Last</a></li>
                                <li class="next"><a href="#">Next</a></li>
                            </ul>
                        </div>	
                    </div>

                </div>
            </div>
        </div>
                    
        <script src="js/bootstrap-datetimepicker.min.js"></script>
        <script>
            $(document).ready(function() {
                $('#compareBox').hide();
                $('#rootwizard').bootstrapWizard({'tabClass': 'bwizard-steps'});

                $('#groupwork').click(function() {
                    $('#inputpepole').removeAttr("disabled");
                });


                $('#individual').click(function() {
                    $('#inputpepole').attr("disabled", "yes");
                });

                $('.form_date').datetimepicker({
                    language: 'pt-BR'
                });

            });
            function compareView() {
                $('#compareBox').show();
                $("html, body").animate({scrollTop: $('body').height()}, "slow");
            }
        </script>
    </body>
</html>
