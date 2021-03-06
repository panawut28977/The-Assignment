<div class="col-md-4">
    <div class="well well-lg">
        <form role="form" action="Register" method="post">
            <h3>I'm student</h3><hr>
            <div class="form-group">
                <label>First Name</label>
                <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Firstname">
            </div>
            <div class="form-group">
                <label>Last Name</label>
                <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Lastname">
            </div>            
            <div class="form-group">
                <label>E-mail</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="E-mail">
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Password">
            </div>
            <input type="hidden" value="ST" name="type">
            <input type="submit" id="submit" class="btn btn-primary" style="width: 49%;" value="Sign up">
            <a href="index.jsp" class="btn btn-default" style="width: 49%;">Cancel</a>
        </form>
    </div>
</div>
<script>
    $(function() {
        $("#email").on("change", function() {
            var value = $(this).val();
            if (value.length == 0) {
                addCheckingStatus('true');
            } else {
                $.ajax({
                    type: "POST",
                    url: "isExistingEmail",
                    data: {email: value}
                }).done(function(msg) {
                    alert(msg);
                    addCheckingStatus(msg);
                });
            }
        });

        function addCheckingStatus(msg) {
            //true if it's a existing email
            if (msg == 'true') {
                $("#email").parent().removeClass("has-success   has-feedback").find("span").remove("span");
                $("#email").parent().addClass("has-error  has-feedback").append('<span class="glyphicon glyphicon-remove form-control-feedback"></span>');
                $("#submit").attr("disabled", "disabled");
            } else {
                $("#email").parent().removeClass("has-error  has-feedback").find("span").remove("span");
                $("#email").parent().addClass("has-success   has-feedback").append('<span class="glyphicon glyphicon-ok form-control-feedback"></span>');
                $("#submit").removeAttr("disabled");
            }
        }   
    });

</script>