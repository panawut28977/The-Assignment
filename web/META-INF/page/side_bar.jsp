<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${param.cId != null && param.Cid != ''}"><c:set var="cId" value="${param.cId}" scope="session" /></c:if> 
<div class="col-md-3">
    <div class="row userbox">
        <img class="col-md-4" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
        <div class="col-md-8">
            <h4>Panawut Ittitananun</h4>
        </div>
        <div class="statusbox " style="clear: both;background-color: #F8F8F8;padding-top: 20px;" >
            <small><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assignment Status</b></small><br>
            <div onclick="view_assignment_by_status('Late')" class="col-md-4" style="background-color: #e74c3c;cursor: pointer;"><span>1</span><br><span>Late</span></div>
            <div onclick="view_assignment_by_status('Hurry up')" class="col-md-4" style="background-color: #f1c40f;cursor: pointer;"><span>1</span><br><span>hurry up</span></div>
            <div onclick="view_assignment_by_status('on time')" class="col-md-4" style="background-color: #40d47e;cursor: pointer;"><span>3</span><br><span>on time</span></div>
        </div>
    </div>
    <div class="row" style="margin-top: 30px">
        <div  class="list-group">
            <span disabled="yes" class="list-group-item">
                Course 
                <c:choose>
                    <c:when test="${sessionScope.accType eq 'st'}">
                        <span class="glyphicon glyphicon-plus-sign pull-right a_button"  data-toggle="modal" data-target="#join_course" title="join course" ></span>
                    </c:when>
                    <c:otherwise>
                        <span class="dropdown pull-right"> 
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-plus-sign a_button"></span></a>
                            <ul class="dropdown-menu">
                                <li><a  data-toggle="modal" data-target="#create_course" title="create course">Create course</a></li>
                                <li><a  data-toggle="modal" data-target="#join_course" title="join course">Join course</a></li>
                            </ul>
                        </span>
                    </c:otherwise>
                </c:choose>
            </span>
            <a id="1" onclick="load_course(1)" class="list-group-item usepointer"><span class="badge">3</span>INT103 Office</a>
            <a id="2" onclick="load_course(2)" class="list-group-item usepointer"><span class="badge">3</span>INT202 Software Development Process II</a>
            <a id="3" onclick="load_course(3)" class="list-group-item usepointer">Morbi leo risus</a>
            <a id="4" onclick="load_course(4)" class="list-group-item usepointer">Porta ac consectetur ac</a>
            <a id="5" onclick="load_course(5)"  class="list-group-item usepointer">Vestibulum at eros</a>
        </div> 
    </div>
</div>
<div class="modal fade" id="join_course" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Put course code</h4>
            </div>
            <div class="modal-body">
                <input type="text" name="course_code" class="form-control">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">join</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="create_course" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Create course</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="row">
                            <div class="col-md-12">
                                <label>name</label>
                                <input type="text" class="form-control">
                            </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Create</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(function() {
        var courseId = '${sessionScope.cId}';
        if (courseId != "" && courseId != null) {
            $("#" + courseId).addClass("active");
        }
    });

    function view_assignment_by_status(status) {
        location.href = "home.jsp?tab=AllAssignment&st=" + status;
    }

    function load_course(course_id) {
         location.href = "course.jsp?cId="+course_id;
    }
</script>