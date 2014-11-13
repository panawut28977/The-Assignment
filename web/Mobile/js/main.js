/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(function() {
    if (typeof (EventSource) !== "undefined") {
        var id = sessionStorage.getItem('accID');
        var total = sessionStorage.getItem('curTotal');
//        console.log("id:" + id);
        var eventSource = new EventSource("http://localhost:8084/TheAssignment/TheAssignment/NewNotiMobile?ac=" + id + "&&ct=" + total);
        eventSource.addEventListener('totalNewNoti', function(event) {
//            console.log(event.data);
            var num = event.data+"";
//            console.log("curTotal" + total);
//            sessionStorage.setItem('curTotal', num);
            if (num == 0) {
                $("#noti").addClass("hide");
            } else {
                $("#noti").text(num).removeClass("hide");
            }
        }, false);
    }
});


