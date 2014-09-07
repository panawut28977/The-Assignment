<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style> 
    #AllStudentScore_wrapper{
        margin-top: 20px;
    }
</style>
<c:choose> 
    <c:when test="${ac.courseList.get(cId).role eq 'ST'}">
        <div style="text-align: center;margin-top:20px ">
            <div class="col-md-4"><h4>${total_sent_am}<br> Sent</h4></div>
            <div class="col-md-4"><h4>${total_score}/${fully_mark} <br>Scores</h4></div>
            <div class="col-md-4"><h4>${leftover_am} <br> Leftovers</h4></div>
        </div>
        <hr style="clear:both">
        <table class="table"  id="AllUserScore">
            <thead>
                <tr>
                    <td><b>Assignment</b></td>
                    <td><b>Scores</b></td>
                    <td><b>Lasted sent</b></td>
                    <td><b>Work on</b></td>
                </tr>
            </thead>
            <tbody>
                <c:forEach  items="${ac.courseList.get(cId).course.assignment}" var="a">
                    <tr>
                        <td>${a.name}</td>
                        <c:choose>
                            <c:when test="${stf.get(a.am_id) ne null and stf.get(a.am_id).lasted_send_date ne null}">
                                <td>
                                    ${stf.get(a.am_id).score}
                                    /${a.fully_mark}</td>
                                <td><b>
                                    <c:set value="${cf:lastedSentStatus(stf.get(a.am_id).lasted_send_date, a)}" var="status"/>
                                    <c:choose>
                                        <c:when test="${status eq 'late'}">
                                            <span class="text-danger">Late</span>
                                        </c:when>
                                        <c:when test="${status eq 'ontime'}">
                                            <span class="text-success">On time</span>
                                        </c:when>
                                        <c:when test="${status eq 'hurryup'}">
                                            <span class="text-warning">Hurry up!</span>
                                        </c:when>
                                        <c:when test="${status eq 'sent'}">
                                            <span class="text-muted">Sent <span class="glyphicon glyphicon-check"></span></span>
                                            </c:when>
                                            </c:choose></b>
                                </td>
                            </c:when>
                            <c:when test="${stow.get(a.am_id) ne null and stow.get(a.am_id).lasted_send_date ne null}">
                                <td>    
                                    ${stow.get(a.am_id).score}
                                    /${a.fully_mark}</td>
                                <td><b>
                                    <c:set value="${cf:lastedSentStatus(stow.get(a.am_id).lasted_send_date, a)}" var="status"/>
                                    <c:choose>
                                        <c:when test="${status eq 'late'}">
                                            <span class="text-danger">Late</span>
                                        </c:when>
                                        <c:when test="${status eq 'ontime'}">
                                            <span class="text-success">On time</span>
                                        </c:when>
                                        <c:when test="${status eq 'hurryup'}">
                                            <span class="text-warning">Hurry up!</span>
                                        </c:when>
                                        <c:when test="${status eq 'sent'}">
                                            <span class="text-muted">Sent <span class="glyphicon glyphicon-check"></span></span>
                                            </c:when>
                                            </c:choose></b>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td>0.0 /${a.fully_mark}</td>
                                <td><b> - </b></td>
                            </c:otherwise>
                        </c:choose>
                        <td>${a.ass_type}</td>
                    </tr>
                </c:forEach>
                <!--                <tr>
                                    <td>Assignment# 1</td>
                                    <td>5/10</td>
                                </tr>
                                <tr>
                                    <td>Assignment# 2</td>
                                    <td>7/10</td>
                                </tr>
                                <tr>
                                    <td>Assignment# 3</td>
                                    <td>9/10</td>
                                </tr> 
                                <tr>
                                    <td>Assignment# 4</td>
                                    <td>5/5</td>
                                </tr>-->
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
                    <th>(10) <abbr title="งานที่ 1 เขียนโค้ดจาว่าซะ">Assignment# 1</abbr></th>
                    <th>(10) <abbr title="งานที่ 2 เตรียมโปรเจคเว้ยย">Assignment# 2</abbr></th>
                    <th>(5) <abbr title="งานที่ 3 งานนี้งานดีต้องทำ">Assignment# 3</abbr></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Panawut Ittitananun</td>
                    <td>10</td>
                    <td>10</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>Thanakit Mahamutjinda</td>
                    <td>7</td>
                    <td>8</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>Nitiwit Wungwiwatna</td>
                    <td>9</td>
                    <td>9</td>
                    <td>3</td>
                </tr> 
                <tr>
                    <td>Thanapan Suwankanit</td>
                    <td>7</td>
                    <td>8</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>Ghislaine Weatherholtz </td>
                    <td>7</td>
                    <td>10</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>Steven Gerrard</td>
                    <td>10</td>
                    <td>10</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>Luis Suarez</td>
                    <td>7</td>
                    <td>8</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>Filipe Coutinho</td>
                    <td>9</td>
                    <td>9</td>
                    <td>3</td>
                </tr> 
                <tr>
                    <td>Kolo Toure</td>
                    <td>7</td>
                    <td>8</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>Charlette Lemon</td>
                    <td>7</td>
                    <td>10</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>Marcy Mathis</td>
                    <td>10</td>
                    <td>10</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>Rheba Leto</td>
                    <td>7</td>
                    <td>8</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>Eric Stancil </td>
                    <td>9</td>
                    <td>9</td>
                    <td>3</td>
                </tr> 
                <tr>
                    <td>Stevie Dorn</td>
                    <td>7</td>
                    <td>8</td>
                    <td>5</td>
                </tr> 
                <tr>
                    <td>In Borth</td>
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
            var aTable = $('#AllUserScore').dataTable({
        /* Disable initial sort */
        "aaSorting": []
        });
    $("#AllStudentScore").dataTable();
    });
</script>