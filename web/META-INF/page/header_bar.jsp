<nav class="navbar navbar-default" role="navigation">
    <div class="navbar-header ">
        <a class="navbar-brand" href="#">The Assignment</a>
    </div>
    <div class="container">
        <div class="row">
            <div class="collapse navbar-collapse" style="padding-left: 0;">
                <ul class="nav navbar-nav">
                    <li><a href="home.jsp"><span class="glyphicon glyphicon-home"></span></a></li>
                    <li><a href="message.jsp"><span class="glyphicon glyphicon-envelope"></span></a></li>
                    <li class="dropdown"> 
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-globe"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="notification.jsp?nt=Announcement"><span class="badge pull-right">2</span> Annoucement</a></li>
                            <li><a href="notification.jsp?nt=Assignment"><span class="badge pull-right">5</span> Assignment</a></li>
                            <li><a href="notification.jsp?nt=Alert"><span class="badge pull-right">2</span> Alert</a></li>
                            <li><a href="notification.jsp?nt=Score"><span class="badge pull-right">12</span> Score</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> Account <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">profile</a></li>
                            <li><a href="#">Sign out</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<script>
    $(function(){
       $(".navbar-nav li").mouseover(function(){
         $(this).addClass("active");  
       }).mouseout(function(){
         $(this).removeClass("active");  
       });
    });
</script>