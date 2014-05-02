<c:choose>
    <c:when test="${sessionScope.accType eq 'st'}">
        <div><h3>INT202 Software Development Process II </h3></div>
    </c:when>
    <c:otherwise>
        <div class="well well-sm">
            <h3 >INT202 Software Development Process II <a class="pull-right"><span class="glyphicon glyphicon-cog"></span></a></h3>
            <hr>
            <div class="row" style="text-align: center;" id="CourseDetail">
                <div class="col-md-4"><h4>Course Code</h4><input type="text" readonly="yes" value="6zhjr8"></div>
                <div class="col-md-4"><h4>Course link</h4><input type="text" readonly="yes" value="https://ta.do/j/6zhjr8"></div>
                <div class="col-md-4"><a href="#"><img width="108" src="http://chart.apis.google.com/chart?chs=200x200&amp;cht=qr&amp;chld=|1&amp;chl=6zhjr8" alt="QR Code" /></a></div>
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
    });
</script>