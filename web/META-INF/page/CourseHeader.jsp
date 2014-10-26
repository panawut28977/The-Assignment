
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript" src="module/zeroclipboard/ZeroClipboard.js"></script>
<script>
    $(function() {
        var coursecode = '${ac.courseList.get(cId).course.course_code}';
        var courselink = 'http://assignment.sit.kmutt.ac.th:8080/linkjoin?course_code=' + '${ac.courseList.get(cId).course.course_code}';
        $("#coursecode").val(coursecode);
        $("#courselink").val(courselink);
        $(".qrcode").qrcode({
            size: 100,
            background: 'white',
            text: 'http://10.4.43.216:8080/linkjoin?course_code=' + '${ac.courseList.get(cId).course.course_code}'
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
            var pass = prompt('Enter your password \n All data relate this course will be delete, are you sure?');
            if (pass != null) {
                $.ajax({
                    type: 'post',
                    url: 'DeleteCourseAuthen',
                    data: {pass: pass},
                    success: function(data) {
                        if (data == "success") {
                            location.href = "deleteCourse";
                        } else {
                            alert("Your password is wrong!");
                        }
                    }
                });
            }
        });

        $("#closecourse").click(function() {
            var text = 'Are you sure to close this course ?\n'
                    + 'If you close, the following user can not use these functions :\n'
                    + '- Teacher \n'
                    + '      Can not create assignment \n'
                    + '- Student \n'
                    + '      Can not send any assignment \n'
                    + '      Can not to join this course \n'
                    + '      Assignment status number will disappear from student\'s dashboard (left side of the student screen)';
            if (confirm(text)) {
                location.href = "CloseCourse";
            }
        });
        $("#opencourse").click(function() {
            var text = 'Course will open and all function will enable.';
            if (confirm(text)) {
                location.href = "OpenCourse";
            }
        });


        ///copy to clipboard
        var client = new ZeroClipboard($("#copycode"));
        var text = $("#coursecode").val();
        client.on("ready", function(readyEvent) {
//            alert( "ZeroClipboard SWF is ready!" );
            client.on('copy', function(event) {
                event.clipboardData.setData('text/plain', text);
            });

            client.on("aftercopy", function(event) {
                // `this` === `client`
                // `event.target` === the element that was clicked
                alert("Copied text to clipboard: " + text);
            });
        });

        var client2 = new ZeroClipboard($("#copylink"));
        var text2 = $("#courselink").val();
        client2.on("ready", function(readyEvent) {
//            alert( "ZeroClipboard SWF is ready!" );
            client2.on('copy', function(event) {
                event.clipboardData.setData('text/plain', text2);
            });

            client2.on("aftercopy", function(event) {
                // `this` === `client`
                // `event.target` === the element that was clicked
                alert("Copied text to clipboard: " + text2);
            });
        });


    });
</script>
<c:choose> 
    <c:when test="${ac.courseList.get(cId).role eq 'ST'}">
        <div>
            <h3>${ac.courseList.get(cId).course.name} 
                <c:if test="${ac.courseList.get(cId).course.status eq 'close'}">
                    <span class="label label-danger" id="closelabel">Close</span>
                </c:if>
            </h3>
        </div>
    </c:when>
    <c:when  test="${ac.courseList.get(cId).role eq 'TH'}">
        <div class="well well-sm">
            <div class="row" style="font-size:24px; " >
                <div class="col-md-11">
                    <span id="coursename">${ac.courseList.get(cId).course.name}</span>  (${ac.courseList.get(cId).course.term}/${ac.courseList.get(cId).course.year})
                    <c:if test="${ac.courseList.get(cId).course.status eq 'close'}">
                        <span class="label label-danger" id="closelabel">Close</span>
                    </c:if>
                </div> 
                <div class="dropdown pull-right col-md-1">
                    <a data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-cog"></span></a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                        <li><a id="editcourse">Edit course name</a></li>
                            <c:choose>
                                <c:when test="${ac.courseList.get(cId).course.status eq 'open'}">
                                <li><a id="closecourse">Close course</a></li>
                                </c:when>
                                <c:when test="${ac.courseList.get(cId).course.status eq 'close'}">
                                <li><a id="opencourse">Open course</a></li>
                                </c:when>
                            </c:choose>
                        <li><a id="deletecourse">Delete this course</a></li>
                    </ul>
                </div>
            </div>
            <hr>
            <div class="row" style="text-align: center;" id="CourseDetail">
                <div class="col-md-3 col-md-offset-1">
                    <h4>Course Code</h4>
                    <div class="input-group">
                        <input type="text" readonly="yes" class="form-control" id="coursecode" value="">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button" id="copycode"><i class="fa fa-files-o"></i></button>
                        </span>
                    </div>

                </div>
                <div class="col-md-4">
                    <h4>Course link</h4>
                    <div class="input-group">
                        <input type="text" readonly="yes" class="form-control" id="courselink" value="">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button" id="copylink"><i class="fa fa-files-o"></i></button>
                        </span>
                    </div>
                </div>
                <div class="col-md-3 qrcode nocircle" ></div>
            </div>
            <div id="openCodeBox"><span id="openCodeBtn">See your course code <span class="glyphicon glyphicon-chevron-down"></span></span></div>
        </div>
    </c:when>
</c:choose>