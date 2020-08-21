<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src = " https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js "></script>
<script type="text/javascript">
	//유저넘 메세지보냄
	function sendUsernum() {
	   sockjs.send("This_Is_UserList");
	}

   var messageData = null;
   
   sockjs= new SockJS("<c:url value="/echo"/>");
   sockjs.onopen=function(event){
      console.log('유저리스트 소켓열림');
      sendUsernum();
   };
   sockjs.onmessage=function(event){
   var map = new Map();
   var data = event.data;
   
   var aa = data.split("|");
   var sessions= aa[0];
   var what=aa[1];
   
   messageData = sessions;
  // console.log("메세지데이타"+messageData);
   $('#msgData1').val(messageData);
   
      var session = sessions.split(' ');
      for ( var i in session ) {
          map.set(session[i],'usernum');   
      }
         
   /*   if (map.has($('#user_num').val())) {
         $('#indicator').attr("src","images/online_big.png");
	}
    	  $('.user_number').each(function(idx,item){
    	         if(map.has(item.value)){
    	           // console.log('==========online');
    	            $('#indicator'+(idx+1)).attr("src","images/online.png");
    	            //break;
    	         }
    	      });
      
      
    	  $('.user_number2').each(function(idx,item){
    	         if(map.has(item.value)){
    	           // console.log('==========online');
    	            $('#indicator_rc'+(idx+1)).attr("src","images/online.png");
    	            //break;
    	         }
    	      });
       */
      //접속자수
     // var size= map.size-1;
     // console.log("사이즈"+size);
     // document.getElementById('size').value = size;
      //
   
   };
   sockjs.onclose=function(event){
      
   };
   
  
   
   
   sockjs.onclose=function(event){
	      console.log('유저리스트 소켓끊김');
	      console.log(event);
	   };
	   
	sockjs.onerror=function(event){
		console.log(event);
	};

   var sessiontest;

      $(document).ready(function(){
         sessiontest='aaa'
            var session  = $('#sessionid').val()
   
     // console.log(session);

      if (session === '' || session === 'null') {
         alert('로그인이 만료되었습니다.다시로그인바람');
         document.location.href = "login";
      }
   });
</script>

<title>SOUL MATCH</title>

<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
   href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css?family=Herr+Von+Muellerhoff"
   rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">

<script type="text/javascript" src="se2/js/HuskyEZCreator.js"
   charset="EUC-KR"></script>
<script type="text/javascript"
   src="//code.jquery.com/jquery-1.11.0.min.js" charset="EUC-KR"></script>
</head>
<body>
   <input type="hidden" id="sessionid" value="${sessionScope.user_num }">
   <input type="hidden" id="message" value=" "/>
   <div id="colorlib-page">