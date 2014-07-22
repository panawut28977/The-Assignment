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
             <span class="text-danger">${msg}</span>
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