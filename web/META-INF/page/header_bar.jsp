<style>
    .navbar-nav .glyphicon{
        top: 3px;
    }

    .navbar-nav  .badge{
        margin-left: 4px;
        border-radius: 2px;
        padding: 3px 3px;
    }
</style>
<nav class="navbar navbar-default" role="navigation">
    <div class="navbar-header ">
        <a class="navbar-brand" href="home.jsp">The Assignment</a>
    </div>
    <div class="container">
        <div class="row">
            <div class="collapse navbar-collapse" style="padding-left: 0;">
                <ul class="nav navbar-nav">
                    <li><a href="home.jsp"><span class="glyphicon glyphicon-home"></span></a></li>
                    <li><a href="message.jsp"><span class="glyphicon glyphicon-envelope"></span></a></li>
                    <li class="dropdown"> 
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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> ${ac.firstname} ${ac.lastname} <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Your Profile</a></li>
                            <li><a href="signout">Sign out</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<script>
    $(function() {
        $(".navbar-nav li").mouseover(function() {
            $(this).addClass("active");
        }).mouseout(function() {
            $(this).removeClass("active");
        });
    });
</script>