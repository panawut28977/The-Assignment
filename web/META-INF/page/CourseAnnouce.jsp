<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    #newAnnounce{
        display: none;
    }
    #formAddAnnouce{
        display: none;
    }

    table.dataTable tr.odd,table.dataTable tr.even{
        background-color: white !important; 
    }

</style>

<script>
    $(function() {
        var aTable = $('#AllAnnounce').dataTable({
            /* Disable initial sort */
            "aaSorting": [],
            "bLengthChange": false,
            "bFilter": true,
            "bInfo": false,
            "bSort": false
        });
        var sData = aTable.fnGetData();
        if (sData.length == 0) {
            var html = '<h1 class="text-muted" style="text-align: center" id="noann">No announement.</h1>';
            $("#AllAnnounce_wrapper table tbody").html(html);
        }
        $("#addAnnouce").click(function() {
            var content = $("#content").val();
            if (content.length > 0) {
                $.ajax({
                    type: "POST",
                    url: "AddAnnounce",
                    data: {title: $("#title").val(), content: content}
                }).done(function(msg) {
                    if($("#noann").length!=0){
                        $("#noann").remove();
                    }
                    var html = '<tr class="even"><td><div class="media" id="newAnnounce"><a class="pull-left" href="#"><img class="img-circle" width="64" src="' + pic + '"></a><div class="media-body"><h4 class="media-heading"><small class="text-muted">' + fullname + '</small><small class="pull-right">' + dateSt + '</small></h4><p>' + $("#content").val() + '</p></div></div></td></tr>';
                    $("#listAnnounce table tbody").prepend(html);
                    $("#newAnnounce").slideDown().removeAttr("id");
                    $("#title").val("");
                    $("#content").val("");
                    //aTable.fnDraw();
                });
            }
            else{
                alert("Please write something in text box!");
                $("#content").focus();
            }
        });
        var pic = '${ac.profile_pic}';
        var fullname = '${ac.firstname}' + '${ac.lastname}';
        var d = new Date();
        var dateSt = d.getFullYear() + "-" + ('0' + (d.getMonth() + 1)).slice(-2) + "-" + ('0' + d.getDate()).slice(-2) + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getMilliseconds();
        $("#newannounce").click(function() {
            $(this).hide();
            $("#formAddAnnouce").slideDown();
        });

    });
</script>
<c:choose>
    <c:when test="${ac.courseList.get(cId).role eq 'TH'}">
        <div class="media">
            <div class="media-body">
                <form id="formAddAnnouce">
                    <!--<input name="title" placeholder="Title" class="form-control"  name="title" id="title"/><br>-->
                    <textarea placeholder="Annouce to student here." class="form-control" required="yes" name="content" id="content"></textarea>
                    <input type="button" id="addAnnouce" class="btn btn-primary pull-right" value="Post" style="margin-top: 10px">
                </form>
                <button id="newannounce" class="btn btn-primary pull-right"><i class="glyphicon glyphicon-pencil"></i> Announce</button>
            </div>
        </div>
    </c:when>
</c:choose>
<div id="listAnnounce" class="table-responsive" style="min-height: 520px; margin-top: 30px">
    <table class="table table-striped" id="AllAnnounce">
        <thead>
            <tr>
                <td></td>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${cannouncement.size()!=0}">
                    <c:forEach items="${cannouncement}" var="a">
                        <tr>
                            <td>
                                <div class="media">
                                    <a class="pull-left" href="#">
                                        <img width="64" src="${a.an_acc.profile_pic}">
                                    </a>
                                    <div class="media-body">
                                        <h4 class="media-heading"><small class="text-muted">${a.an_acc.firstname} ${a.an_acc.lastname}</small><small class="pull-right">${cf:formatTime(a.announce_date)}</small></h4>
                                        <p>${a.content}</p>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
            </c:choose>
        </tbody>
    </table>
</div>
<!--<div class="media">
    <a class="pull-left" href="#">
        <img width="64" src="img/avatar.jpg">
    </a>
    <div class="media-body">
        <h4 class="media-heading">AJ. Kittiphan Puapholthep<small class="pull-right">16/01/57</small></h4>
        <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
    </div>
</div>
<div class="media">
    <a class="pull-left" href="#">
        <img width="64" src="img/avatar.jpg">
    </a>
    <div class="media-body">
        <h4 class="media-heading">AJ.Kittiphan Puapholthep<small class="pull-right">16/01/57</small></h4>
        <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
    </div>
</div>
<div class="media">
    <a class="pull-left" href="#">
        <img width="64" src="img/avatar.jpg">
    </a>
    <div class="media-body">
        <h4 class="media-heading">AJ.Kittiphan Puapholthep<small class="pull-right">16/01/57</small></h4>
        <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
    </div>
</div>-->