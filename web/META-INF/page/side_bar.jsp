<div class="col-md-3">
    <div class="row userbox">
        <img class="col-md-4" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
        <div class="col-md-8">
            <h4>Panawut Ittitananun</h4>
        </div>
        <div class="statusbox " style="clear: both;background-color: #F8F8F8;padding-top: 20px;" >
            <small>Assignment Status</small><br>
            <div onclick="view_assignment_by_status('Late')" class="col-md-4" style="background-color: #e74c3c;cursor: pointer;"><span>20</span><br><span>Late</span></div>
            <div onclick="view_assignment_by_status('Hurry up')" class="col-md-4" style="background-color: #f1c40f;cursor: pointer;"><span>5</span><br><span>hurry up</span></div>
            <div onclick="view_assignment_by_status('on time')" class="col-md-4" style="background-color: #40d47e;cursor: pointer;"><span>1</span><br><span>on time</span></div>
        </div>
    </div>
    <div class="row" style="margin-top: 30px">
        <div class="panel-group" id="accordion">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion" >
                            Course <a class="glyphicon glyphicon-plus-sign pull-right a_button"  data-toggle="modal" data-target="#join_course" title="join course" ></a>
                        </a>
                    </h4>
                </div>
                <div  class="panel-collapse collapse in">
                    <ul class="list-group" style="margin-bottom: 0;">
                        <li class="list-group-item usepointer" onclick="load_course(1)"><span class="badge">4</span>INT103 Office</li>
                        <li class="list-group-item usepointer" onclick="load_course(1)"><span class="badge">5</span>INT202 Software Development Process II</li>
                        <li class="list-group-item usepointer" onclick="load_course(1)"><span class="badge">9</span>Morbi leo risus</li>
                        <li class="list-group-item usepointer" onclick="load_course(1)"><span class="badge">10</span>Porta ac consectetur ac</li>
                        <li class="list-group-item usepointer" onclick="load_course(1)"><span class="badge">13</span>Vestibulum at eros</li>
                    </ul>
                </div>
            </div>
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
<script>
    function view_assignment_by_status(status){
        location.href="home.jsp?tab=AllAssignment&st="+status;
    }
    
    function load_course(course_id){
        location.href="course.jsp?course_id="+course_id;
    }
</script>