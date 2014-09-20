
<style>
    #openCodeBox{
        text-align: center;
    }

    #openCodeBtn{
        cursor: pointer;
        padding: 10px;
    }

    #openCodeBtn:hover{
        font-weight:  bold;
    }
    
    #CourseDetail{
        display: none;
    }
    
</style>
<script type="text/javascript" src="js/jquery.qrcode-0.8.0.min.js"></script>
<script>
    $(function() {

        var coursecode = '${ac.courseList.get(cId).course.course_code}';
        var courselink = 'http://localhost:8084/TheAssignment/linkjoin?course_code='+'${ac.courseList.get(cId).course.course_code}';
        $("#coursecode").val(coursecode);
        $("#courselink").val(courselink);
        $(".qrcode").qrcode({
            size: 100,
            background: 'white',
            text: '${ac.courseList.get(cId).course.course_link}'
        });
        
        $("#openCodeBtn").click(function() {
            $("#CourseDetail").slideToggle();
            var spanClass = $(this).find("span").attr("class");
            if (spanClass == "glyphicon glyphicon-chevron-down") {
                $(this).find("span").removeClass(" glyphicon-chevron-down").addClass("glyphicon-chevron-up");
            } else {
                $(this).find("span").removeClass(" glyphicon-chevron-up").addClass("glyphicon-chevron-down");
            }
        });
        $("#editcourse").click(function() {
            var coursenameEl = $("#coursename");
            var name = $.trim(coursenameEl.text());
            var html = '<form action="renameCourse" method="post"><input type="text" value="' + name + '" name="name"/></form>';
            coursenameEl.html(html);
        });

        $("#deletecourse").click(function() {
            if (confirm('All data relate this course will be delete, are you sure?')) {
                location.href = "deleteCourse";
            }
        });
    });
</script>
<c:choose> 
    <c:when test="${ac.courseList.get(cId).role eq 'ST'}">
        <div><h3>${ac.courseList.get(cId).course.name}</h3></div>
    </c:when>
    <c:otherwise>
        <div class="well well-sm">
            <div class="row" style="font-size:24px; " >
                <div id="coursename" class="col-md-11">
                    ${ac.courseList.get(cId).course.name}
                </div> 
                <div class="dropdown pull-right col-md-1">
                    <a data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-cog"></span></a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                        <li><a id="editcourse">Edit course name</a></li>
                        <li><a id="deletecourse">Delete this course</a></li>
                    </ul>
                </div>
            </div>
            <hr>
            <div class="row" style="text-align: center;" id="CourseDetail">
                <div class="col-md-4"><h4>Course Code</h4><input type="text" readonly="yes" id="coursecode" value=""></div>
                <div class="col-md-4"><h4>Course link</h4><input type="text" readonly="yes" id="courselink" value=""></div>
                <div class="col-md-4 qrcode" ></div>
            </div>
            <div id="openCodeBox"><span id="openCodeBtn">See your course code <span class="glyphicon glyphicon-chevron-down"></span></span></div>
        </div>
    </c:otherwise>
</c:choose>