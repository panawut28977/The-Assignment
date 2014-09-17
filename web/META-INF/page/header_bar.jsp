<style>
    .navbar-nav .glyphicon{
        top: 3px;
    }

    .navbar-nav  .badge{
        margin-left: 4px;
        border-radius: 2px;
        padding: 3px 3px;
    }

    .navbar-login
    {
        width: 305px;
        padding: 10px;
        padding-bottom: 0px;
    }

    .navbar-login-session
    {
        padding: 10px;
        padding-bottom: 0px;
        padding-top: 0px;
    }

    .icon-size
    {
        font-size: 87px;
    }
    /*    .navbar-nav{
            text-align: center;
        }*/
</style>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header ">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#collapse-menu">
                <span class="sr-only">Open menu</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="home.jsp">The Assignment</a>
        </div>

        <div class="collapse navbar-collapse" style="padding-left: 0;" id="collapse-menu">
            <ul class="nav navbar-nav">
                <li id="home_menu" class="active"><a href="home.jsp?tab=AllAnnouce"><span class="glyphicon glyphicon-home"></span></a></li>
                <li id="message_menu"><a href="message"><span class="glyphicon glyphicon-envelope"></span></a></li>
                <li class="dropdown" id="notification_menu"> 
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-globe"></span><span class="badge" id="cTotal">${cTotal}</span></a>
                    <ul class="dropdown-menu">
                        <li><a href="notification?nt=Announcement"><span class="badge pull-right" id="cAnn">${cAnn}</span> Announcement</a></li>
                        <li><a href="notification?nt=Assignment"><span class="badge pull-right" id="cAm">${cAm}</span> Assignment</a></li>
                        <li><a href="notification?nt=Alert"><span class="badge pull-right" id="cAlert">${cAlert}</span> Alert</a></li>
                        <li><a href="notification?nt=Score"><span class="badge pull-right" id="cScore">${cScore}</span> Score</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <!--                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="padding-top: 10px;padding-bottom: 10px"><img class="img-circle" src="${ac.profile_pic}" width="30"/> ${ac.firstname} ${ac.lastname} <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">Your Profile<span class="glyphicon glyphicon-user pull-right"></span></a></li>
                                        <li><a href="signout">Sign out <span class="glyphicon glyphicon-log-out pull-right"></span></a></li>
                                    </ul>
                                </li>-->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" style="padding-top: 10px;padding-bottom: 10px;" data-toggle="dropdown">
                        <img class="img-circle" src="${ac.profile_pic}" width="30"/>
                        <strong>${ac.firstname}</strong>
                        <span class="glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="navbar-login">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <p class="text-center">
                                            <img class="img-circle" src="${ac.profile_pic}" width="87"/>
                                        </p>
                                    </div>
                                    <div class="col-lg-8">
                                        <p class="text-left"><strong>${ac.firstname} ${ac.lastname}</strong></p>
                                        <p class="text-left small">${ac.email}</p>
                                        <p class="text-left">
                                            <a href="#" class="btn btn-primary btn-block btn-sm">View profile</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="navbar-login navbar-login-session">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <p>
                                            <a href="signout" class="btn btn-danger btn-block">Sign out  <span class="glyphicon glyphicon-log-out"></span></a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>

    </div>
</nav>
<script>
    $(function() {
        var eventSource = new EventSource("notify");
        eventSource.addEventListener('cAnn', function(event) {
            console.log(event.data);
            $("#cAnn").text(event.data);
        }, false);

        eventSource.addEventListener('cAlert', function(event) {
            console.log(event.data);
            $("#cAlert").text(event.data);
        }, false);

        eventSource.addEventListener('cScore', function(event) {
            console.log(event.data);
            $("#cScore").text(event.data);
        }, false);

        eventSource.addEventListener('cAm', function(event) {
            console.log(event.data);
            $("#cAm").text(event.data);
        }, false);
        
        eventSource.addEventListener('cTotal', function(event) {
            console.log(event.data);
            $("#cTotal").text(event.data);
        }, false);
        
        eventSource.addEventListener('cNewAnn', function(event) {
            console.log(event.data);
        }, false);

        eventSource.addEventListener('cNewAlert', function(event) {
            console.log(event.data);
        }, false);

        eventSource.addEventListener('cNewScore', function(event) {
            console.log(event.data);
        }, false);

        eventSource.addEventListener('cNewAm', function(event) {
            console.log(event.data);
        }, false);

//        $(".navbar-nav li").mouseover(function() {
//            $(this).css("backgroud-color","e7e7e7");
//        }).mouseout(function() {
//            $(this).css("backgroud-color","none");
//        });

    });
</script>