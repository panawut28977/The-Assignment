<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form class="form-horizontal" role="form">
    <div class="form-group">
    <label class="col-md-7 col-md-offset-2 control-label"><h4 style="margin-top: 20px"><b>Please select column of first name and last name for sure</b></h4></label>
  </div>
  <div class="form-group">
    <label for="firstnameColumn" class="col-md-4 control-label">First Name</label>
    <div class="col-md-5" id="firstnameColumn">
        <select class="form-control">
            <option>No.</option>
            <option>First Name</option>
            <option>Last Name</option>
            <option>Age</option>
        </select>
    </div>
  </div>
  <div class="form-group">
    <label for="lastnameColumn" class="col-md-4 control-label">Lastname</label>
    <div class="col-md-5" id="lastnameColumn">
      <select class="form-control">
            <option>No.</option>
            <option>Firstname</option>
            <option>Lastname</option>
            <option>Age</option>
        </select>
    </div>
  </div>
    <div class="form-group">
    <div class="col-md-offset-4 col-md-3">
      <button type="submit" class="btn btn-primary">Submit</button>
    </div>
  </div>
</form>