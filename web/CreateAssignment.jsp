<%-- 
    Document   : home
    Created on : Apr 6, 2014, 5:08:52 PM
    Author     : JenoVa
--%>

<%@page contentType="text/html; charset=UTF-8" %>
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
        <script src="module/tinymce/tinymce.min.js"></script>
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

            .moveselect{
                cursor: move;
            }

            .pvtable tr td:first-child{
                font-weight: bold;
                width: 200px;
            }

            #preview img{
                border-radius: initial;   
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
                        <li><a href="CourseAssignment">Assignment</a></li>
                        <li class="active"><a href="#">Create Assignment</a></li>
                    </ol>
                    <form id="myWizard" method="post" action="createAssignment" class="form-horizontal" enctype="multipart/form-data" onsubmit="return checkingForm();">
                        <section class="step" data-step-title="Enter Information">
                            <div class="col-md-8 col-md-offset-2">
                                <div class="form-group">
                                    <label for="name" class="col-md-3 control-label">Name</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" id="name" name="amName" required="yes" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="description" class="col-md-3 control-label">Description</label>
                                    <div class="col-md-9" >
                                        <textarea  rows="3"  id="description" name="description" class="form-control" required="yes" ></textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-3 control-label">Work with</label>
                                    <div class="col-md-9">
                                        <input type="radio" name="total_member" value="1" id="individual" checked="yes" > Individual
                                        <br>
                                        <input type="radio" name="total_member" id="groupwork" value=""> Group of <input type="number" min="2" id="inputpepole" disabled="yes"> People
                                    </div>
                                </div>
                                <div class="form-group" id="due_date" style="margin-bottom: 0">
                                    <label  class="col-md-3 control-label">Due date</label>
                                    <div class="input-group date form_datetime col-md-9" style="padding-right: 15px;  padding-left: 15px;"  data-link-field="dtp_input1">
                                        <input class="form-control" size="16" type="text" id="dtp_input1_text" value="" readonly>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                    </div>
                                    <input type="hidden" id="dtp_input1" name="due_date" value="" /><br/>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-9 col-md-offset-3">
                                        <input type="checkbox" id="latePeriodbtn" name="latesend" value="true"> Can send after due date. please select period.
                                        <div id="latePeriod" class="input-group date form_datetime2"  data-link-field="dtp_input2">
                                            <input class="form-control" size="16" type="text" value="" id="dtp_input2_text" readonly >
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                                            <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                        </div>
                                    </div>
                                    <input type="hidden" id="dtp_input2" name="late_date" value="" /><br/>
                                </div>
                                <div class="form-group">
                                    <label for="AmType" class="col-md-3 control-label">Assignment Type</label>
                                    <div class="col-md-4">
                                        <select class="form-control" id="AmType" name="AmType">
                                            <option value="file" selected="yes" >File</option>
                                            <option value="web">Doing on web</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section class="step" data-step-title="Create Assignment">
                            <div class="col-md-8 col-md-offset-2" id="uploadAmFile">
                                <div class="form-group">
                                    <label for="fullymark" class="col-md-3 control-label">Fully score is</label>
                                    <div class="col-md-3">
                                        <input type="number" name="fullymark" id="fullymark" class="form-control" required="yes">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="file" class="col-md-3 control-label">Select Assignment</label>
                                    <div class="col-md-9">
                                        <input type="file" name="file" id="amfile" onchange="checkFile(this)" class="form-control" required="yes">
                                        <!--<span class="text-danger">.doc .pdf .xls available</span>-->
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-10 col-md-offset-1" id="CreateAmOnweb">
                                <input type="text" name="title_assignment_onweb" id="title_assignment_onweb" class="form-control" placeholder="Assignment Title" >
                                <br>
                                <p id="AmDescription"></p>
                                <div class="amQuestion" id="sortable">

                                </div>
                                <div class="btn-group dropup center-block" >
                                    <hr>
                                    <button type="button" class="btn btn-default" onclick="addQuestion()" id="addq" ><span class="glyphicon glyphicon-plus-sign"></span> Add Question</button>
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" >
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
                            <div class="col-md-12">
                                <div class="well col-md-12">
                                    <table class="table pvtable">   
                                        <tbody>
                                            <tr>
                                                <td>Name:</td>
                                                <td id="pvamName"></td>
                                            </tr>
                                            <tr>
                                                <td>Description:</td>
                                                <td id="pvamDesc"></td>
                                            </tr>
                                            <tr>
                                                <td>Work with:</td>
                                                <td id="pvamWorkwith"></td>
                                            </tr>   
                                            <tr>
                                                <td>Due Date:</td>
                                                <td id="pvamDue"></td>
                                            </tr>   
                                            <tr>
                                                <td>Late Date:</td>
                                                <td id="pvamLate"></td>
                                            </tr>   
                                            <tr>
                                                <td>Assignment Type:</td>
                                                <td id="pvamType"></td>
                                            </tr>   
                                        </tbody>
                                    </table>
                                    <hr/>
                                    <div id="preview">

                                    </div>
                                </div>
                            </div>
                        </section>
                    </form>
                </div>
            </div>
        </div>
        <script src="js/bootstrap-datetimepicker.min.js"></script>
        <script src="module/easyWizard/lib/jquery.easyWizard.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script>
                                        $(document).ready(function() {
                                            tinymce.init({
                                                plugins: [
                                                    "advlist autolink lists link image charmap print preview anchor",
                                                    "searchreplace visualblocks code fullscreen",
                                                    "insertdatetime media table contextmenu paste"
                                                ],
                                                toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
                                            });
                                            $('#myWizard').easyWizard({
                                                buttonsClass: 'btn btn-default',
                                                submitButtonClass: 'btn btn-primary',
                                                after: function(wizardObj, prevStepObj, currentStepObj) {
                                                    if (currentStepObj.selector == '.step[data-step="3"]') {
//                                                       alert("step3");
                                                        var name = $("#name").val();
                                                        $("#pvamName").text(name);

                                                        var description = $("#description").val();
                                                        $("#pvamDesc").text(description);

                                                        var amtype = $("#AmType").val();
                                                        $("#pvamWorkwith").text(amtype);

                                                        var due = $("#dtp_input1_text").val();
                                                        $("#pvamDue").text(due);

                                                        var late = $("#dtp_input2_text").val();
                                                        $("#pvamLate").text(late);

                                                        var amtype = $("#AmType").val();
                                                        $("#pvamType").text(amtype);

                                                        if (amtype == "web") {
                                                            $("#preview").html("");
                                                            createpreview();
                                                        } else {
                                                            var fullpath = $('#amfile').val();
                                                            var name = getFileName(fullpath);
                                                            $("#preview").html("<h3><span class='glyphicon glyphicon-file'></span><b>File name : </b>" + name + "</h3>");
                                                        }
                                                    }
                                                }
                                            });


//                                            tinymce.init({selector: '.explain .explain_q_text'});
                                            $("#sortable").sortable({
                                                revert: true,
                                                handle: ".moveselect",
                                                update: function() {
                                                    var new_seq = 1;
                                                    var new_Qno = 1;
                                                    var old_seq = 0;
                                                    var old_name = 0;
                                                    var new_name = 0;
                                                    tinyMCE.remove();
                                                    $("#sortable >div").each(function() {

                                                        old_seq = $(this).find("input[name='seqno']").val();
                                                        $(this).find("input[name='seqno']").val(new_seq);
                                                        $(this).find("[name^='" + old_seq + "']").each(function() {
                                                            old_name = $(this).attr("name");
                                                            new_name = old_name.replace(old_seq, new_seq);
//                                                            console.log(new_name);
                                                            $(this).attr("name", new_name);
                                                        });

                                                        var qtype = $("input[name='" + new_seq + "q_type'").val();
                                                        if (qtype == 'explain') {
                                                            console.log(old_seq + "textarea //" + new_seq + "textarea");
//                                                            tinymce.execCommand('mceRemoveEditor', true, old_seq + 'textarea');
                                                            $(this).find("textarea#" + old_seq + 'textarea').removeAttr("id").attr("id", new_seq + "textarea");
                                                            tinymce.execCommand('mceAddEditor', true, new_seq + 'textarea');
                                                        }

                                                        new_seq++;
                                                    });
                                                    $("#sortable .q_no").each(function() {
                                                        $(this).find(".label").text(new_Qno);
                                                        $(this).find("input[name$='q_no']").val(new_Qno);
                                                        new_Qno++;
                                                    });
                                                }
                                            });
                                            $("#CreateAmOnweb div").disableSelection();
                                            $('#compareBox').hide();
                                            $('#CreateAmOnweb').hide();
                                            $('#latePeriod').hide();
                                            var monthNames = ["January", "February", "March", "April", "May", "June",
                                                "July", "August", "September", "October", "November", "December"];
                                            var d = new Date();

                                            $('#due_date input').val(d.getFullYear() + "-" + monthNames[d.getMonth()] + "-" + ('0' + d.getDate()).slice(-2));
                                            $('#dtp_input1').val(d.getFullYear() + "-" + ('0' + (d.getMonth() + 1)).slice(-2) + "-" + ('0' + d.getDate()).slice(-2));

                                            $('#latePeriod input').val(d.getFullYear() + "-" + monthNames[d.getMonth()] + "-" + ('0' + d.getDate()).slice(-2));
                                            $('#dtp_input2').val(d.getFullYear() + "-" + ('0' + (d.getMonth() + 1)).slice(-2) + "-" + ('0' + d.getDate()).slice(-2));

                                            $('#due_date input').change(function() {
                                                $('#latePeriod').datetimepicker('setStartDate', $(this).val());
                                                $('#latePeriod input').val($(this).val());
                                                $('#dtp_input2').val($('#dtp_input1').val());
                                                $('#latePeriod').datetimepicker('update');
                                            });
                                            $('.form_datetime').datetimepicker({
                                                format: 'yyyy-MM-dd',
                                                weekStart: 1,
                                                todayBtn: 1,
                                                autoclose: 1,
                                                startView: 2,
                                                forceParse: 0,
                                                startDate: new Date(),
                                                minView: 2
                                            });
                                            $('#latePeriod').datetimepicker({
                                                format: 'yyyy-MM-dd',
                                                weekStart: 1,
                                                autoclose: 1,
                                                todayHighlight: 0,
                                                startView: 2,
                                                forceParse: 0,
                                                startDate: new Date(),
                                                minView: 2
                                            });
                                            $('#groupwork').click(function() {
                                                $('#inputpepole').removeAttr("disabled").attr("required", "yes");
                                            });
                                            $('#individual').click(function() {
                                                $('#inputpepole').attr("disabled", "yes");
                                            });
                                            $('#latePeriodbtn').click(function() {
                                                if ($(this).prop('checked')) {
                                                    $('#latePeriod').show();
                                                } else {
                                                    $('#latePeriod').hide();
                                                }
                                            });
                                            $('#inputpepole').change(function() {
                                                $('#groupwork').val($(this).val());
                                            });
                                            $("#AmType").change(function() {
                                                if ($(this).val() == "file") {
                                                    $('#uploadAmFile').show();
                                                    $('#CreateAmOnweb').hide();
                                                    $('#fullymark').attr("required", "yes");
                                                    $('#amfile').attr("required", "yes");
                                                    $('#title_assignment_onweb').removeAttr("required");
                                                } else {
                                                    $('#CreateAmOnweb').show();
                                                    $('#uploadAmFile').hide();
                                                    $('#title_assignment_onweb').attr("required", "yes");
                                                    $('#fullymark').removeAttr("required");
                                                    $('#amfile').removeAttr("required");
                                                }
                                            });
                                            $("#description").change(function() {
                                                $("#AmDescription").text($(this).val());
                                            });
//                                            $("#title_assignment_onweb").change(function() {
//                                                $("#pv_title b u").text($(this).val());
//                                            });
                                            $(document).on("change", "#total_pair", function() {
                                                $(this).parent().parent().parent().find("#total_dummy").removeAttr("disabled").val(0);
                                                var seq_of_choice = $(this).parent().parent().parent().find("[name='seqno']").val();
                                                var matchWord_box = '<span class="label label-info"><i class="glyphicon glyphicon-info-sign"></i> If you want to add dummy answer, add text in answer box and put score to 0.</span><br/><br/>';
                                                matchWord_box += '<div class="row header"><div class="col-md-4"><b>Question Text</b></div><div class="col-md-4"><b>Answer</b></div><div class="col-md-2"><b>Score</b></div></div>';
                                                for (var i = 0; i < $(this).val(); i++) {
                                                    matchWord_box += '<div class="row answer"><div class="col-md-4"><input type="text" class="form-control" name="' + seq_of_choice + 'match_text" onfocusout="checkText(this)"  required="yes"></div><div class="col-md-4"><input type="text" class="form-control" name="' + seq_of_choice + 'match_ans" onfocusout="checkText(this)"  required="yes"></div><div class="col-md-2"><input type="number" min="0" step="any" class="form-control" name="' + seq_of_choice + 'm_score" required="yes"></div> <a onclick="removeC(this)"><span class="glyphicon glyphicon-remove"></span></a></div>';
                                                }
                                                var element = $(this).parent().parent().parent(".matchWord").find(".matchWord_q_list");
                                                element.find(".answer,.header,.label,.text-danger,br").remove();
                                                element.prepend(matchWord_box);
                                            });

                                            $(document).on("change", "#total_dummy", function() {
                                                var seq_of_choice = $(this).parent().parent().parent().find("[name='seqno']").val();
                                                $(this).parent().parent().parent().find(".dummy_answer").remove();
                                                var matchWord_dummy = '';
                                                for (var i = 0; i < $(this).val(); i++) {
                                                    matchWord_dummy += '<div class="row dummy_answer"><div class="col-md-4"><input type="text" class="form-control" name="' + seq_of_choice + 'match_text" readonly="yes" onfocusout="checkText(this)"></div><div class="col-md-4"><input type="text" class="form-control" name="' + seq_of_choice + 'match_ans" onfocusout="checkText(this)"></div><div class="col-md-2"><input type="number" min="0" step="any" class="form-control" name="' + seq_of_choice + 'm_score" required="yes" value="0" readonly="yes"></div> <a onclick="removeC(this)"style="vertical-align: -webkit-baseline-middle"><span class="glyphicon glyphicon-remove"></span></a></div>';
                                                }
                                                $(this).parent().parent().parent(".matchWord").find(".matchWord_q_list").append(matchWord_dummy);
                                            });

                                            $(document).on("change", "#multiple_type", function() {
                                                var seq_of_choice = $(this).parent().parent().parent().find("[name='seqno']").val();
                                                var html = '';
                                                if ($(this).val() == "one") {
                                                    html = '<div class="choice-group form-inline"><div><input type="radio" name="' + seq_of_choice + 'c" required="yes" onClick="mark(this)"> <input type="text" class="form-control" name="' + seq_of_choice + 'ctext" onfocusout="checkText(this)" onkeyup="addToC(this)" required="yes"></div></div><br><a onclick="appendChoice(this)">Add other</a>';
                                                } else {
                                                    html = '<div class="choice-group form-inline"><div><input type="checkbox" name="' + seq_of_choice + 'c" onClick="mark(this);checkRequire(this);" required="yes"> <input type="text" class="form-control" name="' + seq_of_choice + 'ctext" onfocusout="checkText(this)" onkeyup="addToC(this)" required="yes"></div></div><br><a onclick="appendChoice(this)">Add other</a>';
                                                }
                                                $(this).parent().parent().parent(".multipleChoice").find(".c_list").html(html);
                                            });
                                        });
                                        function compareView() {
                                            $('#compareBox').show();
                                            $("html, body").animate({scrollTop: $('body').height()}, "slow");
                                        }

                                        function removeC(t) {
                                            $(t).parent().remove();
                                        }

                                        function GetSelectedText(t) {
                                            var selText = "";
                                            if (window.getSelection) {  // all browsers, except IE before version 9
                                                if (document.activeElement && (document.activeElement.tagName.toLowerCase() == "textarea")) {
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
                                            console.log("select text:" + selText);
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
                                            console.log("newstart:" + newStartIndex);
                                            console.log("newend:" + newEndIndex);
                                            var startIndex = $(t).parent().parent().parent(".fillBlank").find(".ansList input[name$='startIndex']").map(function() {
                                                return $(this).val();
                                            }).get();
                                            var endIndex = $(t).parent().parent().parent(".fillBlank").find(".ansList input[name$='endIndex']").map(function() {
                                                return $(this).val();
                                            }).get();
                                            for (i = 0; i < startIndex.length; i++) {
                                                console.log(startIndex[i]);
                                                console.log(endIndex[i]);
                                                if ((newStartIndex > startIndex[i] && newStartIndex < endIndex[i]) || (newEndIndex > startIndex[i] && newEndIndex <= endIndex[i]) || (newStartIndex <= startIndex[i] && newEndIndex >= endIndex[i])) {
                                                    return false;
                                                }
                                            }
                                            return true;
                                        }

                                        function appendAnswerBox(t, ans, startIndex, endIndex) {
                                            var seq_of_choice = $(t).parent().parent().parent().find("[name='seqno']").val();
                                            var ansbox = '<div class="row a_group"><div class="col-md-4"><input type="text" class="form-control" value="' + ans + '" readonly="yes" name="' + seq_of_choice + 'qanswer"></div><div class="col-md-3"><input type="number" class="form-control" placeholder="score" name="' + seq_of_choice + 'score" required="yes" min="0"></div><input type="hidden" value="' + startIndex + '" name="' + seq_of_choice + 'startIndex"><input type="hidden" value="' + endIndex + '" name="' + seq_of_choice + 'endIndex"><a onclick="remove_ans_fillInBlank(this)"><span class="glyphicon glyphicon-trash"></span></a><div>';
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
                                        var seqno = 1;
                                        function addQuestion(t) {
                                            var question = '<div class="multipleChoice">'
                                                    + '          <hr>'
                                                    + '          <input type="hidden" name="seqno" value="' + seqno + '"/>'
                                                    + '          <div class="q_no">'
                                                    + '             <span class="moveselect pull-left text-muted"><span class="glyphicon glyphicon-align-justify"></span></span>'
                                                    + '              <span class="label label-default">' + total_q + '</span> '
                                                    + '              <input type="hidden" name="' + seqno + 'q_no" value="' + total_q + '"/>'
                                                    + '              <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>'
                                                    + '          </div>'
                                                    + '          <div class="form-group">'
                                                    + '              <label  class="col-md-3 control-label">Question Text</label>'
                                                    + '              <div class="col-md-9">'
                                                    + '                  <input type="text" class="form-control" name="' + seqno + 'qtext" required="yes" >'
                                                    + '              </div>'
                                                    + '          </div>'
                                                    + '          <div class="form-group">'
                                                    + '              <label class="col-md-3 control-label">One or multiple answers?</label>'
                                                    + '              <div class="col-md-5">'
                                                    + '                  <select class="form-control" id="multiple_type" name="' + seqno + 'qcategory">'
                                                    + '                      <option value="one" selected="yes">One answer only</option>'
                                                    + '                      <option value="multiple">Multiple answer allowed</option>'
                                                    + '                  </select>'
                                                    + '              </div>'
                                                    + '          </div>'
                                                    + '          <div class="form-group">'
                                                    + '              <label class="col-md-3 control-label">Choice <br><span class="text-danger">(Don\'t forget to select answer)</span></label>'
                                                    + '              <div class="col-md-8 c_list">'
                                                    + '                  <div class="choice-group form-inline">'
                                                    + '                      <div><input type="radio" onClick="mark(this)" name="' + seqno + 'c" value="" required="yes"> <input type="text" name="' + seqno + 'ctext" class="form-control" onkeyup="addToC(this)" onfocusout="checkText(this)" required="yes"></div>'
                                                    + '                  </div>'
                                                    + '                  <br>'
                                                    + '                  <a onclick="appendChoice(this)">Add other</a>'
                                                    + '              </div>'
                                                    + '          </div>'
                                                    + '          <div class="form-group">'
                                                    + '              <label class="col-md-3 control-label">Score</label>'
                                                    + '              <div class="col-md-2">'
                                                    + '                  <input type="number" min="0" step="any" class="form-control" name="' + seqno + 'score" required="yes" >'
                                                    + '              </div>'
                                                    + '          </div>'
                                                    + '          <input type="hidden" value="multiple_choice" name="' + seqno + 'q_type">'
                                                    + '      </div>';
                                            if (amCurrentType == 'tf') {
                                                question = '<div class="tfQuestion">'
                                                        + '    <hr>'
                                                        + '          <input type="hidden" name="seqno" value="' + seqno + '"/>'
                                                        + '    <div class="q_no">'
                                                        + '             <span class="moveselect pull-left text-muted"><span class="glyphicon glyphicon-align-justify"></span></span>'
                                                        + '        <span class="label label-default">' + total_q + '</span> '
                                                        + '          <input type="hidden" name="' + seqno + 'q_no" value="' + total_q + '"/>'
                                                        + '        <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>'
                                                        + '    </div>'
                                                        + '    <div class="form-group">'
                                                        + '        <label  class="col-md-3 control-label">Question Text</label>'
                                                        + '        <div class="col-md-9">'
                                                        + '            <input type="text" class="form-control" name="' + seqno + 'qtext" required="yes">'
                                                        + '        </div>'
                                                        + '    </div>'
                                                        + '    <div class="form-group">'
                                                        + '        <label class="col-md-3 control-label">Choice <br><span class="text-danger">(Don\'t forget to select answer)</span></label>'
                                                        + '        <div class="col-md-8">'
                                                        + '            <input type="radio" name="' + seqno + 'c_ans" value="true" checked="yes" required="yes"> True'
                                                        + '            <input type="radio" name="' + seqno + 'c_ans" value="false" required="yes"> False'
                                                        + '        </div>'
                                                        + '    </div>'
                                                        + '    <div class="form-group">'
                                                        + '        <label class="col-md-3 control-label">Score</label>'
                                                        + '        <div class="col-md-2">'
                                                        + '            <input type="number" min="0" step="any" class="form-control" name="' + seqno + 'score" required="yes" >'
                                                        + '        </div>'
                                                        + '    </div>'
                                                        + '    <input type="hidden" value="tf" name="' + seqno + 'qcategory">'
                                                        + '    <input type="hidden" value="tfQuestion" name="' + seqno + 'q_type">'
                                                        + '</div>';
                                            } else if (amCurrentType == 'match') {
                                                question = '<div class="matchWord">'
                                                        + '     <hr>'
                                                        + '          <input type="hidden" name="seqno" value="' + seqno + '"/>'
                                                        + '     <div class="q_no">'
                                                        + '             <span class="moveselect pull-left text-muted"><span class="glyphicon glyphicon-align-justify"></span></span>'
                                                        + '         <span class="label label-default">' + total_q + '</span> '
                                                        + '          <input type="hidden" name="' + seqno + 'q_no" value="' + total_q + '"/>'
                                                        + '         <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>'
                                                        + '     </div>  '
                                                        + ' <div class="form-group">'
                                                        + ' <label  class = "col-md-3 control-label" > Question Text </label>'
                                                        + ' <div class = "col-md-9">'
                                                        + ' <input type = "text" class = "form-control" name="' + seqno + 'qtext" required="yes">'
                                                        + ' </div>'
                                                        + ' </div>'

                                                        + '     <div class="form-group">'
                                                        + '         <label  class="col-md-3 control-label">How many pair of question?</label>'
                                                        + '         <div class="col-md-2">'
                                                        + '             <input type="number" id="total_pair" min="1" class="form-control" >'
                                                        + '         </div>'
                                                        + '     </div>'
                                                        + '     <div class="form-group">'
                                                        + '         <label  class="col-md-3 control-label">How many dummy answer?</label>'
                                                        + '         <div class="col-md-2">'
                                                        + '             <input type="number" id="total_dummy" min="0" class="form-control" disabled="yes">'
                                                        + '         </div>'
                                                        + '     </div>'
                                                        + '     <div class="form-group">'
                                                        + '         <div class="col-md-offset-3 col-md-9 matchWord_q_list">'
                                                        + '             <span class="text-danger">Please tell me how many question before</span>'
                                                        + '         </div>'
                                                        + '     </div>'
                                                        + '     <input type="hidden" value="matchWord"  name="' + seqno + 'q_type">'
                                                        + ' </div>';
                                            } else if (amCurrentType == 'fill') {
                                                question = '<div class="fillBlank">'
                                                        + '    <hr>'
                                                        + '          <input type="hidden" name="seqno" value="' + seqno + '"/>'
                                                        + '    <div class="q_no">'
                                                        + '             <span class="moveselect pull-left text-muted"><span class="glyphicon glyphicon-align-justify"></span></span>'
                                                        + '        <span class="label label-default">' + total_q + '</span> '
                                                        + '          <input type="hidden" name="' + seqno + 'q_no" value="' + total_q + '"/>'
                                                        + '        <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>'
                                                        + '    </div>'
                                                        + '    <div class="form-group">'
                                                        + '        <label  class="col-md-3 control-label">Question Text</label>'
                                                        + '        <div class="col-md-9">'
                                                        + '            <textarea class="form-control fillInBlankBox" name="' + seqno + 'qtext" required="yes"  ></textarea>'
                                                        + '            <br>'
                                                        + '            <a class=" btn btn-default" onclick="addAnswer(this)">Add Answer</a>'
                                                        + '        </div>'
                                                        + '    </div>'
                                                        + '    <div class="form-group">'
                                                        + '        <div class="col-md-offset-3 col-md-9 ansList">'
                                                        + '        </div>'
                                                        + '    </div>'
                                                        + '    <input type="hidden" value="fillBlank" name="' + seqno + 'q_type">'
                                                        + '</div>';
                                            } else if (amCurrentType == 'ep') {
                                                question = '<div class="explain">'
                                                        + '    <hr>'
                                                        + '          <input type="hidden" name="seqno" value="' + seqno + '"/>'
                                                        + '    <div class="q_no">'
                                                        + '             <span class="moveselect pull-left text-muted"><span class="glyphicon glyphicon-align-justify"></span></span>'
                                                        + '        <span class="label label-default">' + total_q + '</span> '
                                                        + '          <input type="hidden" name="' + seqno + 'q_no" value="' + total_q + '"/>'
                                                        + '        <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>'
                                                        + '    </div>'
                                                        + '    <div class="form-group">'
                                                        + '        <label class="col-md-3 control-label">Question</label>'
                                                        + '        <div class="col-md-9">'
                                                        + '            <textarea class="form-control explain_q_text" name="' + seqno + 'qtext" id="' + seqno + 'textarea"></textarea>'
                                                        + '        </div>'
                                                        + '    </div>'
                                                        + '    <div class="form-group">'
                                                        + '        <label  class="col-md-3 control-label">Answer</label>'
                                                        + '        <div class="col-md-9">'
                                                        + '            <textarea class="form-control" name="' + seqno + 'qanswer" ></textarea>'
                                                        + '        </div>'
                                                        + '    </div>'
                                                        + '    <div class="form-group">'
                                                        + '        <label  class="col-md-3 control-label">Max score</label>'
                                                        + '        <div class="col-md-4">'
                                                        + '            <input type="number" name="' + seqno + 'score" min="0" step="any" class="form-control"  placeholder="Max score." required="yes"/>'
                                                        + '        </div>'
                                                        + '    </div>'
                                                        + '    <input type="hidden" value="explain" name="' + seqno + 'q_type">'
                                                        + '</div>';

                                            }
                                            $(".amQuestion").append(question);
                                            if (amCurrentType == 'ep') {
                                                //init tineMCE
                                                tinymce.execCommand('mceAddEditor', false, seqno + 'textarea');

                                                tinymce.init({
                                                    plugins: [
                                                        "advlist autolink lists link image charmap print preview anchor",
                                                        "searchreplace visualblocks code fullscreen",
                                                        "insertdatetime media table contextmenu paste"
                                                    ],
                                                    toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image"
                                                });
                                            }
                                            total_q++;
                                            seqno++;
                                        }

                                        function appendChoice(t) {
                                            var type = $(t).parent().parent().parent().find('#multiple_type').val();
                                            var seq_of_choice = $(t).parent().parent().parent().find("[name='seqno']").val();
                                            var inputC = '';
                                            if (type == "one") {
                                                inputC = '<div><br><input type="radio" name="' + seq_of_choice + 'c" onClick="mark(this)" value=""> <input type="text" name="' + seq_of_choice + 'ctext" class="form-control" onkeyup="addToC(this)" required="yes" onfocusout="checkText(this)"> <a onclick="removeC(this)"><span class="glyphicon glyphicon-remove"></span></a></div>';
                                            } else {
                                                inputC = '<div><br><input type="checkbox" name="' + seq_of_choice + 'c" onClick="mark(this);checkRequire(this);" required="yes" value="" > <input type="text" name="' + seq_of_choice + 'ctext" class="form-control" onkeyup="addToC(this)" required="yes" onfocusout="checkText(this)"> <a onclick="removeC(this)"><span class="glyphicon glyphicon-remove"></span></a></div>';
                                            }
                                            $(t).parent().find('.choice-group').append(inputC);
                                        }

                                        function addTitle() {
                                            var titleBox = '<div class="row instruction"><hr><span class="moveselect pull-left text-muted"><span class="glyphicon glyphicon-align-justify"></span></span><input type="hidden" name="seqno" value="' + seqno + '"/><label class="col-md-3 control-label">Instruction </label><div class="col-md-8"><textarea class="form-control" placeholder="Instruction" name="' + seqno + 'instruction" required="yes" ></textarea></div><a onclick="remove_title(this)"  style="vertical-align: -webkit-baseline-middle"><span class="glyphicon glyphicon-trash"></span></a><input type="hidden" value="instruction" name="' + seqno + 'q_type"></div>';
                                            $(".amQuestion").append(titleBox);
                                            seqno++;
                                        }

                                        function addToC(t) {
                                            $(t).siblings("[name$='c']").val($(t).val());
                                        }

                                        function mark(t) {
                                            var ans = $(t).siblings('[type="text"]').val();
                                            $(t).val(ans);
                                        }
                                        var newTotal_q = 1;
                                        function remove_q(t) {
                                            total_q--;
                                            seqno--;
                                            var new_q_no = 1;
                                            $(t).parent().parent().remove();
                                            $(".q_no").each(function() {
                                                $(this).find(".label").text(new_q_no);
                                                $(this).find("input").val(new_q_no);
                                                new_q_no++;
                                            });
                                            $(".amQuestion > div").each(function() {
                                                $(this).find("[name='seqno']").val(newTotal_q);
                                                $(this).find("[name]").each(function() {
                                                    var namevl = $(this).attr("name").match(/\d+/);
                                                    var newvl = "";
                                                    if ($.isNumeric(namevl)) {
                                                        newvl = $(this).attr("name").replace(namevl, newTotal_q);
                                                        $(this).attr("name", newvl);
                                                    }
                                                });
                                                newTotal_q++;
                                            });
                                            //reset value
                                            newTotal_q = 1
                                        }

                                        function remove_title(t) {
                                            seqno--;
                                            $(t).parent().remove();
                                        }

                                        function createpreview() {
                                            var html = " <h4 id=\"pv_title\"><b><u>" + $("#title_assignment_onweb").val() + "</u></b></h4>";
                                            $("#preview").append(html);
                                            $('.amQuestion').children().each(function() {
                                                var q = $(this); // "this" is the current element in the loop
//                                                console.log(q.find("[name$='q_type']").val());
                                                var type = q.find("[name$='q_type']").val();
                                                var q_no = q.find("[name$='q_no']").val();
                                                if (type == 'instruction') {
                                                    var ins = q.find("[name$='instruction']").val();
                                                    html = '<h5><b><u>Instruction:</u> ' + ins + '</b></h5>';
                                                    $("#preview").append(html);
                                                } else if (type == 'tfQuestion') {
                                                    var qtext = q.find("[name$='qtext']").val();
                                                    html = '<div>'
                                                            + '        <p>' + q_no + '.) ' + qtext + '</p>'
                                                            + '                <input type="radio" disabled="yes" value="true"> True <br/>'
                                                            + '                <input type="radio" disabled="yes" value="false"> False'
//                                                  +'          <input type="hidden" name="2q_id" value="188">
//                                                  +'          <input type="hidden" value="multiple_choice" name="2q_type">
//                                                  +'          <input type="hidden" name="seqno" value="2">
                                                            + '    </div>';
                                                    $("#preview").append(html);
                                                } else if (type == 'multiple_choice') {
                                                    var qtext = q.find("[name$='qtext']").val();
                                                    var cate = q.find("[name$='qcategory']").val();
                                                    var choice = "";
                                                    if (cate == "one") {
                                                        console.log("if " + cate);
                                                        $.each(q.find("[name$='ctext']"), function() {
                                                            choice += '<input type="radio"> ' + $(this).val() + "<br/>  ";
                                                        });
                                                    } else if (cate == "multiple") {
                                                        console.log("else " + cate);
                                                        $.each(q.find("[name$='ctext']"), function() {
                                                            choice += '<input type="checkbox"> ' + $(this).val() + "<br/>  ";
                                                        });
                                                    }
                                                    html = '<div>'
                                                            + '           <p>' + q_no + '.) ' + qtext + '</p>'
                                                            + choice
                                                            + '   </div>';
                                                    $("#preview").append(html);
                                                } else if (type == 'matchWord') {
                                                    var qtext = q.find("[name$='qtext']").val();
                                                    var qselect = "<select>";
                                                    $.each(q.find("[name$='match_ans']"), function() {
                                                        if ($(this).val() != '') {
                                                            qselect += ' <option>' + $(this).val() + '</option>';
                                                        }
                                                    });
                                                    qselect += " </select>"

                                                    var qlist = "";
                                                    $.each(q.find("[name$='match_text']"), function() {
                                                        if ($(this).val() != '') {
                                                            qlist += qselect + '<span>  ' + $(this).val() + '</span><br><br>';
                                                        }
                                                    });
                                                    var qanswer = "";
                                                    $.each(q.find("[name$='match_ans']"), function() {
                                                        qanswer += '<span>' + $(this).val() + '</span><br><br>';
                                                    });
                                                    html = '<div>'
                                                            + '           <p>' + q_no + '.) ' + qtext + '</p>'
                                                            + ' <div class="col-md-8">'
                                                            + qlist
                                                            + '</div>'
                                                            + '<div class="col-md-2 col-md-offset-2">'
                                                            + qanswer
                                                            + '</div>'
                                                            + '</div>';
                                                    $("#preview").append(html);
                                                } else if (type == 'fillBlank') {
                                                    var qtext = q.find("[name$='qtext']").val();
                                                    var reptext = "<input type='text' value=''/>";
                                                    var startEndList = [];
                                                    q.find(".ansList .a_group").each(function() {
                                                        var startEnd = [$(this).find("[name$='startIndex']").val(), $(this).find("[name$='endIndex']").val()];
                                                        startEndList.push(startEnd);
                                                    });
                                                    $.ajax({
                                                        type: 'POST',
                                                        url: 'replaceStringByIndex',
                                                        async: false,
                                                        data: {qtext: qtext, "startEndList[]": startEndList, reptext: reptext},
                                                        success: function(newQText) {
                                                            console.log(newQText);
                                                            html = '<div>'
                                                                    + '           <p>' + q_no + '.) ' + newQText + '</p>'
                                                                    + '</div>';
                                                            console.log(html);
                                                            $("#preview").append(html);
                                                        }
                                                    });

                                                } else if (type == 'explain') {
//                                                    var qtext = q.find("[id$='textarea_ifr']").contents().find("html").html();
//                                                    console.log(qtext.contents().find("html").html());
                                                    html = '<div>'
                                                            + '           <p>' + q_no + '.)</p>'
                                                            + '           <div class="' + q_no + 'qtext mce-content-body "></div>'
                                                            + '           <textarea class="form-control" name="2answer"></textarea>'
                                                            + '       </div>';
                                                    $("#preview").append(html);
                                                    var qtext = q.find("[id$='textarea_ifr']").contents().find("html").html();
                                                    $("." + q_no + "qtext").append(qtext);
                                                    $("." + q_no + "qtext").find("link").remove();
                                                }
                                            });

                                        }

                                        function checkText(t) {
                                            var text = $(t).val();
                                            if (text.indexOf(",") > 0) {
                                                alert("can not use comma in question.");
                                                $(t).focus();
                                            }
                                            $.each($(t).parent().siblings("div").find("input[name$='ctext']"), function() {
                                                console.log($(this).val());
                                                if ($(this).val() == text && $(this).val() != '' && text != '') {
                                                    alert("Your choice is duplicate.");
                                                    $(t).focus();
                                                }
                                            });
                                        }

                                        function checkFile(t) {
                                            var ext = $(t).val().split('.').pop().toLowerCase();
                                            if ($.inArray(ext, ['xls', 'xlsx', 'doc', 'docx', 'jpg', 'jpeg', 'ppt', 'pptx', 'png', 'pdf', 'zip', 'rar']) == -1) {
                                                alert("Invalid file type");
                                                $(t).val("");
                                            }

                                            var amfile = $("#amfile");
//                                            console.log(amfile);
//                                            console.log(amfile[0].files[0].size);
                                            if (amfile[0].files[0].size > 5242880) { // 10 MB (this size is in bytes)
                                                alert("This file is larger tha 5 MB");
                                                $(t).val("");
                                            }
                                        }

                                        function checkRequire(t) {
                                            var name = $(t).attr("name");
                                            console.log(name);
                                            var requiredCheckboxes = $(':checkbox[name="' + name + '"][required]');
                                            console.log(requiredCheckboxes);
                                            requiredCheckboxes.change(function() {
                                                if (requiredCheckboxes.is(':checked')) {
                                                    requiredCheckboxes.removeAttr('required');
                                                } else {
                                                    requiredCheckboxes.attr('required', 'required');
                                                }
                                            });
                                        }

                                        function checkingForm() {
                                            var type = $("#AmType").val();
                                            if (type == "file") {
                                                if ($("#uploadAmFile input").val() == "") {
                                                    alert("please select your assignment file");
                                                    $(".prev").trigger("click");
                                                    $("#uploadAmFile input").focus();
                                                    return false;
                                                } else {
                                                    var btn = $(".submit");
                                                    btn.addClass("disabled");
                                                    btn.text("Creating..");
                                                    return true;
                                                }
                                            } else {
                                                var res = true;
                                                var btn = $(".submit");
                                                btn.addClass("disabled");
                                                btn.text("Creating..");
                                                $(".amQuestion").find(".explain iframe[id$='textarea_ifr']").each(function() {
                                                    var contents = $(this).contents().find("body").html();
                                                    if (contents == '<p><br data-mce-bogus="1"></p>') {
                                                        alert("Some of explanatin question are empty please recheck again.");
                                                        res = false;
                                                    }
                                                });

                                                return res;
                                            }
                                        }
        </script>
    </body>
</html>
