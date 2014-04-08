<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    #AllAssignemnt_wrapper{
        margin-top: 20px;
    }
    
    span[class^=text]{
        font-weight: bold;
    }
</style>
<table class="table table-striped" id="AllAssignemnt">
    <thead>
        <tr>
            <td>Name</td>
            <td>Course</td>
            <td>Due Date</td>
            <td>Work on</td>
            <td>Member</td>
            <td>Status</td>
            <td></td>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>งานที่ 1 .....</td>
            <td><a href="">INT202 Software Development Process II</a></td>
            <td>31/2/2554</td>
            <td>File</td> 
            <td>Individual</td>
            <td><span class="text-danger">Late</span></td>
            <td><a title="Send Assignment File"><span class="glyphicon glyphicon-upload"></span></a></td>
        </tr>
         <tr>
            <td>งานที่ 2 .....</td>
            <td><a href="">INT202 Software Development Process II</a></td>
            <td>13/01/2554</td>
            <td>File</td>
            <td>Group(2)</td>
            <td><span class="text-success">on time</span></td>
            <td><a title="Send Assignment File"><span class="glyphicon glyphicon-upload"></span></a></td>
        </tr>
         <tr>
            <td>งานที่ 3 .....</td>
            <td><a href="">INT202 Software Development Process II</a></td>
            <td>13/08/2556</td>
            <td>On Web</td>
            <td>Group(3)</td>
            <td><span class="text-success">on time</span></td>
            <td><a title="Do it on web"><span class="glyphicon glyphicon-upload"></span></a></td>
        </tr>
    </tbody>
</table>
