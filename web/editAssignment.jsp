<%-- 
    Document   : editAssignment
    Created on : Aug 12, 2014, 10:56:04 AM
    Author     : JenoVa
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/functions.tld" prefix="cf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="META-INF/page/include_css.jsp" %>
        <link href="css/bootstrap-datetimepicker.min.css"  rel="stylesheet">
        <link href="module/easyWizard/css/jquery.snippet.min.css"  rel="stylesheet">
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
        <title>Edit Assignment</title>
    </head>
    <body>
        <%@include file="META-INF/page/header_bar.jsp"%>
        <div class="container well">
            <div class="row">
                <form method="post" action="" class="form-horizontal" enctype="multipart/form-data">
                    <div class="col-md-10 col-md-offset-1" id="CreateAmOnweb">
                        <input type="text" name="title_assignment_onweb" class="form-control" placeholder="Assignment Title" value="${a.title_assignment_onweb}">
                        <br>
                        <p id="AmDescription"></p>
                        <div class="amQuestion" id="sortable">
                            <c:set value="1" var="seqno" />
                            <c:set value="0" var="used_id" />
                            ${a.questionList}
                            <c:forEach  items="${a.questionList}" var="q">
                                <c:choose>
                                    <c:when test="${q.q_type eq 'multiple_choice'}">
                                        <div class="multipleChoice">
                                            <hr>
                                            <input type="hidden" name="seqno" value="${seqno}"/>
                                            <div class="q_no">
                                                <span class="label label-default">${q.q_no}</span> 
                                                <input type="hidden" name="${seqno}q_no" value="${q.q_no}"/>
                                                <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>
                                            </div>
                                            <div class="form-group">
                                                <label  class="col-md-3 control-label">Question Text</label>
                                                <div class="col-md-9">
                                                    <input type="text" class="form-control" name="${seqno}qtext" required="yes" value="${q.q_text}" >
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">One or multiple answers?</label>
                                                <div class="col-md-5">
                                                    <select class="form-control" id="multiple_type" name="${seqno}qcategory">
                                                        <option value="one" <c:if test="${q.q_category eq 'one'}">selected="yes"</c:if> >One answer only</option>
                                                        <option value="multiple"  <c:if test="${q.q_category eq 'multiple'}">selected="yes"</c:if>>Multiple choice allowed</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">Choice <br><span class="text-danger">(Don\'t forget to select answer)</span></label>
                                                    <div class="col-md-8 c_list">
                                                        <div class="choice-group form-inline">
                                                        <c:set var="clist" value="${fn:substring(q.q_choice_list, 1, q.q_choice_list.length()-1)}"/>
                                                        <c:set var="anslist" value="${fn:substring(q.q_answer_list, 1, q.q_answer_list.length()-1)}"/>
                                                        <c:set var="choicesp" value="${fn:split(clist, ', ')}" />
                                                        <c:forEach items="${choicesp}" var="choice">
                                                            <c:choose>
                                                                <c:when test="${q.q_category eq 'one'}">
                                                                    <div><br/><input <c:if test="${cf:containsAns(anslist,choice)}">selected="yes"</c:if> type="radio" onClick="mark(this)" name="${seqno}c" value="${choice}"> <input type="text" name="${seqno}ctext" class="form-control" onkeyup="addToC(this)" value="${choice}"></div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                    <div><br/><input <c:if test="${cf:containsAns(anslist,choice)}">checked="yes"</c:if> type="checkbox" onClick="mark(this)" name="${seqno}c" value="${choice}"> <input type="text" name="${seqno}ctext" class="form-control" onkeyup="addToC(this)" value="${choice}"></div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
    <!--                                                        <div><input type="radio" onClick="mark(this)" name="${seqno}c" value=""> <input type="text" name="${seqno}ctext" class="form-control" onkeyup="addToC(this)"></div>-->
                                                    </div>
                                                    <br>
                                                    <a onclick="appendChoice(this)">Add other</a>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Score</label>
                                                <div class="col-md-2">
                                                    <input type="number" min="0" step="any" class="form-control" name="${seqno}score" required="yes" value="${q.q_score}" >
                                                </div>
                                            </div>
                                            <input type="hidden" value="multiple_choice" name="${seqno}q_type">
                                        </div>
                                        <c:set value="${seqno+1}" var="seqno" />
                                    </c:when>
                                    <c:when test="${q.q_type eq 'explain'}">
                                        <div class="explain">
                                            <hr>
                                            <input type="hidden" name="seqno" value="${seqno}"/>
                                            <div class="q_no">
                                                <span class="label label-default">${q.q_no}</span> 
                                                <input type="hidden" name="${seqno}q_no" value="${q.q_no}"/>
                                                <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Question</label>
                                                <div class="col-md-9">
                                                    <textarea class="form-control explain_q_text" name="${seqno}qtext" required="yes">${q.q_text}</textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label  class="col-md-3 control-label">Answer</label>
                                                <div class="col-md-9">
                                                    <textarea class="form-control" name="${seqno}qanswer">${q.q_keyword_check}</textarea>
                                                </div>
                                            </div>
                                            <input type="hidden" value="explain" name="${seqno}q_type">
                                        </div>
                                        <c:set value="${seqno+1}" var="seqno" />
                                    </c:when>
                                    <c:when test="${q.q_type eq 'matchWord'}">
                                        <c:if test="${q.q_id != used_id}">
                                            <div class="matchWord">
                                                <hr>
                                                <input type="hidden" name="seqno" value="${seqno}"/>
                                                <div class="q_no">
                                                    <span class="label label-default">${q.q_no}</span>
                                                    <input type="hidden" name="${seqno}q_no" value="${q.q_no}"/>
                                                    <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>
                                                </div>
                                                <div class="form-group">
                                                    <label  class = "col-md-3 control-label" > Question Text </label>
                                                    <div class = "col-md-9">
                                                        <input type = "text" class = "form-control" name="${seqno}qtext" required="yes" value="${q.q_title}">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label  class="col-md-3 control-label">How Many Pair?</label>
                                                    <div class="col-md-2">
                                                        <c:set value="0" var="total_pair" />
                                                        <c:forEach items="${a.questionList}" var="b">
                                                            <c:if test="${q.q_id == b.q_id}">
                                                                <c:set value="${total_pair+1}" var="total_pair" />
                                                            </c:if>
                                                        </c:forEach>
                                                        <input type="number" id="total_pair" min="1" class="form-control" value="${total_pair}" >
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-offset-3 col-md-9 matchWord_q_list">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <b>Question Text</b>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <b>Answer</b>
                                                            </div>
                                                            <div class="col-md-2">
                                                                <b>Score</b>
                                                            </div>
                                                        </div>
                                                        <c:set value="3" var="total_pair" />
                                                        <c:forEach items="${a.questionList}" var="blank">
                                                            <c:if test="${q.q_id == blank.q_id}">
                                                                <div class="row">
                                                                    <div class="col-md-4">
                                                                        <input type="text" class="form-control" name="${seqno}match_text" value="${blank.q_text}">
                                                                    </div>
                                                                    <div class="col-md-4">
                                                                        <input type="text" class="form-control" name="${seqno}match_ans" value="${blank.q_answer}">
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <input type="number" min="0" step="any" class="form-control" name="${seqno}m_score" value="${blank.q_score}">
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                                <input type="hidden" value="matchWord"  name="${seqno}q_type">
                                            </div>
                                            <c:set value="${q.q_id}" var="used_id" />
                                            <c:set value="${seqno+1}" var="seqno" />
                                        </c:if>
                                    </c:when>
                                    <c:when test="${q.q_type eq 'fillBlank'}">
                                        <c:if test="${q.q_id != used_id}">
                                            <div class="fillBlank">
                                                <hr>
                                                <input type="hidden" name="seqno" value="${seqno}"/>
                                                <div class="q_no">
                                                    <span class="label label-default">${q.q_no}</span>
                                                    <input type="hidden" name="${seqno}q_no" value="${q.q_no}"/>
                                                    <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>
                                                </div>
                                                <div class="form-group">
                                                    <label  class="col-md-3 control-label">Question Text</label>
                                                    <div class="col-md-9">
                                                        <textarea class="form-control fillInBlankBox" name="${seqno}qtext" required="yes" readonly="yes">${q.q_text}</textarea>
                                                        <br>
                                                        <a class=" btn btn-default" onclick="addAnswer(this)">Add Answer</a>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-md-offset-3 col-md-9 ansList">
                                                        <c:forEach  items="${a.questionList}" var="fill">
                                                            <c:if test="${q.q_id == fill.q_id}">
                                                                <div class="row a_group">
                                                                    <div class="col-md-4">
                                                                        <input type="text" class="form-control" value="${fill.answer}" readonly="yes" name="${seqno}qanswer">
                                                                    </div>
                                                                    <div class="col-md-3">
                                                                        <input type="number" class="form-control" placeholder="score" name="${seqno}score" required="yes" value="${fill.score}">
                                                                    </div>
                                                                    <input type="hidden" value="${fill.q_start_index}" name="${seqno}startIndex">
                                                                    <input type="hidden" value="${fill.q_end_index}" name="${seqno}endIndex">
                                                                    <a onclick="remove_ans_fillInBlank(this)">
                                                                        <span class="glyphicon glyphicon-trash"></span>
                                                                    </a>
                                                                    <div>
                                                                    </div>
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                                <input type="hidden" value="fillBlank" name="${seqno}q_type">
                                            </div>
                                            <c:set value="${q.q_id}" var="used_id" />
                                            <c:set value="${seqno+1}" var="seqno" />
                                        </c:if>
                                    </c:when>
                                    <c:when test="${q.q_type eq 'tfQuestion'}">
                                        <div class="tfQuestion">
                                            <hr>
                                            <input type="hidden" name="seqno" value="${seqno}"/>
                                            <div class="q_no">
                                                <span class="label label-default">${q.q_no}</span> 
                                                <input type="hidden" name="${seqno}q_no" value="${q.q_no}"/>
                                                <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>
                                            </div>
                                            <div class="form-group">
                                                <label  class="col-md-3 control-label">Question Text</label>
                                                <div class="col-md-9">
                                                    <input type="text" class="form-control" name="${seqno}qtext" required="yes" value="${q.q_text}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-3 control-label">Choice <br><span class="text-danger">(Don\'t forget to select answer)</span></label>
                                                <div class="col-md-8">
                                                    <input type="radio" name="${seqno}c_ans" value="true" <c:if test="${q.q_answer_list eq 'true'}">checked="yes"</c:if>> True
                                                    <input type="radio" name="${seqno}c_ans" value="false" <c:if test="${q.q_answer_list eq 'false'}">checked="yes"</c:if>> False
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">Score</label>
                                                    <div class="col-md-2">
                                                        <input type="number" min="0" step="any" class="form-control" name="${seqno}score" required="yes" value="${q.q_score}">
                                                </div>
                                            </div>
                                            <input type="hidden" value="tf" name="${seqno}qcategory" />
                                            <input type="hidden" value="tfQuestion" name="${seqno}q_type" />
                                        </div>
                                        <c:set value="${seqno+1}" var="seqno" />
                                    </c:when>
                                </c:choose>
                            </c:forEach>
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
                </form>
            </div>
        </div>
        <script src="js/bootstrap-datetimepicker.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script>
                                $(document).ready(function() {
                                    $("#sortable").sortable({
                                        revert: true,
                                        update: function() {
                                            var new_seq = 1;
                                            var new_Qno = 1;
                                            var old_seq = 0;
                                            var old_name = 0;
                                            var new_name = 0;
                                            $("#sortable >div").each(function() {
                                                old_seq = $(this).find("input[name='seqno']").val();
                                                $(this).find("input[name='seqno']").val(new_seq);
                                                $(this).find("[name^='" + old_seq + "']").each(function() {
                                                    old_name = $(this).attr("name");
                                                    new_name = old_name.replace(old_seq, new_seq);
                                                    console.log(new_name);
                                                    $(this).attr("name", new_name);
                                                });
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
                                    var monthNames = ["January", "February", "March", "April", "May", "June",
                                        "July", "August", "September", "October", "November", "December"];
                                    var d = new Date();
                                    $('#due_date input').val(d.getFullYear() + "-" + monthNames[d.getMonth()] + "-" + ('0' + d.getDate()).slice(-2));
                                    $('#due_date input[name="due_date"]').val(d.getFullYear() + "-" + ('0' + (d.getMonth() + 1)).slice(-2) + "-" + ('0' + d.getDate()).slice(-2));
                                    $('.form_datetime').datetimepicker({
                                        format: 'yyyy-MM-dd',
                                        weekStart: 1,
                                        todayBtn: 1,
                                        autoclose: 1,
                                        todayHighlight: 1,
                                        startView: 2,
                                        forceParse: 0,
                                        startDate: new Date(),
                                        minView: 2
                                    });
                                    $("#myWizard").submit(function() {
                                        var type = $("#AmType").val();
                                        if (type == "file") {
                                            if ($("#uploadAmFile input").val() == "") {
                                                alert("please select your assignment file");
                                                $(".prev").trigger("click");
                                                $("#uploadAmFile input").focus();
                                                return false;
                                            }
                                        }
                                    });
                                    $('#groupwork').click(function() {
                                        $('#inputpepole').removeAttr("disabled");
                                    });
                                    $('#individual').click(function() {
                                        $('#inputpepole').attr("disabled", "yes");
                                    });
                                    $('#inputpepole').change(function() {
                                        $('#groupwork').val($(this).val());
                                    });
                                    $("#AmType").change(function() {
                                        if ($(this).val() == "file") {
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
                                    $(document).on("change", "#total_pair", function() {
                                        var seq_of_choice = $(this).parent().parent().parent().find("[name='seqno']").val();
                                        var matchWord_box = '<div class="row"><div class="col-md-4"><b>Question Text</b></div><div class="col-md-4"><b>Answer</b></div><div class="col-md-2"><b>Score</b></div></div>';
                                        for (var i = 0; i < $(this).val(); i++) {
                                            matchWord_box += '<div class="row"><div class="col-md-4"><input type="text" class="form-control" name="' + seq_of_choice + 'match_text"></div><div class="col-md-4"><input type="text" class="form-control" name="' + seq_of_choice + 'match_ans"></div><div class="col-md-2"><input type="number" min="0" step="any" class="form-control" name="' + seq_of_choice + 'm_score"></div></div>';
                                        }
                                        $(this).parent().parent().parent(".matchWord").find(".matchWord_q_list").html(matchWord_box);
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
                                    var seq_of_choice = $(t).parent().parent().parent().find("[name='seqno']").val();
                                    var ansbox = '<div class="row a_group"><div class="col-md-4"><input type="text" class="form-control" value="' + ans + '" readonly="yes" name="' + seq_of_choice + 'qanswer"></div><div class="col-md-3"><input type="number" class="form-control" placeholder="score" name="' + seq_of_choice + 'score" required="yes"></div><input type="hidden" value="' + startIndex + '" name="' + seq_of_choice + 'startIndex"><input type="hidden" value="' + endIndex + '" name="' + seq_of_choice + 'endIndex"><a onclick="remove_ans_fillInBlank(this)"><span class="glyphicon glyphicon-trash"></span></a><div>';
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
                                            + '                      <option value="multiple">Multiple choice allowed</option>'
                                            + '                  </select>'
                                            + '              </div>'
                                            + '          </div>'
                                            + '          <div class="form-group">'
                                            + '              <label class="col-md-3 control-label">Choice <br><span class="text-danger">(Don\'t forget to select answer)</span></label>'
                                            + '              <div class="col-md-8 c_list">'
                                            + '                  <div class="choice-group form-inline">'
                                            + '                      <div><input type="radio" onClick="mark(this)" name="' + seqno + 'c" value=""> <input type="text" name="' + seqno + 'ctext" class="form-control" onkeyup="addToC(this)"></div>'
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
                                                + '            <input type="radio" name="' + seqno + 'c_ans" value="true" selected="yes"> True'
                                                + '            <input type="radio" name="' + seqno + 'c_ans" value="false"> False'
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
                                                + '     <input type="hidden" value="matchWord"  name="' + seqno + 'q_type">'
                                                + ' </div>';
                                    } else if (amCurrentType == 'fill') {
                                        question = '<div class="fillBlank">'
                                                + '    <hr>'
                                                + '          <input type="hidden" name="seqno" value="' + seqno + '"/>'
                                                + '    <div class="q_no">'
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
                                                + '        <span class="label label-default">' + total_q + '</span> '
                                                + '          <input type="hidden" name="' + seqno + 'q_no" value="' + total_q + '"/>'
                                                + '        <a onclick="remove_q(this)" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a>'
                                                + '    </div>'
                                                + '    <div class="form-group">'
                                                + '        <label class="col-md-3 control-label">Question</label>'
                                                + '        <div class="col-md-9">'
                                                + '            <textarea class="form-control explain_q_text" name="' + seqno + 'qtext" required="yes"></textarea>'
                                                + '        </div>'
                                                + '    </div>'
                                                + '    <div class="form-group">'
                                                + '        <label  class="col-md-3 control-label">Answer</label>'
                                                + '        <div class="col-md-9">'
                                                + '            <textarea class="form-control" name="' + seqno + 'qanswer"></textarea>'
                                                + '        </div>'
                                                + '    </div>'
                                                + '    <input type="hidden" value="explain" name="' + seqno + 'q_type">'
                                                + '</div>';
                                    }
                                    total_q++;
                                    seqno++;
                                    $(".amQuestion").append(question);
                                }

                                function appendChoice(t) {
                                    var type = $(t).parent().parent().parent().find('#multiple_type').val();
                                    var seq_of_choice = $(t).parent().parent().parent().find("[name='seqno']").val();
                                    var inputC = '';
                                    if (type == "one") {
                                        inputC = '<div><br><input type="radio" name="' + seq_of_choice + 'c" onClick="mark(this)" value=""> <input type="text" name="' + seq_of_choice + 'ctext" class="form-control" onkeyup="addToC(this)" required="yes"> <a onclick="removeC(this)"><span class="glyphicon glyphicon-remove"></span></a></div>';
                                    } else {
                                        inputC = '<div><br><input type="checkbox" name="' + seq_of_choice + 'c" onClick="mark(this)" value=""> <input type="text" name="' + seq_of_choice + 'ctext" class="form-control" onkeyup="addToC(this)" required="yes"> <a onclick="removeC(this)"><span class="glyphicon glyphicon-remove"></span></a></div>';
                                    }
                                    $(t).parent().find('.choice-group').append(inputC);
                                }

                                $(document).on("change", "#multiple_type", function() {
                                    var seq_of_choice = $(this).parent().parent().parent().find("[name='seqno']").val();
                                    var html = '';
                                    if ($(this).val() == "one") {
                                        html = '<div class="choice-group form-inline"><div><input type="radio" name="' + seq_of_choice + 'c"> <input type="text" class="form-control" name="' + seq_of_choice + 'ctext"></div></div><br><a onclick="appendChoice(this)">Add other</a>';
                                    } else {
                                        html = '<div class="choice-group form-inline"><div><input type="checkbox" name="' + seq_of_choice + 'c"> <input type="text" class="form-control" name="' + seq_of_choice + 'ctext"></div></div><br><a onclick="appendChoice(this)">Add other</a>';
                                    }
                                    $(this).parent().parent().parent(".multipleChoice").find(".c_list").html(html);
                                });
                                function addTitle() {
                                    var titleBox = '<div class="row"><hr><input type="hidden" name="seqno" value="' + seqno + '"/><div class="col-md-8"><input type="text" class="form-control" placeholder="Instruction" name="' + seqno + 'instruction" required="yes" ></div><a onclick="remove_title(this)"  style="vertical-align: -webkit-baseline-middle"><span class="glyphicon glyphicon-trash"></span></a><input type="hidden" value="instruction" name="' + seqno + 'q_type"></div>';
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
                                }

                                function remove_title(t) {
                                    seqno--;
                                    $(t).parent().remove();
                                }
        </script>
    </body>
</html>
