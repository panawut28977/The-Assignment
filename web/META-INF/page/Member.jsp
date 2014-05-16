<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <c:if test="${sessionScope.accType eq 'st'}">
        <div class="col-md-12" style="margin-top: 12px;">
            <button class="pull-right btn btn-default">leave course</button>
        </div>
    </c:if>
    <div class="media col-md-4">
        <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa" class="pull-left">
        <div class="media-body">
            <h4 class="media-heading" >Panawut Ittitananun</h4>
            <c:if test="${sessionScope.accType eq 'th'}">
                <span class="dropdown pull-right">
                    <a class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span></a>
                    <ul class="dropdown-menu">
                        <li><a  data-toggle="modal" data-target="#create_course" title="create course">Make Teacher</a></li>
                        <li><a  data-toggle="modal" data-target="#join_course" title="join course">Remove form course</a></li>
                    </ul>
                </span>
            </c:if>
            <br>
            <small class="pull-right text-muted">Join date: 16/01/57</small>
        </div>
    </div>
    <div class="media col-md-4">
        <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa" class="pull-left">
        <div class="media-body">
            <h4 class="media-heading">Thanakit Mahamutjinda</h4>
            <c:if test="${sessionScope.accType eq 'th'}">
                <span class="dropdown pull-right">
                    <a class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span></a>
                    <ul class="dropdown-menu">
                        <li><a  data-toggle="modal" data-target="#create_course" title="create course">Make Teacher</a></li>
                        <li><a  data-toggle="modal" data-target="#join_course" title="join course">Remove form course</a></li>
                    </ul>
                </span>
            </c:if>
            <br>
            <small class="pull-right text-muted">Join date: 16/01/57</small>
        </div>
    </div>
    <div class="media col-md-4">
        <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa" class="pull-left">
        <div class="media-body">
            <h4 class="media-heading">Nitiwit Wungwiwatna</h4>
            <c:if test="${sessionScope.accType eq 'th'}">
                <span class="dropdown pull-right">
                    <a class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span></a>
                    <ul class="dropdown-menu">
                        <li><a  data-toggle="modal" data-target="#create_course" title="create course">Make Teacher</a></li>
                        <li><a  data-toggle="modal" data-target="#join_course" title="join course">Remove form course</a></li>
                    </ul>
                </span>
            </c:if>
            <br>
            <small class="pull-right text-muted">Join date: 16/01/57</small>
        </div>
    </div>
</div>
<div class="row">
    <div class="media col-md-4">
        <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa" class="pull-left">
        <div class="media-body">
            <h4 class="media-heading">Thanapan Suwankanit</h4>
            <c:if test="${sessionScope.accType eq 'th'}">
                <span class="dropdown pull-right">
                    <a class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span></a>
                    <ul class="dropdown-menu">
                        <li><a  data-toggle="modal" data-target="#create_course" title="create course">Make Teacher</a></li>
                        <li><a  data-toggle="modal" data-target="#join_course" title="join course">Remove form course</a></li>
                    </ul>
                </span>
            </c:if>
            <br>
            <small class="pull-right text-muted">Join date: 16/01/57</small>
        </div>
    </div>
</div>
<style>
    .media:first-child{
        margin-top: 15px;
    }
    .media,.media-body{
        overflow: visible !important;
    }
</style>