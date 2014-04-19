<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="media col-md-4">
        <a class="pull-left" href="#">
            <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
        </a>
        <div class="media-body">
            <h4 class="media-heading" >rrrr fff</h4>
            <c:if test="${sessionScope.accType eq 'th'}">
                <span class="dropdown pull-right">
                    <a class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span></a>
                    <ul class="dropdown-menu">
                        <li><a  data-toggle="modal" data-target="#create_course" title="create course">Make teacher</a></li>
                        <li><a  data-toggle="modal" data-target="#join_course" title="join course">remove form course</a></li>
                    </ul>
                </span>
            </c:if>
            <br>
            <small class="pull-right text-muted">Join date: 16/01/57</small>
        </div>
    </div>
    <div class="media col-md-4">
        <a class="pull-left" href="#">
            <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
        </a>
        <div class="media-body">
            <h4 class="media-heading">asdf gggg</h4>
            <c:if test="${sessionScope.accType eq 'th'}">
                <span class="dropdown pull-right">
                    <a class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span></a>
                    <ul class="dropdown-menu">
                        <li><a  data-toggle="modal" data-target="#create_course" title="create course">Make teacher</a></li>
                        <li><a  data-toggle="modal" data-target="#join_course" title="join course">remove form course</a></li>
                    </ul>
                </span>
            </c:if>
            <br>
            <small class="pull-right text-muted">Join date: 16/01/57</small>
        </div>
    </div>
    <div class="media col-md-4">
        <a class="pull-left" href="#">
            <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
        </a>
        <div class="media-body">
            <h4 class="media-heading">sss asdfsdf</h4>
            <c:if test="${sessionScope.accType eq 'th'}">
                <span class="dropdown pull-right">
                    <a class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span></a>
                    <ul class="dropdown-menu">
                        <li><a  data-toggle="modal" data-target="#create_course" title="create course">Make teacher</a></li>
                        <li><a  data-toggle="modal" data-target="#join_course" title="join course">remove form course</a></li>
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
        <a class="pull-left" href="#">
            <img width="64" src="https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSfiXsFn2SG_qgzoK6Pxowr8z52K9PLD1kfc310AH2vzJ0L50wa">
        </a>
        <div class="media-body">
            <h4 class="media-heading">AAA SSSSS</h4>
            <c:if test="${sessionScope.accType eq 'th'}">
                <span class="dropdown pull-right">
                    <a class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span></a>
                    <ul class="dropdown-menu">
                        <li><a  data-toggle="modal" data-target="#create_course" title="create course">Make teacher</a></li>
                        <li><a  data-toggle="modal" data-target="#join_course" title="join course">remove form course</a></li>
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