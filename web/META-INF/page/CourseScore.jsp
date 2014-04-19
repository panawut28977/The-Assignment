<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style> 
    #AllStudentScore_wrapper{
        margin-top: 20px;
    }
</style>
<c:choose> 
    <c:when test="${sessionScope.accType eq 'st'}">
        <div style="text-align: center;margin-top:20px ">
            <div class="col-md-4"><h4>5 <br> Sendeds</h4></div>
            <div class="col-md-4"><h4>38/50 <br>Scores</h4></div>
            <div class="col-md-4"><h4>1 <br> Leftovers</h4></div>
        </div>
        <hr style="clear:both">
        <table class="table" style="text-align: center">
            <thead>
                <tr>
                    <td><b>Assignment</b></td>
                    <td><b>Scores</b></td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>งานที่ 1</td>
                    <td>5/10</td>
                </tr>
                <tr>
                    <td>งานที่ 2</td>
                    <td>7/10</td>
                </tr>
                <tr>
                    <td>งานที่ 3</td>
                    <td>9/10</td>
                </tr> 
                <tr>
                    <td>งานที่ 4</td>
                    <td>5/5</td>
                </tr>
            </tbody>
        </table> 
    </c:when>
    <c:otherwise>
        <button class="btn btn-primary" style="margin-top: 20px"><span class="glyphicon glyphicon-export"></span> Export Scoresheet</button>
        <table class="table table-striped" ID="AllStudentScore">
            <thead>
                <tr>
                    <th rowspan="2" style="text-align: center;vertical-align: inherit;"><b>Name</b></th>
                    <th colspan="3" style="text-align: center"><b>Assignment score</b></th>
                </tr>
                <tr>
                    <th>(10) <abbr title="งานที่ 1 เขียนโค้ดจาว่าซะ">งานที่ 1</abbr></th>
                    <th>(10) <abbr title="งานที่ 2 เตรียมโปรเจคเว้ยย">งานที่ 2</abbr></th>
                    <th>(5) <abbr title="งานที่ 3 งานนี้งานดีต้องทำ">งานที่ 3</abbr></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>natus error</td>
                    <td>10</td>
                    <td>10</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>oluptatem accusantium</td>
                    <td>7</td>
                    <td>8</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>denouncing ple</td>
                    <td>9</td>
                    <td>9</td>
                    <td>3</td>
                </tr> 
                <tr>
                    <td>great explorer</td>
                    <td>7</td>
                    <td>8</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>produces no </td>
                    <td>7</td>
                    <td>10</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>natus error</td>
                    <td>10</td>
                    <td>10</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>oluptatem accusantium</td>
                    <td>7</td>
                    <td>8</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>denouncing ple</td>
                    <td>9</td>
                    <td>9</td>
                    <td>3</td>
                </tr> 
                <tr>
                    <td>great explorer</td>
                    <td>7</td>
                    <td>8</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>produces no </td>
                    <td>7</td>
                    <td>10</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>natus error</td>
                    <td>10</td>
                    <td>10</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>oluptatem accusantium</td>
                    <td>7</td>
                    <td>8</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>denouncing ple</td>
                    <td>9</td>
                    <td>9</td>
                    <td>3</td>
                </tr> 
                <tr>
                    <td>great explorer</td>
                    <td>7</td>
                    <td>8</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>produces no </td>
                    <td>7</td>
                    <td>10</td>
                    <td>5</td>
                </tr>

            </tbody>
        </table> 
    </c:otherwise>
</c:choose>
<script>
    $(function() {
        $("#AllStudentScore").dataTable();
    });
</script>
