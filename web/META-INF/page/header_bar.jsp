<style>
    .navbar-nav .glyphicon{
        top: 3px;
    }

    .navbar-nav  .badge{
        margin-left: 4px;
        border-radius: 2px;
        padding: 3px 3px;
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
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-globe"></span><span class="badge">10</span></a>
                    <ul class="dropdown-menu">
                        <li><a href="notification.jsp?nt=Announcement"><span class="badge pull-right">3</span> Announcement</a></li>
                        <li><a href="notification.jsp?nt=Assignment"><span class="badge pull-right">3</span> Assignment</a></li>
                        <li><a href="notification.jsp?nt=Alert"><span class="badge pull-right">2</span> Alert</a></li>
                        <li><a href="notification.jsp?nt=Score"><span class="badge pull-right">2</span> Score</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="padding-top: 10px;padding-bottom: 10px"><img class="img-circle" src="${ac.profile_pic}" width="30"/> ${ac.firstname} ${ac.lastname} <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Your Profile</a></li>
                        <li><a href="signout">Sign out</a></li>
                    </ul>
                </li>
            </ul>
        </div>

    </div>
</nav>
<script>
    $(function() {
//        var eventSource = new EventSource("notify");
//        eventSource.addEventListener('announcement', function(event) {
//            console.log(event.data);
//        }, false);


//        $(".navbar-nav li").mouseover(function() {
//            $(this).css("backgroud-color","e7e7e7");
//        }).mouseout(function() {
//            $(this).css("backgroud-color","none");
//        });

    });
</script>