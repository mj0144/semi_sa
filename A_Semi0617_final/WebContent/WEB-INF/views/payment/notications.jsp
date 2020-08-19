<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="resources/css/notifycations.css" rel="stylesheet" id="bootstrap-css">
<!-- <script src="resources/js/notifycations.js"></script> -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<nav class="navbar fixed-top navbar-light bg-faded" >
	<a href="setting" style="margin-top:15px; float: left;"><img src="images/setting.png" style="width: 30px;"></a>
	<div class="chaticon" style="width:120px;  margin-top: 10px; float: left;" >
	  		<div>
	  		<img  src='resources/img/btn/chat.png' style="width:35px; margin-top:10px; margin-left:-350px; float: left;">
	  		</div>
	  		<div style="margin-top:13px; margin-left: -710px;">
	  		<h5 style="font: bold;">X${sessionScope.chatcount}</h5>
	  		</div>
		</div>

    <!-- 알람기능 버튼 -->
    <div class="dropdown nav-button notifications-button hidden-sm-down" id="cnt" value="" style="display:block; float: left; opacity: 0.9">

      <a class="btn btn-secondary dropdown-toggle" href="#" id="notifications-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
        <i id="notificationsIcon" class="fa fa-bell-o" aria-hidden="true" style="margin-right: 380px; "></i>
        <span id="notificationsBadge" class="badge badge-danger"><i class="fa fa-spinner fa-pulse fa-fw" aria-hidden="true"></i></span>
      </a>
      
      	
		
      <div class="dropdown-menu notification-dropdown-menu" aria-labelledby="notifications-dropdown">
        <h6 class="dropdown-header">알람</h6>

        <a id="notificationsLoader" class="dropdown-item dropdown-notification" href="#" >
          <p class="notification-solo text-center"><i id="notificationsIcon" class="fa fa-spinner fa-pulse fa-fw" aria-hidden="true"></i> 알람을 불러오는중.... </p>
        </a>
		<!-- 밑에 알람내용이 입력됨 -->
        <div id="notificationsContainer" class="notifications-container"></div>

        <a id="notificationAucune" class="dropdown-item dropdown-notification" href="#">
          <p class="notification-solo text-center">새로운 알람이 없습니다.</p>
        </a>

        <a class="dropdown-item dropdown-notification-all">
          	알람을 클릭시 해당 웹페이지로 이동합니다.
        </a>
      </div>
      	

    </div>


 
 </nav>


 	  <script id="notificationTemplate" type="text/html">
    <a class="dropdown-item dropdown-notification" href="{{href}}">
      <div class="notification-read">
        <i class="fa fa-times" aria-hidden="true"></i>
      </div>
      <img class="notification-img" src="https://placehold.it/48x48" alt="Icone Notification" />
      <div class="notifications-body">
        <p class="notification-texte">{{texte}}</p>
        <p class="notification-date text-muted">
          <i class="fa fa-clock-o" aria-hidden="true"></i> {{date}}
        </p>
      </div>
    </a>
  </script>