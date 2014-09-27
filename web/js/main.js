/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(function() {
//    $("img[class!='qrcode']").addClass("img-circle");
    $(":file").filestyle();
});


function getFileName(fullPath) {
    var filename;
    if (fullPath) {
        var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
        var filename = fullPath.substring(startIndex);
        if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
            filename = filename.substring(1);
        }
    }
    return filename;
}

function formatDate(date) {
    var dateFormat = $.datepicker.formatDate('MM dd, yy', new Date(date));
    alert(dateFormat);
    $(this).text(dateFormat);
}