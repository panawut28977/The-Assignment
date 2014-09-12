<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style> 
    #AllStudentScore_wrapper{
        margin-top: 20px;
    }
    #chart canvas{
        height: auto !important;
    }
    #chart div{
        text-align: center;
    }
</style>
<script src="module/chartjs/Chart.js" ></script>
<c:choose> 
    <c:when test="${ac.courseList.get(cId).role eq 'ST'}">
        <div class="row" id="chart" style="margin-top: 20px" >
            <div  class="col-md-6">
                <canvas  id="sentLeftChart"></canvas>
                <h4 >Sent / Miss / Leftover</h4>
            </div>
            <div  class="col-md-6">
                <canvas id="scoreChart"></canvas>
                <h4>Score (Max score is ${fully_score})</h4>
            </div>
        </div>
        <!--        <div style="text-align: center;margin-top:20px ">
                    <div class="col-md-4"><h4>${total_sent_am}<br> Sent</h4></div>
                    <div class="col-md-4"><h4>${total_score}/${fully_mark} <br>Scores</h4></div>
                    <div class="col-md-4"><h4>${leftover_am} <br> Leftovers</h4></div>
                </div>-->
        <hr style="clear:both">
        <table class="table"  id="AllUserScore">
            <thead>
                <tr>
                    <td><b>Assignment</b></td>
                    <td><b>Scores</b></td>
                    <td><b>Sent status</b></td>
                    <td><b>Work on</b></td>
                </tr>
            </thead>
            <tbody>
                <c:forEach  items="${ac.courseList.get(cId).course.assignment}" var="a">
                    <tr>
                        <td>${a.name}</td>
                        <c:choose>
                            <c:when test="${stf.get(a.am_id) ne null and stf.get(a.am_id).lasted_send_date ne null}">
                                <c:choose>
                                    <c:when test="${stf.get(a.am_id).checked_time eq null}">
                                        <td>wait checked</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>
                                            ${stf.get(a.am_id).score}
                                            /${a.fully_mark}</td>
                                        </c:otherwise>
                                    </c:choose>

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
                                            <c:when test="${status eq 'miss'}">
                                                <span class="text-muted">Miss</span>
                                            </c:when>
                                        </c:choose>
                                    </b>
                                </td>
                            </c:when>
                            <c:when test="${stow.get(a.am_id) ne null and stow.get(a.am_id).lasted_send_date ne null}">
                                <c:choose>
                                    <c:when test="${stow.get(a.am_id).checked_time eq null}">
                                        <td>wait check</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>
                                            ${stow.get(a.am_id).score}
                                            /${a.fully_mark}</td>
                                        </c:otherwise>
                                    </c:choose>
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
                                            <c:when test="${status eq 'miss'}">
                                                <span class="text-muted">Miss</span>
                                            </c:when>
                                        </c:choose></b>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td>0.0 /${a.fully_mark}</td>
                                <td><b>
                                        <c:set value="${cf:remainingTimeforSend(a,ac.acc_id)}" var="status"/>
                                        <c:choose>
                                            <c:when test="${status eq 'miss'}">
                                                <span class="text-muted">Miss</span>
                                            </c:when>
                                            <c:otherwise> - </c:otherwise>
                                        </c:choose>
                                    </b></td>
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
        <div>
            <button class="btn btn-primary pull-right" style="margin-top: 20px"><span class="glyphicon glyphicon-export"></span> Export Scoresheet</button>
        </div>
        <div style="overflow-y:scroll;margin-top: 75px;clear: both"  >
            <table class="table table-striped" ID="AllStudentScore">
                <thead>
                    <c:set value="" var="head_column"/>
                    <c:set value="${listStudentScore.get(0).listStudentScore.size()}"  var="countback"/>
                    <c:set value="0" var="total_fully_mark"/>
                    <c:forEach begin="0" end="${countback-1}" var="am">
                        <c:set value="${countback-1}"  var="countback"/>
                        <c:set value="${listStudentScore.get(0).listStudentScore.get(countback).full_mark}" var="full_mark"/>
                        <c:set value="${total_fully_mark+full_mark}" var="total_fully_mark"/>
                        <c:set value="${head_column}<th class=\"text-center\"><abbr title=\"${listStudentScore.get(0).listStudentScore.get(countback).am_name}\">${am+1}<br/>(${full_mark}) </abbr></th>" var="head_column"/>            
                    </c:forEach>
                    <tr>
                        <th rowspan="2" style="text-align: center;vertical-align: inherit;"><b>Name</b></th>
                        <th colspan="${listStudentScore.get(0).listStudentScore.size()}" style="text-align: center"><b>Assignment score</b></th>
                        <th rowspan="2" style="text-align: center;vertical-align: inherit;"><b>Total <br/>(${total_fully_mark})</b></th>
                    </tr>
                    <tr>
                        ${head_column}
                        <!--                    <th>(10) <abbr title="งานที่ 1 เขียนโค้ดจาว่าซะ">Assignment# 1</abbr></th>
                                            <th>(10) <abbr title="งานที่ 2 เตรียมโปรเจคเว้ยย">Assignment# 2</abbr></th>
                                            <th>(5) <abbr title="งานที่ 3 งานนี้งานดีต้องทำ">Assignment# 3</abbr></th>-->
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listStudentScore}" var="stacc">
                        <tr>
                            <td>${stacc.firstname} ${stacc.lastname}</td>
                            <%--${stacc.listStudentScore}--%>
                            <c:set value="${stacc.listStudentScore.size()}"  var="countback"/>
                            <c:set value="0" var="total"/>
                            <c:forEach begin="0" end="${stacc.listStudentScore.size()-1}" var="sccount">
                                <c:set value="${countback-1}"  var="countback"/>
                                <c:set value="${stacc.listStudentScore.get(countback)}" var="sc"/>
                                <td>
                                    <c:choose>
                                        <c:when test="${sc.ass_type eq 'web'}">
                                            <c:set var="a" value="${cf:getAmTimeByAmID(sc.stof.am_id)}" target="Model.Assignment"/>
                                            <c:set value="${cf:lastedSentStatus(sc.stof.lasted_send_date, a)}" var="status"/>
                                            <c:choose>
                                                <c:when test="${status eq 'late'}">
                                                    <span class="text-danger"><b>${sc.stof.score}</b></span>
                                                        </c:when>
                                                        <c:when test="${status eq 'ontime'}">
                                                    <span class="text-success"><b>${sc.stof.score}</b></span>
                                                        </c:when>
                                                        <c:when test="${status eq 'hurryup'}">
                                                    <span class="text-warning"><b>${sc.stof.score}</b></span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:set value="${cf:calculateTime(a)}" var="status"/>
                                                            <c:choose>
                                                                <c:when test="${status eq 'miss'}">
                                                            <span class="text-muted">${sc.stof.score}</span>
                                                        </c:when>
                                                        <c:otherwise> - </c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:set value="${total+sc.stof.score}" var="total"/>
                                        </c:when>
                                        <c:when test="${sc.ass_type eq 'file'}">
                                            <c:set var="a" value="${cf:getAmTimeByAmID(sc.stf.am_id)}" target="Model.Assignment"/>
                                            <c:set value="${cf:lastedSentStatus(sc.stf.lasted_send_date, a)}" var="status"/>
                                            <c:choose>
                                                <c:when test="${status eq 'late'}">
                                                    <span class="text-danger"><b> ${sc.stf.score}</b></span>
                                                </c:when>
                                                <c:when test="${status eq 'ontime'}">
                                                    <span class="text-success"><b> ${sc.stf.score}</b></span>
                                                </c:when>
                                                <c:when test="${status eq 'hurryup'}">
                                                    <span class="text-warning"><b> ${sc.stf.score}</b></span>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set value="${cf:calculateTime(a)}" var="status"/>
                                                    <c:choose>
                                                        <c:when test="${status eq 'miss'}">
                                                            <span class="text-muted"> ${sc.stf.score}</span>
                                                        </c:when>
                                                        <c:otherwise> - </c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:set value="${total+sc.stf.score}" var="total"/>
                                        </c:when>
                                    </c:choose>
                                </td>
                            </c:forEach>
                            <td>${total}</td>
                        </tr>
                    </c:forEach>
                    <!--                    <tr>
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
                                        </tr>-->
                </tbody>
            </table> 
        </div>
    </c:otherwise>
