<html>
<head>
<link rel="icon" type="image/png" href="images/rdoicon.png"/>
        <link rel="icon" type="image/png" sizes="144x144" href="images/rdoicon.png"/>
        <link rel="apple-touch-icon" type="image/png" href="images/rdoicon.png"/>
        <title>Remote Access</title>
<%
String us=(String) request.getParameter("username");
String ps=(String) request.getParameter("password");
 %>

<script src="jquery.min.js"></script>
<style>
.wrapper {
        position: relative;
    }

    .hide-cursor {
        position: absolute;
        top: 0;
        bottom: 0;
        right: 0;
        left: 0;
        cursor: none;
        z-index: 100;
    }
</style>
</head>
<body style="margin: 0px;">
<!-- <div class="wrapper">-->
<!--<a href="#" onclick="toggleFullScreen(document.getElementById('iframeLogin'));"><font size="3">Activate Full Screen</font></a>-->
<iframe id="iframeLogin" src="" frameborder="0" width=100% height=98% tabindex="0"
style="display:none;position:relative; top:0px; left:0px; bottom:0px; right:0px; width:100%; height:100%; border:none; margin:0; padding:0; overflow:hidden; z-index:999;">
</iframe>
<div style="text-align:center;">
<iframe id="iframeLogin2" style="display:none;position:relative;top:0px; left:0px; bottom:0px; right:0px; width:100%; height:100%; border:none; margin:0; padding:0; overflow:hidden;" src="index3.html" width=100% height=99%>
</iframe>
</div>
<script  type="text/javascript">

function affiche()
{
logout();
$("#iframeLogin2").css("display", "block");
var str=window.location.href;
str = str.replace(/\/login.jsp/g, '');
setTimeout(function() {
setTimeout(function() {
$("#iframeLogin").attr("src",str+"/#/login/?username="+"<%=us%>"+"&password="+"<%=ps%>");
setTimeout(function() {
$("#iframeLogin2").css("display", "none");
$("#iframeLogin").css("display", "block");
}, 200);
}, 1200);
}, 3500);
}

function logout()
{
var str=window.location.href;
str = str.replace(/\/login.jsp/g, '');
$("#iframeLogin").attr("src",str+"/index2.html");
}


$( document ).ready(function(){
//$.when($.ajax(logout())).done(function () {
affiche();
//});
});


/*document.addEventListener("keydown", keyDownTextField, false);
function keyDownTextField(e) {
var keyCode = e.keyCode;
  if(keyCode==75 && e.ctrlKey) {
  toggleFullScreen(document.getElementById('iframeLogin'));
  }
}*/

function toggleFullScreen(elem) {
    // ## The below if statement seems to work better ## if ((document.fullScreenElement && document.fullScreenElement !== null) || (document.msfullscreenElement && document.msfullscreenElement !== null) || (!document.mozFullScreen && !document.webkitIsFullScreen)) {
    if ((document.fullScreenElement !== undefined && document.fullScreenElement === null) || (document.msFullscreenElement !== undefined && document.msFullscreenElement === null) || (document.mozFullScreen !== undefined && !document.mozFullScreen) || (document.webkitIsFullScreen !== undefined && !document.webkitIsFullScreen)) {
        //$("#btfull").val("Cancel FullScreen");
        if (elem.requestFullScreen) {
            elem.requestFullScreen();
        } else if (elem.mozRequestFullScreen) {
            elem.mozRequestFullScreen();
        } else if (elem.webkitRequestFullScreen) {
            elem.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
        } else if (elem.msRequestFullscreen) {
            elem.msRequestFullscreen();
        }
    } else {
//$("#btfull").val("Activate FullScreen");
        if (document.cancelFullScreen) {
            document.cancelFullScreen();
        } else if (document.mozCancelFullScreen) {
            document.mozCancelFullScreen();
        } else if (document.webkitCancelFullScreen) {
            document.webkitCancelFullScreen();
        } else if (document.msExitFullscreen) {
            document.msExitFullscreen();
        }
    }
}
</script>
<script type="text/javascript">
  function setFocus() {
   var iframe = $("#iframeLogin")[0];
  iframe.contentWindow.focus();
  }
  $(document).ready(function(){
      //setTimeout(setFocus, 100);
setInterval(function () {
setFocus();
        }, 1000); 
});

</script>

</body></html>
