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
<!--<script src="module/chartjs/Chart.js" ></script>-->
<script src="module/highStock/js/highstock.js"></script>
<script src="module/highStock/js/modules/exporting.js"></script>
<c:choose> 
    <c:when test="${ac.courseList.get(cId).role eq 'ST'}">
        <div class="row" id="chart" style="margin-top: 20px" >
            <!--            <div  class="col-md-6">
                            <canvas  id="sentLeftChart"></canvas>
                            <h4 >Sent / Miss / Leftover</h4>
                        </div>
                        <div  class="col-md-6">
                            <canvas id="scoreChart"></canvas>
                            <h4>Score (Max score is ${fully_score})</h4>
                        </div>-->
            <div class="col-md-12">
                <div id="scoreChart" ></div>
            </div>
            <div class="col-md-12">
                <h4 class="pull-right"><b>Total leftover: ${leftover_am}</b>&nbsp;&nbsp;&nbsp;&nbsp;<span class="text-primary">Sent: ${total_sent_am}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="text-muted">Miss: ${miss_am}</span></h4>
            </div>
        </div>
        <!--        <div style="text-align: center;margin-top:20px ">
                    <div class="col-md-4"><h4>${total_sent_am}<br> Sent</h4></div>
                    <div class="col-md-4"><h4>${total_score}/${fully_mark} <br>Scores</h4></div>
                    <div class="col-md-4"><h4>${leftover_am} <br> Leftovers</h4></div>
                </div>-->
        <hr style="clear:both">
        <table class="table table-striped "  id="AllUserScore">
            <thead>
                <tr>
                    <td><b>Assignment</b></td>
                    <td><b>Scores</b></td>
                    <td><b>Sent status</b></td>
                    <td><b>Work on</b></td>
                </tr>
            </thead>
            <tbody>
                <c:forEach  items="${requestScope.courseAssignment}" var="a">
                    <tr>
                        <td>${a.name} ${stf.get(a.am_id).lasted_send_date}</td>
                        <c:choose>
                            <c:when test="${stf.get(a.am_id) != null and stf.get(a.am_id).lasted_send_date != null}">
                                <c:choose>
                                    <c:when test="${stf.get(a.am_id).checked_time == null}">
                                        <td>wait check</td>
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
                                            <c:when test="${status.equalsIgnoreCase('late')}">
                                                <span class="text-danger">Late</span>
                                            </c:when>
                                            <c:when test="${status.equalsIgnoreCase('ontime')}">
                                                <span class="text-success">On time</span>
                                            </c:when>
                                            <c:when test="${status.equalsIgnoreCase('hurryup')}">
                                                <span class="text-warning">Hurry up!</span>
                                            </c:when>
                                            <c:when test="${status.equalsIgnoreCase('miss')}">
                                                <span class="text-muted">Miss</span>
                                            </c:when>
                                        </c:choose>
                                    </b>
                                </td>
                            </c:when>
                            <c:when test="${stow.get(a.am_id) != null and stow.get(a.am_id).lasted_send_date != null}">
                                <c:choose>
                                    <c:when test="${stow.get(a.am_id).checked_time == null}">
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
                                            <c:when test="${status.equalsIgnoreCase('late')}">
                                                <span class="text-danger">Late</span>
                                            </c:when>
                                            <c:when test="${status.equalsIgnoreCase('ontime')}">
                                                <span class="text-success">On time</span>
                                            </c:when>
                                            <c:when test="${status.equalsIgnoreCase('hurryup')}">
                                                <span class="text-warning">Hurry up!</span>
                                            </c:when>
                                            <c:when test="${status.equalsIgnoreCase('miss')}">
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
                                            <c:when test="${status.equalsIgnoreCase('miss')}">
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
        <c:choose>
            <c:when test="${listStudentScore.size() == 0 || listStudentScore.size() == null }">
               <div>
                    <a class="btn btn-default disabled pull-right" style="margin-top: 20px"><span class="glyphicon glyphicon-export"></span> Export Scoresheet</a>
                </div>
            </c:when>
            <c:otherwise>
                <div>
                    <a class="btn btn-primary pull-right" style="margin-top: 20px" href="exportScoreSheet"><span class="glyphicon glyphicon-export"></span> Export Scoresheet</a>
                </div>
            </c:otherwise>
        </c:choose>
        <div style="overflow-y:scroll;margin-top: 75px;clear: both"  >
            <table class="table table-striped" ID="AllStudentScore">
                <c:choose>
                    <c:when test="${listStudentScore.size() == 0 || listStudentScore.size() == null }">
                        <h1 class="text-muted" style="text-align: center">Empty student in your course.</h1>
                    </c:when>
                    <c:otherwise>
                        <thead>
                            <c:if test="${listStudentScore.get(0).listStudentScore.size() !=0}">
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
                                </tr>
                            </c:if>
                        </thead>
                        <tbody class="text-center">
                            <c:if test="${listStudentScore.get(0).listStudentScore.size() !=0}">
                                <c:forEach items="${listStudentScore}" var="stacc">
                                    <tr>
                                        <td style="text-align: left">${stacc.firstname} ${stacc.lastname}</td>
                                        <c:set value="${stacc.listStudentScore.size()}"  var="countback"/>
                                        <c:set value="0" var="total"/>
                                        <c:forEach begin="0" end="${stacc.listStudentScore.size()-1}" var="sccount">
                                            <c:set value="${countback-1}"  var="countback"/>
                                            <c:set value="${stacc.listStudentScore.get(countback)}" var="sc"/>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${sc.ass_type.equalsIgnoreCase('web')}">
                                                        <c:set value="${cf:lastedSentStatus(sc.stof.lasted_send_date, sc.am)}" var="status"/>
                                                        <c:choose>
                                                            <c:when test="${status.equalsIgnoreCase('late')}">
                                                                <span class="text-danger"><b>${sc.stof.score}</b></span>
                                                                    </c:when>
                                                                    <c:when test="${status.equalsIgnoreCase('ontime')}">
                                                                <span class="text-success"><b>${sc.stof.score}</b></span>
                                                                    </c:when>
                                                                    <c:when test="${status.equalsIgnoreCase('hurryup')}">
                                                                <span class="text-warning"><b>${sc.stof.score}</b></span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <c:set value="${cf:calculateTime(sc.am)}" var="status"/>
                                                                        <c:choose>
                                                                            <c:when test="${status.equalsIgnoreCase('miss')}">
                                                                        <span class="text-muted">${sc.stof.score}</span>
                                                                    </c:when>
                                                                    <c:otherwise> - </c:otherwise>
                                                                </c:choose>
                                                            </c:otherwise>
                                                        </c:choose>
                                                        <c:set value="${total+sc.stof.score}" var="total"/>
                                                    </c:when>
                                                    <c:when test="${sc.ass_type.equalsIgnoreCase('file')}">
                                                        <c:set value="${cf:lastedSentStatus(sc.stf.lasted_send_date, sc.am)}" var="status"/>
                                                        <c:choose>
                                                            <c:when test="${status.equalsIgnoreCase('late')}">
                                                                <span class="text-danger"><b> ${sc.stf.score}</b></span>
                                                            </c:when>
                                                            <c:when test="${status.equalsIgnoreCase('ontime')}">
                                                                <span class="text-success"><b> ${sc.stf.score}</b></span>
                                                            </c:when>
                                                            <c:when test="${status.equalsIgnoreCase('hurryup')}">
                                                                <span class="text-warning"><b> ${sc.stf.score}</b></span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:set value="${cf:calculateTime(sc.am)}" var="status"/>
                                                                <c:choose>
                                                                    <c:when test="${status.equalsIgnoreCase('miss')}">
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
                            </c:if>
                        </tbody>
                    </c:otherwise>
                </c:choose>
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

