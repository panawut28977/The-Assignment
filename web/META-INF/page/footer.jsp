<style>
    .footer{
        background: rgba(23, 36, 80,0.9);
        color: white;
        position: fixed;
        bottom: 0;
        width: 100%;
        padding: 5px 0;
        min-height: 450;
    }

    .member,.hidefooter,#arm,#oat,#toon{
        display: none;
    }

    .member .col-md-4 .clearboth{
        padding-top: 20px;
    }
    
</style>
<div class="footer">
    <span>&nbsp;&nbsp;  CopyRight <i class="glyphicon glyphicon-copyright-mark"></i> 2014 The Assignment. </span>
    <span class="pull-right createdby">
        Created by <b>IT 54-27</b>&nbsp;&nbsp;
        <img src="img/arm.jpg"  width="20">
        <img src="img/oat2.jpg" width="20">
        <img src="img/toon2.jpg" width="20">
        &nbsp;
         <span class="glyphicon glyphicon-chevron-up usepointer showfooter"></span>
        <span class="glyphicon glyphicon-chevron-down usepointer hidefooter"></span>
        &nbsp;&nbsp;
    </span> 
    <div class="member row">
        <div class="col-md-12">
            <h2 class="text-center" style="margin-bottom: 20px"><b>IT 54-27 Members</b></h2>
        </div>
        <div class="col-md-12">
            <div class="col-md-4 text-center" id="arm">
                <img src="img/arm.jpg" class="col-md-8 col-md-offset-2">
                <div class="clearboth">
                    <h3>Panawut Ittitananun </h3>
                    54216952
                </div>
            </div>
            <div class="col-md-4  text-center" id="oat">
                <img src="img/oat2.jpg" class="col-md-8 col-md-offset-2">
                <div class="clearboth">
                    <h3>Nitiwit Wungwiwatna </h3>
                    54216937
                </div>
            </div>
            <div class="col-md-4  text-center" id="toon">
                <img src="img/toon2.jpg" class="col-md-8 col-md-offset-2">
                <div class="clearboth">
                    <h3>Thanakit Mahamutjinda </h3>
                    54216924
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function() {
        $(".showfooter").click(function() {
            $("#arm").fadeIn(500);
            $("#oat").fadeIn(2000);
            $("#toon").fadeIn(3500);
            $(".member").slideDown();
            $(".hidefooter").show();
            $(this).hide();
            
        });
        $(".hidefooter").click(function() {
            $(".member").slideUp();
            $(".showfooter").show();
            $("#arm,#oat,#toon").hide();
            $(this).hide();
        });
    });
</script>