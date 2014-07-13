<c:choose> 
    <c:when test="${ac.courseList.get(cId).role eq 'ST'}">
        <div><h3>${ac.courseList.get(cId).course.name}</h3></div>
    </c:when>
    <c:otherwise>
        <div class="well well-sm">
            <h3 >${ac.courseList.get(cId).course.name} 
                <div class="dropdown pull-right">
                    <a data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-cog"></span></a>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
                        <li><a>Edit course name</a></li>
                        <li><a>Delete this course</a></li>
                    </ul>
                </div>
            </h3>
            <hr>
            <div class="row" style="text-align: center;" id="CourseDetail">
                <div class="col-md-4"><h4>Course Code</h4><input type="text" readonly="yes" value="${ac.courseList.get(cId).course.course_code}"></div>
                <div class="col-md-4"><h4>Course link</h4><input type="text" readonly="yes" value="${ac.courseList.get(cId).course.course_link}"></div>
                <div class="col-md-4 qrcode" ></div>
            </div>
            <div id="openCodeBox"><span id="openCodeBtn">See your course code <span class="glyphicon glyphicon-chevron-down"></span></span></div>
        </div>
    </c:otherwise>
</c:choose>
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
</style>
<script type="text/javascript" src="js/jquery.qrcode-0.8.0.min.js"></script>
<script>
    $(function() {
        $("#CourseDetail").hide();
        $("#openCodeBtn").click(function() {
            $("#CourseDetail").slideToggle();
            var spanClass = $(this).find("span").attr("class");
            if (spanClass == "glyphicon glyphicon-chevron-down") {
                $(this).find("span").removeClass(" glyphicon-chevron-down").addClass("glyphicon-chevron-up");
            } else {
                $(this).find("span").removeClass(" glyphicon-chevron-up").addClass("glyphicon-chevron-down");
            }
        });
        $(".qrcode").qrcode({
            size: 100,
            background: 'white',
            text: '${ac.courseList.get(cId).course.course_link}'
        });
    });
</script>