//        var ctx = $("#sentLeftChart").get(0).getContext("2d");
//        var data = [
//            {
//                value: ${total_sent_am},
//                color: "#428bca",
//                label: "Sent"
//            },
//            {
//                value: ${miss_am},
//                color: "#999",
//                label: "Miss"
//            },
//            {
//                value: ${leftover_am},
//                color: "#ede8e8",
//                label: "Leftover"
//            }
//        ]
//        var dslChart = new Chart(ctx).Doughnut(data);
//
//        var ctx2 = $("#scoreChart").get(0).getContext("2d");
//        var data = [
//            {
//                value: ${total_mark},
//                color: "#40d47e",
//                label: "Your total mark"
//            },
//            {
//                value: ${max_sent_mark-total_mark},
//                color: "#E74C3C",
//                label: "Your miss Mark"
//            },
//            {
//                value: ${miss_score},
//                color: "#999",
//                label: "Miss score "
//            },
//            {
//                value: ${fully_score-max_mark},
//                color: "#ede8e8",
//                label: "Left score"
//            }
//        ]
//        var dscChart = new Chart(ctx2).Doughnut(data);
        var xAxisArr = [];
        var missArr = [];
        var scoreArr = [];
        var totalAm = '${requestScope.courseAssignment.size()}';
    <c:forEach  items="${requestScope.courseAssignment}" var="a">
        <c:choose>
            <c:when test="${stf.get(a.am_id) ne null and stf.get(a.am_id).lasted_send_date ne null}">
        xAxisArr.push('${a.name}');
        missArr.push(${a.fully_mark-stf.get(a.am_id).score});
        scoreArr.push(${stf.get(a.am_id).score});
            </c:when>
            <c:when test="${stow.get(a.am_id) ne null and stow.get(a.am_id).lasted_send_date ne null}">
        xAxisArr.push('${a.name}');
        missArr.push(${a.fully_mark-stow.get(a.am_id).score});
        scoreArr.push(${stow.get(a.am_id).score});
            </c:when>
            <c:otherwise>
        xAxisArr.push('${a.name}');
        missArr.push(${a.fully_mark});
        scoreArr.push(0);
            </c:otherwise>
        </c:choose>
    </c:forEach>
        xAxisArr.reverse();
        missArr.reverse();
        scoreArr.reverse();
        var totalchart = totalAm - 8;
        if (totalchart < 0) {
            totalchart = 0
        }
        $('#scoreChart').highcharts({
            colors: ['#EDE8E8', '#40d47e'],
            chart: {
                type: 'column'
            },
            title: {
                text: 'your assignment score'
            },
            xAxis: {
                categories: xAxisArr,
                min: totalchart
            },
            scrollbar: {
                enabled: true
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Total assignment score'
                },
                stackLabels: {
                    enabled: true,
                    style: {
                        fontWeight: 'bold',
                        color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                    }
                }
            },
            legend: {
                align: 'right',
                x: -70,
                verticalAlign: 'top',
                y: 20,
                floating: true,
                backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
                borderColor: '#CCC',
                borderWidth: 1,
                shadow: false
            },
            tooltip: {
                formatter: function() {
                    return '<b>' + this.x + '</b><br/>' +
                            this.series.name + ': ' + this.y + '<br/>' +
                            'Max score: ' + this.point.stackTotal;
                }
            },
            plotOptions: {
                column: {
                    stacking: 'normal',
                    dataLabels: {
                        enabled: true,
                        color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                        style: {
                            textShadow: '0 0 3px black, 0 0 3px black'
                        }
                    },
                    states: {
                        hover: {
                            color: '#5F8BCA'
                        }
                    }
                }
            },
            series: [{
                    name: 'Miss',
                    data: missArr
                }, {
                    name: 'Your score',
                    data: scoreArr
                }]
        });
        $("#AllStudentScore").dataTable();
        $('#exportbtn').tooltip();
    });
</script>