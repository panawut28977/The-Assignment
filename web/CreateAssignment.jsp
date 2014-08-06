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
        <link href="module/easyWizard/css/jquery.snippet.min.css"  rel="stylesheet">
        <link href="module/easyWizard/css/styles.css"  rel="stylesheet">
        <style>
            .step{
                min-height: 370px;
            }

            .q_no{
                text-align: center;
                margin-top: 0;
                margin-bottom: 20px;
            }

            .q_no .label{
                font-size: 20px;
                border-radius: 5.25em;
            }

            .matchWord_q_list input,.ansList input{
                margin-right: 10px;
                margin-bottom: 10px; 
            }

            .fillInBlankBox:hover{
                cursor: pointer;
            }
        </style>

        <%@include file="META-INF/page/include_js.jsp" %>
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
                    <!--                    <div id="rootwizard" >
                                            <ul class="pull-right">
                                                <li><a href="#tab1" data-toggle="tab"><span class="label">1</span> Enter Info</a></li>
                                                <li><a href="#tab2" data-toggle="tab"><span class="label">2</span> Create Assignment</a></li>
                                            </ul>
                                            <div class="tab-content" style="clear: both" >
                                                <div class="tab-pane" id="tab1">
                                                    <div class="col-md-8 col-md-offset-2">
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
                                                                <label  class="col-md-3 control-label">Work with</label>
                                                                <div class="col-md-9">
                                                                    <input type="radio" name="total_member" value="1" id="individual" > Individual
                                                                    <br>
                                                                    <input type="radio" name="total_member" id="groupwork" value=""> Group of <input type="number" id="inputpepole" disabled="yes"> People
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-md-3 control-label">Due date</label>
                                                                <div class="input-group date form_date col-md-9" style="padding-right: 15px;  padding-left: 15px;" data-date="" data-date-format="dd MM yyyy hh:mm" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd hh:mm">
                                                                    <input class="form-control" size="16" type="text" value="" readonly="yes">
                                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                                                </div>
                                                                <input type="hidden" id="dtp_input2" value="" /><br/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="AmType" class="col-md-3 control-label">Assignment Type</label>
                                                                <div class="col-md-4">
                                                                    <select class="form-control" id="AmType">
                                                                        <option value="f">File</option>
                                                                        <option value="w">Doing on web</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <div class="tab-pane" id="tab2">
                                                    <div class="col-md-8 col-md-offset-2" id="uploadAmFile">
                                                        <form role="form" class="form-inline">
                                                            <input type="file" class="form-control">
                                                            <input type="submit" value="upload" class="form-control btn btn-primary">
                                                        </form>
                                                    </div>
                                                    <div class="col-md-8 col-md-offset-2" id="CreateAmOnweb">web</div>
                                                </div>
                                                <ul class="pager wizard" style="clear: both" >
                                                    <li class="previous first" style="display:none;"><a href="#">First</a></li>
                                                    <li class="previous"><a href="#">Previous</a></li>
                                                    <li class="next last" style="display:none;"><a href="#">Last</a></li>
                                                    <li class="next"><a href="#">Next</a></li>
                                                </ul>
                                            </div>	
                                        </div>-->
                    <form id="myWizard" method="post" action="createAssignment" class="form-horizontal">
                        <section class="step" data-step-title="Enter Information">
                            <div class="col-md-8 col-md-offset-2">
                                <div class="form-group">
                                    <label for="name" class="col-md-3 control-label">Name</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" id="name" name="amName" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="description" class="col-md-3 control-label">Description</label>
                                    <div class="col-md-9" name="description">
                                        <textarea  rows="3"  id="description" class="form-control"></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Work with</label>
                                    <div class="col-md-9">
                                        <input type="radio" name="total_member" value="1" id="individual" > Individual
                                        <br>
                                        <input type="radio" name="total_member" id="groupwork" value=""> Group of <input type="number" min="2" id="inputpepole" disabled="yes"> People
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label  class="col-md-3 control-label">Due date</label>
                                    <div class='input-group date col-md-9' style="padding-right: 15px;  padding-left: 15px;" id='form_date'>
                                        <input type='text' class="form-control" name="due_date" readonly="yes" />
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                    <!--                                    <div class="input-group date  col-md-9" style="padding-right: 15px;  padding-left: 15px;" data-date="" data-date-format="dd MM yyyy hh:mm" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd hh:mm">
                                                                            <input class="form-control" size="16" type="text" name="due_date" value="" readonly="yes">
                                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                                                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                                                        </div>
                                                                        <input type="hidden" id="dtp_input2" value="" /><br/>-->
                                </div>
                                <div class="form-group">
                                    <label for="AmType" class="col-md-3 control-label">Assignment Type</label>
                                    <div class="col-md-4">
                                        <select class="form-control" id="AmType" name="AmType">
                                            <option value="f" >File</option>
                                            <option value="w">Doing on web</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section class="step" data-step-title="Create Assignment">
                            <div class="col-md-8 col-md-offset-2" id="uploadAmFile">
                                <input type="file" class="form-control">
                                <span class="text-danger">.doc .pdf .xls available</span>
                            </div>
                            <div class="col-md-10 col-md-offset-1" id="CreateAmOnweb">
                                <input type="text" class="form-control" placeholder="Assignment Title">
                                <br>
                                <p id="AmDescription"></p>
                                <div class="amQuestion">
                                    <!--<div class="multipleChoice">
                                        <hr>
                                        <div class="q_no">
                                            <span class="label label-default">1</span> 
                                            <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>
                                        </div>
                                        <div class="form-group">
                                            <label  class="col-md-3 control-label">Question Text</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">One or multiple answers?</label>
                                            <div class="col-md-5">
                                                <select class="form-control" id="multiple_type">
                                                    <option value="one">One answer only</option>
                                                    <option value="multiple">Multiple choide allowed</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Choice <br><span class='text-danger'>(Don't forget to select answer)</span></label>
                                            <div class="col-md-8 c_list">
                                                <div class="choice-group form-inline">
                                                    <div><input type="radio" name="c_ans"> <input type="text" class="form-control"></div>
                                                </div>
                                                <br>
                                                <a onclick="appendChoice(this)">Add other</a>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Score</label>
                                            <div class="col-md-2">
                                                <input type="number" min="0" step="any" class="form-control" name="score" >
                                            </div>
                                        </div>
                                        <input type="hidden" value="multiple_choice" name="q_type">

                                    </div>-->
                                    <!--<div class="explain">
                                        <hr>
                                        <div class="q_no">
                                            <span class="label label-default">2</span> 
                                            <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Question</label>
                                            <div class="col-md-9">
                                                <textarea class="form-control explain_q_text" name="explain_q_text" ></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label  class="col-md-3 control-label">Answer</label>
                                            <div class="col-md-9">
                                                <textarea class="form-control"></textarea>
                                            </div>
                                        </div>
                                        <input type="hidden" value="explain" name="q_type">
                                    </div>-->

                                    <!--<div class="tfQuestion">
                                        <hr>
                                        <div class="q_no">
                                            <span class="label label-default">3</span> 
                                            <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>
                                        </div>
                                        <div class="form-group">
                                            <label  class="col-md-3 control-label">Question Text</label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Choice <br><span class='text-danger'>(Don't forget to select answer)</span></label>
                                            <div class="col-md-8">
                                                <input type="radio" name="c_ans"> Yes
                                                <input type="radio" name="c_ans"> No
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label">Score</label>
                                            <div class="col-md-2">
                                                <input type="number" min="0" step="any" class="form-control" name="score" >
                                            </div>
                                        </div>
                                        <input type="hidden" value="tfQuestion" name="q_type">
                                    </div>-->
                                    <!--<div class="matchWord">
                                        <hr>
                                        <div class="q_no">
                                            <span class="label label-default">4</span> 
                                            <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>
                                        </div>  
                                        <div class="form-group">
                                            <label  class="col-md-3 control-label">How Many Pair?</label>
                                            <div class="col-md-2">
                                                <input type="number" id="total_pair" min="1" class="form-control" >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-offset-3 col-md-9 matchWord_q_list">
                                                <span class="text-danger">Please tell me how many question before</span>
                                            </div>
                                        </div>
                                        <input type="hidden" value="matchWord" name="q_type">
                                    </div>-->
                                    <!--<div class="fillBlank">
                                        <hr>
                                        <div class="q_no">
                                            <span class="label label-default">5</span> 
                                            <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>
                                        </div>
                                        <div class="form-group">
                                            <label  class="col-md-3 control-label">Question Text</label>
                                            <div class="col-md-9">
                                                <textarea class="form-control"  ></textarea>
                                                <br>
                                                <a class=" btn btn-default" onclick="addAnswer(this)">Add Answer</a>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-offset-3 col-md-9 ansList">

                                            </div>
                                        </div>
                                        <input type="hidden" value="fillBlank" name="q_type">
                                    </div>-->
                                </div>
                                <div class="btn-group dropup center-block" >
                                    <hr>
                                    <button type="button" class="btn btn-default" onclick="addQuestion()" id="addq" ><span class="glyphicon glyphicon-plus-sign"></span> Add Question</button>
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                        <span class="caret"></span>
                                        <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a onclick="setType('multi')"><img src="img/icon/multiple.gif"> Multiple Choice</a></li>
                                        <li><a onclick="setType('tf')"><img src="img/icon/trueFalse.gif"> True/False</a></li>
                                        <li><a onclick="setType('match')"><img src="img/icon/matching.png"> Match word</a></li>
                                        <li><a onclick="setType('fill')"><img src="img/icon/fill.gif"> Fill in Blank</a></li>
                                        <li><a onclick="setType('ep')"><img src="img/icon/explain.gif"> Explain</a></li>
                                    </ul>
                                    <button type="button" class="btn btn-default" onclick="addTitle()" style="margin-left: 20px;"> Add Instruction</button>
                                </div> 
                            </div>
                        </section>
                        <section class="step" data-step-title="Complete and preview">
                            <div class="col-md-8 col-md-offset-2">
                                <h1 class="text-muted">Preview Coming soon !!</h1>
                            </div>
                        </section>
                    </form>
                </div>
            </div>
        </div>

        <script src="js/bootstrap-datetimepicker.min.js"></script>
        <script src="module/easyWizard/lib/jquery.easyWizard.js"></script>
        <script src="//tinymce.cachefly.net/4.0/tinymce.min.js"></script>
        <script>
                                        $(document).ready(function() {
                                            $('#myWizard').easyWizard({
                                                buttonsClass: 'btn btn-default',
                                                submitButtonClass: 'btn btn-primary'});
                                            tinymce.init({selector: '.explain .explain_q_text'});
                                            $('#compareBox').hide();
                                            $('#CreateAmOnweb').hide();

                                            $('#groupwork').click(function() {
                                                $('#inputpepole').removeAttr("disabled");
                                            });


                                            $('#individual').click(function() {
                                                $('#inputpepole').attr("disabled", "yes");
                                            });

                                            $('#form_date').datetimepicker();

                                            $("#AmType").change(function() {
                                                if ($(this).val() == "f") {
                                                    $('#uploadAmFile').show();
                                                    $('#CreateAmOnweb').hide();
                                                } else {
                                                    $('#CreateAmOnweb').show();
                                                    $('#uploadAmFile').hide();
                                                }
                                            });

                                            $("#description").change(function() {
                                                $("#AmDescription").text($(this).val());
                                            });

                                            $(document).on("change", "#multiple_type", function() {
                                                var html = '';
                                                if ($(this).val() == "one") {
                                                    html = '<div class="choice-group form-inline"><div><input type="radio" name="c"> <input type="text" class="form-control"></div></div><br><a onclick="appendChoice(this)">Add other</a>';
                                                } else {
                                                    html = '<div class="choice-group form-inline"><div><input type="checkbox" name="c"> <input type="text" class="form-control"></div></div><br><a onclick="appendChoice(this)">Add other</a>';
                                                }
                                                $(this).parent().parent().parent(".multipleChoice").find(".c_list").html(html);
                                            });

                                            $(document).on("change", "#total_pair", function() {
                                                var matchWord_box = '<div class="row"><div class="col-md-4"><b>Question Text</b></div><div class="col-md-4"><b>Answer</b></div><div class="col-md-2"><b>Score</b></div></div>';
                                                for (var i = 0; i < $(this).val(); i++) {
                                                    matchWord_box += '<div class="row"><div class="col-md-4"><input type="text" class="form-control"></div><div class="col-md-4"><input type="text" class="form-control"></div><div class="col-md-2"><input type="number" min="0" step="any" class="form-control" name="score"></div></div>';
                                                }
                                                $(this).parent().parent().parent(".matchWord").find(".matchWord_q_list").html(matchWord_box);
                                            });
                                        });

                                        function compareView() {
                                            $('#compareBox').show();
                                            $("html, body").animate({scrollTop: $('body').height()}, "slow");
                                        }

                                        function appendChoice(t) {
                                            var type = $('#multiple_type').val();
                                            var inputC = '';
                                            if (type == "one") {
                                                inputC = '<div><br><input type="radio" name="c"> <input type="text" class="form-control"> <a onclick="removeC(this)"><span class="glyphicon glyphicon-remove"></span></a></div>';
                                            } else {
                                                inputC = '<div><br><input type="checkbox" name="c"> <input type="text" class="form-control"> <a onclick="removeC(this)"><span class="glyphicon glyphicon-remove"></span></a></div>';
                                            }
                                            $(t).parent().find('.choice-group').append(inputC);
                                        }

                                        function removeC(t) {
                                            $(t).parent().remove();
                                        }

                                        function GetSelectedText(t) {
                                            var selText = "";
                                            if (window.getSelection) {  // all browsers, except IE before version 9
                                                if (document.activeElement &&
                                                        (document.activeElement.tagName.toLowerCase() == "textarea"))
                                                {
                                                    var text = document.activeElement.value;
                                                    selText = text.substring(document.activeElement.selectionStart,
                                                            document.activeElement.selectionEnd);
                                                }
                                                else {
                                                    var selRange = window.getSelection();
                                                    selText = selRange.toString();
                                                }
                                            }
                                            else {
                                                if (document.selection.createRange) {       // Internet Explorer
                                                    var range = document.selection.createRange();
                                                    selText = range.text;
                                                }
                                            }
                                            if (selText !== "") {
                                                var startIndex = document.activeElement.selectionStart;
                                                var endIndex = document.activeElement.selectionEnd;
                                                if (checkConfilctIndex(t, startIndex, endIndex)) {
                                                    appendAnswerBox(t, selText, startIndex, endIndex);
                                                } else {
                                                    alert("Your answer are confilct");
                                                }
                                                //alert(selText + " " + document.activeElement.selectionStart + "/ " + document.activeElement.selectionEnd);
                                            }
                                        }

                                        function checkConfilctIndex(t, newStartIndex, newEndIndex) {
                                            var startIndex = $(t).parent().parent().parent(".fillBlank").find(".ansList input[name='startIndex']").map(function() {
                                                return $(this).val();
                                            }).get();
                                            var endIndex = $(t).parent().parent().parent(".fillBlank").find(".ansList input[name='endIndex']").map(function() {
                                                return $(this).val();
                                            }).get();
                                            for (i = 0; i < startIndex.length; i++) {
                                                if ((newStartIndex > startIndex[i] && newStartIndex < endIndex[i]) || (newEndIndex > startIndex[i] && newEndIndex <= endIndex[i]) || (newStartIndex <= startIndex[i] && newEndIndex >= endIndex[i])) {
                                                    return false;
                                                }
                                            }
                                            return true;
                                        }

                                        function appendAnswerBox(t, ans, startIndex, endIndex) {
                                            var ansbox = '<div class="row a_group"><div class="col-md-4"><input type="text" class="form-control" value="' + ans + '" readonly="yes"></div><div class="col-md-3"><input type="number" class="form-control" placeholder="score"></div><input type="hidden" value="' + startIndex + '" name="startIndex"><input type="hidden" value="' + endIndex + '" name="endIndex"><a onclick="remove_ans_fillInBlank(this)"><span class="glyphicon glyphicon-trash"></span></a><div>';
                                            $(t).parent().parent().parent(".fillBlank").find(".ansList").append(ansbox);
                                        }

                                        function remove_ans_fillInBlank(t) {
                                            $(t).parent(".a_group").remove();
                                        }

                                        function addAnswer(t) {
                                            $(t).parent().parent().parent(".fillBlank").find(".ansList").append('<span class="text-danger">Hilight text that is your answer for fill in</span>');
                                            var textArea = $(t).siblings("textarea");
                                            if (textArea.attr("readonly") == "readonly") {
                                                textArea.removeAttr("readonly");
                                                textArea.removeAttr("onmouseup");
                                                $(t).parent().parent().parent(".fillBlank").find(".ansList div,.ansList span").remove();
                                            } else {
                                                textArea.attr("onmouseup", "GetSelectedText(this)").attr("readonly", "readonly");
                                            }
                                        }

                                        var amCurrentType = 'multi';
                                        var button_text = '';
                                        function setType(type) {
                                            amCurrentType = type;
                                            if (amCurrentType == 'multi') {
                                                button_text = '<img src="img/icon/multiple.gif"> Multiple Choice';
                                            } else if (amCurrentType == 'tf') {
                                                button_text = '<img src="img/icon/trueFalse.gif"> True/False';
                                            } else if (amCurrentType == 'match') {
                                                button_text = ' <img src="img/icon/matching.png"> Match word';
                                            } else if (amCurrentType == 'fill') {
                                                button_text = '<img src="img/icon/fill.gif"> Fill in Blank';
                                            } else if (amCurrentType == 'ep') {
                                                button_text = '<img src="img/icon/explain.gif"> Explain'
                                            }
                                            $("#addq").html(button_text);
                                        }

                                        var total_q = 1;
                                        function addQuestion(t) {
                                            var question = '<div class="multipleChoice">'
                                                    + '          <hr>'
                                                    + '          <div class="q_no">'
                                                    + '              <span class="label label-default">' + total_q + '</span> '
                                                    + '              <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>'
                                                    + '          </div>'
                                                    + '          <div class="form-group">'
                                                    + '              <label  class="col-md-3 control-label">Question Text</label>'
                                                    + '              <div class="col-md-9">'
                                                    + '                  <input type="text" class="form-control" >'
                                                    + '              </div>'
                                                    + '          </div>'
                                                    + '          <div class="form-group">'
                                                    + '              <label class="col-md-3 control-label">One or multiple answers?</label>'
                                                    + '              <div class="col-md-5">'
                                                    + '                  <select class="form-control" id="multiple_type">'
                                                    + '                      <option value="one">One answer only</option>'
                                                    + '                      <option value="multiple">Multiple choice allowed</option>'
                                                    + '                  </select>'
                                                    + '              </div>'
                                                    + '          </div>'
                                                    + '          <div class="form-group">'
                                                    + '              <label class="col-md-3 control-label">Choice <br><span class="text-danger">(Don\'t forget to select answer)</span></label>'
                                                    + '              <div class="col-md-8 c_list">'
                                                    + '                  <div class="choice-group form-inline">'
                                                    + '                      <div><input type="radio" name="c_ans"> <input type="text" class="form-control"></div>'
                                                    + '                  </div>'
                                                    + '                  <br>'
                                                    + '                  <a onclick="appendChoice(this)">Add other</a>'
                                                    + '              </div>'
                                                    + '          </div>'
                                                    + '          <div class="form-group">'
                                                    + '              <label class="col-md-3 control-label">Score</label>'
                                                    + '              <div class="col-md-2">'
                                                    + '                  <input type="number" min="0" step="any" class="form-control" name="score" >'
                                                    + '              </div>'
                                                    + '          </div>'
                                                    + '          <input type="hidden" value="multiple_choice" name="q_type">'
                                                    + '      </div>';

                                            if (amCurrentType == 'tf') {
                                                question = '<div class="tfQuestion">'
                                                        + '    <hr>'
                                                        + '    <div class="q_no">'
                                                        + '        <span class="label label-default">' + total_q + '</span> '
                                                        + '        <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>'
                                                        + '    </div>'
                                                        + '    <div class="form-group">'
                                                        + '        <label  class="col-md-3 control-label">Question Text</label>'
                                                        + '        <div class="col-md-9">'
                                                        + '            <input type="text" class="form-control" >'
                                                        + '        </div>'
                                                        + '    </div>'
                                                        + '    <div class="form-group">'
                                                        + '        <label class="col-md-3 control-label">Choice <br><span class="text-danger">(Don\'t forget to select answer)</span></label>'
                                                        + '        <div class="col-md-8">'
                                                        + '            <input type="radio" name="c_ans"> True'
                                                        + '            <input type="radio" name="c_ans"> False'
                                                        + '        </div>'
                                                        + '    </div>'
                                                        + '    <div class="form-group">'
                                                        + '        <label class="col-md-3 control-label">Score</label>'
                                                        + '        <div class="col-md-2">'
                                                        + '            <input type="number" min="0" step="any" class="form-control" name="score" >'
                                                        + '        </div>'
                                                        + '    </div>'
                                                        + '    <input type="hidden" value="tfQuestion" name="q_type">'
                                                        + '</div>';
                                            } else if (amCurrentType == 'match') {
                                                question = '<div class="matchWord">'
                                                        + '     <hr>'
                                                        + '     <div class="q_no">'
                                                        + '         <span class="label label-default">' + total_q + '</span> '
                                                        + '         <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>'
                                                        + '     </div>  '
                                                        + ' <div class="form-group">'
                                                        + ' <label  class = "col-md-3 control-label" > Question Text </label>'
                                                        + ' <div class = "col-md-9">'
                                                        + ' <input type = "text" class = "form-control">'
                                                        + ' </div>'
                                                        + ' </div>'

                                                        + '     <div class="form-group">'
                                                        + '         <label  class="col-md-3 control-label">How Many Pair?</label>'
                                                        + '         <div class="col-md-2">'
                                                        + '             <input type="number" id="total_pair" min="1" class="form-control" >'
                                                        + '         </div>'
                                                        + '     </div>'
                                                        + '     <div class="form-group">'
                                                        + '         <div class="col-md-offset-3 col-md-9 matchWord_q_list">'
                                                        + '             <span class="text-danger">Please tell me how many question before</span>'
                                                        + '         </div>'
                                                        + '     </div>'
                                                        + '     <input type="hidden" value="matchWord" name="q_type">'
                                                        + ' </div>';
                                            } else if (amCurrentType == 'fill') {
                                                question = '<div class="fillBlank">'
                                                        + '    <hr>'
                                                        + '    <div class="q_no">'
                                                        + '        <span class="label label-default">' + total_q + '</span> '
                                                        + '        <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>'
                                                        + '    </div>'
                                                        + '    <div class="form-group">'
                                                        + '        <label  class="col-md-3 control-label">Question Text</label>'
                                                        + '        <div class="col-md-9">'
                                                        + '            <textarea class="form-control fillInBlankBox"  ></textarea>'
                                                        + '            <br>'
                                                        + '            <a class=" btn btn-default" onclick="addAnswer(this)">Add Answer</a>'
                                                        + '        </div>'
                                                        + '    </div>'
                                                        + '    <div class="form-group">'
                                                        + '        <div class="col-md-offset-3 col-md-9 ansList">'
                                                        + '        </div>'
                                                        + '    </div>'
                                                        + '    <input type="hidden" value="fillBlank" name="q_type">'
                                                        + '</div>';
                                            } else if (amCurrentType == 'ep') {
                                                question = '<div class="explain">'
                                                        + '    <hr>'
                                                        + '    <div class="q_no">'
                                                        + '        <span class="label label-default">' + total_q + '</span> '
                                                        + '        <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>'
                                                        + '    </div>'
                                                        + '    <div class="form-group">'
                                                        + '        <label class="col-md-3 control-label">Question</label>'
                                                        + '        <div class="col-md-9">'
                                                        + '            <textarea class="form-control explain_q_text" name="explain_q_text" ></textarea>'
                                                        + '        </div>'
                                                        + '    </div>'
                                                        + '    <div class="form-group">'
                                                        + '        <label  class="col-md-3 control-label">Answer</label>'
                                                        + '        <div class="col-md-9">'
                                                        + '            <textarea class="form-control"></textarea>'
                                                        + '        </div>'
                                                        + '    </div>'
                                                        + '    <input type="hidden" value="explain" name="q_type">'
                                                        + '</div>';
                                            }
                                            total_q++;
                                            $(".amQuestion").append(question);

                                        }

                                        function addTitle() {
                                            var titleBox = '<div class="row"><hr><div class="col-md-8"><input type="text" class="form-control" placeholder="Instruction" ></div><a onclick="remove_title(this)"  style="vertical-align: -webkit-baseline-middle"><span class="glyphicon glyphicon-trash"></span></a></div>';
                                            $(".amQuestion").append(titleBox);
                                        }

                                        function remove_q(t) {
                                            total_q--;
                                            var new_q_no = 1;
                                            $(t).parent().parent().remove();
                                            $(".q_no").each(function() {
                                                $(this).find(".label").text(new_q_no);
                                                new_q_no++;
                                            });
                                        }

                                        function remove_title(t) {
                                            $(t).parent().remove();
                                        }

                                        /*function s(el) {
                                         var sel, rng, r2, i = -1;
                                         
                                         
                                         if (typeof el.selectionStart == "number") {
                                         i = el.selectionStart;
                                         //alert(i);
                                         } else if (document.selection && el.createTextRange) {
                                         sel = document.selection;
                                         if (sel) {
                                         r2 = sel.createRange();
                                         rng = el.createTextRange();
                                         rng.setEndPoint("EndToStart", r2);
                                         i = rng.text.length;
                                         }
                                         } else {
                                         el.onkeyup = null;
                                         el.onclick = null;
                                         }
                                         
                                         
                                         
                                         
                                         return i;
                                         }
                                         
                                         var oldText = '';
                                         var checkText = '';
                                         
                                         function checkManualBlank(t, e) {
                                         var text = $(t).val();
                                         if (text.length != oldText.length) {
                                         var keyIndex = s(t);
                                         var lastChar = text.substr(keyIndex-1, 1);
                                         var pattern = '[:_]';
                                         if (text.length - oldText.length == 1 && pattern.indexOf(lastChar) >= 0) {
                                         checkText += lastChar;
                                         if (checkText.length == 9 && checkText == '[:_____:]') {
                                         alert("can't enter this");
                                         $(t).val(text.substr(0, text.length - 9));
                                         checkText = '';
                                         }
                                         } else if (text.length - oldText.length > 1) {
                                         var pasteText = text.substr(oldText.length, text.length - 1);
                                         if (pasteText.indexOf('[:_____:]') >= 0) {
                                         alert("can't enter this");
                                         var newText = text.substr(0, oldText.length - 1);
                                         pasteText = pasteText.replace('[:_____:]', ' ');
                                         newText += pasteText;
                                         $(t).val(newText);
                                         checkText = '';
                                         }
                                         } else {
                                         checkText = '';
                                         }
                                         alert(checkText);
                                         }
                                         }
                                         
                                         function setOldText(t) {
                                         oldText = $(t).val();
                                         }*/
        </script>
    </body>
</html>
