<div class="col-md-4">
    <div class="well well-lg">
        <h3><b>Sign in to The Assignment</b></h3>
        <form role="form" action="LoginServlet" method="post">

            <div class="form-group">
                <input type="email" class="form-control" id="email" name="email" value="${email}" placeholder="E-mail" >
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password">
            </div>
            <a  data-toggle="modal" data-target="#forgot_pass" title="Forgot your password ?">Forgot your password ?</a>
            <span class="text-danger"><br/>${msg}</span>
            <div class="form-group">
                <input type="submit" value="Sign in" class="btn btn-default pull-right">
            </div>
        </form>
        <br><br>
        <hr>
        <h3><b>Sign up now. It's free.</b></h3>
        <a href="register.jsp?rg=ST" class="btn btn-primary" style="width: 49%;">I'm Student</a>
        <a href="register.jsp?rg=TH" class="btn btn-primary" style="width: 49%;">I'm Teacher</a>
    </div>
</div>
<div class="modal fade" id="forgot_pass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="ForgotPassword" id="ForgotPassword" onsubmit="return check()" method="post">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel"><i class="fa fa-envelope"></i> Enter your email account</h4>
                </div>
                <div class="modal-body">
                    <p>How would you like to reset your password?</p>
                    <input type="email" name="email" required="yes" class="form-control">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <input type="submit" id="submit" class="btn btn-primary" value="Continue"/>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
//    $(function() {
//        $("#submit").submit(function() {
//            $(this).addClass("disabled");
//            $(this).val("Sending..");
//        });
//    });

    function check() {
        $("#submit").addClass("disabled");
        $("#submit").val("Sending..");
        return true;
    }
</script>