</c:choose>
<script>
    $(function() {
        var aTable = $('#AllUserScore').dataTable({
            /* Disable initial sort */
            "aaSorting": []
        });

        var option = [{
                responsive: true,
                maintainAspectRatio: true,
                percentageInnerCutout: 0
            }]

        var ctx = $("#sentLeftChart").get(0).getContext("2d");
        var data = [
            {
                value: ${total_sent_am},
                color: "#428bca",
                label: "Sent"
            },
            {
                value: ${miss_am},
                color: "#999",
                label: "Miss"
            },
            {
                value: ${leftover_am},
                color: "#ede8e8",
                label: "Leftover"
            }
        ]
        var dslChart = new Chart(ctx).Doughnut(data);

        var ctx2 = $("#scoreChart").get(0).getContext("2d");
        var data = [
            {
                value: ${total_mark},
                color: "#40d47e",
                label: "Your total mark"
            },
            {
                value: ${max_sent_mark-total_mark},
                color: "#E74C3C",
                label: "Your miss Mark"
            },
            {
                value: ${miss_score},
                color: "#999",
                label: "Miss score "
            },
            {
                value: ${fully_score-max_mark},
                color: "#ede8e8",
                label: "Left score"
            }
        ]
        var dscChart = new Chart(ctx2).Doughnut(data);

        $("#AllStudentScore").dataTable();
    });
</script>