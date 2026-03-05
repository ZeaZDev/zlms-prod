function ShowMessage(message, messagetype) {
    var cssclass;
    switch (messagetype) {
        case 'Success':
            cssclass = 'alert-success'
            break;
        case 'Error':
            cssclass = 'alert-danger'
            break;
        case 'Warning':
            cssclass = 'alert-warning'
            break;
        default:
            cssclass = 'alert-info'
    }
    $('#alert_container').append('<div id="alert_div" style="margin: 0 0.5%; -webkit-box-shadow: 3px 4px 6px #999;" class="alert fade in ' + cssclass + '"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><strong>' + messagetype + '!</strong> <span>' + message + '</span></div>');
}

function CheckData(oSrc, args) {
    if (args.Value.length >= 4 && args.Value.search('-') == -1 && args.Value.search('%') == -1)
        args.IsValid = true;
    else
        args.IsValid = false;
}

function showDialog(id) {
    alert(id);
    $('#txtUser').append('test');
}

// Session
function SessionExpireAlert(timeout) {
    var seconds = timeout / 1000;
    document.getElementsByName("secondsIdle").innerHTML = seconds;
    document.getElementsByName("seconds").innerHTML = seconds;
    setInterval(function () {
        seconds--;
        document.getElementById("seconds").innerHTML = seconds;
        document.getElementById("secondsIdle").innerHTML = seconds;
    }, 1000);
    setTimeout(function () {
        //Show Popup before 20 seconds of timeout.
        $find("mpeTimeout").show();
    }, timeout - 20 * 1000);
    setTimeout(function () {
        window.location = "Expired.aspx";
    }, timeout);
};
function ResetSession() {
    //Redirect to refresh Session.
    window.location = window.location.href;
}