<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .statusbox div{
        color: white;
        padding-top: 10px;
        text-align: center;
        min-height: 70px;
        font-weight: bold;
        text-align: center;
    }
</style>
<div class="col-md-3">
    <div class="row userbox">
        <img class="col-md-4 center-block" src="${ac.profile_pic}">
        <div class="col-md-8 " style="text-align: center">
            <h4>${ac.firstname} ${ac.lastname}</h4>
        </div>
        <div class="statusbox " style="clear: both;background-color: #F8F8F8;padding-top: 20px; " >
            <small><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assignment Status</b></small><br>
            <div onclick="view_assignment_by_status('on time')" class="col-md-4" style="background-color: #40d47e;cursor: pointer;"><span>${ontime}</span><br><span>On time</span></div>
            <div onclick="view_assignment_by_status('Hurry up')" class="col-md-4" style="background-color: #f1c40f;cursor: pointer;"><span>${hurry}</span><br><span>Hurry up</span></div>
            <div onclick="view_assignment_by_status('Late')" class="col-md-4" style="background-color: #e74c3c;cursor: pointer;"><span>${late}</span><br><span>Late</span></div>
        </div>
        <div class="statusbox ">
            <div onclick="view_assignment_by_status('sent')" class="col-md-6" style="background-color: #5F8BCA;cursor: pointer;"><span>${sent}</span><br><span>Sent</span></div>
            <div onclick="view_assignment_by_status('miss')" class="col-md-6" style="background-color: #999;cursor: pointer;"><span>${miss}</span><br><span>Miss</span></div>
        </div>
    </div>
    <div class="row" style="margin-top: 30px">
        <div  class="list-group">
            <span disabled="yes" class="list-group-item">
                Course 
                <c:choose>
                    <c:when test="${sessionScope.accType eq 'ST'}">
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
            <c:forEach items="${ac.getCourseList()}" var="c">
                <a id="${c.key}" onclick="load_course(${c.key})" class="list-group-item usepointer <c:if test="${sessionScope.cId==c.key}">active</c:if>">
                     <c:if test="${c.value.role eq 'TH'}"> 
                        <span class="label label-primary">Teacher</span>
                    </c:if>
                    ${c.value.course.name}  (${c.value.course.term}/${c.value.course.year})
                </a>
            </c:forEach>
            <!--            <a id="1" onclick="load_course(1)" class="list-group-item usepointer"><span class="badge">3</span>INT103 Office</a>
                        <a id="2" onclick="load_course(2)" class="list-group-item usepointer"><span class="badge">3</span>INT206 Software Development Process II</a>
                        <a id="3" onclick="load_course(3)" class="list-group-item usepointer"><span class="badge">2</span>LNG103 Academic English</a>
                        <a id="4" onclick="load_course(4)" class="list-group-item usepointer"><span class="badge"></span>INT380 Operation Management</a>
                        <a id="5" onclick="load_course(5)"  class="list-group-item usepointer"><span class="badge">1</span>MTH111 Calculus I</a>-->
        </div> 
    </div>
</div>
<div class="modal fade" id="join_course" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="joinCourseServlet" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Put course code</h4>
                </div>
                <div class="modal-body">
                    <input type="text" name="course_code" class="form-control">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-primary" value="join"/>
                </div>
            </form>
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
            <form method="post" action="CreateCourseSl">
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12">
                            <label>name</label>
                            <input type="text" class="form-control" name="name">
                        </div>
                        <div class="col-md-12" style="margin-top: 20px">
                            <label>Semister</label>
                        </div>
                        <div class="col-md-12">
                            <div class="row">
                                <div class="col-md-2">
                                    <input type="number" min="1" class="form-control" name="term" value="1">
                                </div>
                                <div class="col-md-3">
                                    <input type="number" min="1" class="form-control" name="term-year" readonly="yes" id="term-year">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <input type="submit" class="btn btn-primary" value="Create">
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $(function() {
//        var courseId = '${sessionScope.cId}';
//        if (courseId != "" && courseId != null) {
//            $("#" + courseId).addClass("active");
//        }
        var d = new Date();
        $("#term-year").val(d.getFullYear());
    });

    function view_assignment_by_status(status) {
        location.href = "home.jsp?tab=AllAssignment&st=" + status;
    }

    function load_course(course_id) {
        location.href = "setCourseSession?cId=" + course_id;
    }

</script>