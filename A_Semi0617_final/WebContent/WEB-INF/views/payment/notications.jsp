<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="resources/css/notifycations.css" rel="stylesheet" id="bootstrap-css">
<!-- <script src="resources/js/notifycations.js"></script> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet" />
<nav class="navbar fixed-top navbar-light bg-faded">
	
	<a href="setting" style="margin-top:20px; margin-left:30px; float: left; position: absolute; z-index: 11"><img src="images/setting.png" style="width: 30px;"></a>
	<div class="chaticon" style="width:120px;  margin-top: 10px; float: left;" >
	  		<div>
	  		<img  src='resources/img/btn/chat1.png' style="width:40px; margin-left:280px; margin-top:10px; float: left; ">
	  		</div>
	  		<div style="margin-top:20px; width:295px; margin-left: 90px;">
		  		<div style="float: left; margin-left: 5px ">
		  		<h6 style="font: bold;">X</h6>
		  		</div>
				<div>
				<h6 style="font: bold;">
		  		<c:choose>
		  			<c:when test="${sessionScope.grade_name =='vip' ||sessionScope.grade_name =='vvip'}">
		  				������</h6>
		  			</c:when>
		  			<c:otherwise>
		  				${sessionScope.chatcount}</h6>
		  			</c:otherwise>
		  		</c:choose>
				</div>

	  		
	  		</div>
		</div>

    <!-- �˶���� ��ư -->
    <div class="dropdown nav-button notifications-button hidden-sm-down" id="cnt" value="" style="display:block; float: left; opacity: 0.9">

      <a class="btn btn-secondary dropdown-toggle" href="#" id="notifications-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
        <i id="notificationsIcon" class="fa fa-bell-o" aria-hidden="true" style="margin-right: 380px; "></i>
        <span id="notificationsBadge" class="badge badge-danger"><i class="fa fa-spinner fa-pulse fa-fw" aria-hidden="true"></i></span>
      </a>
      
      	
		
      <div class="dropdown-menu notification-dropdown-menu" aria-labelledby="notifications-dropdown">
        <h6 class="dropdown-header">�˶�</h6>

        <a id="notificationsLoader" class="dropdown-item dropdown-notification" href="#" >
          <p class="notification-solo text-center"><i id="notificationsIcon" class="fa fa-spinner fa-pulse fa-fw" aria-hidden="true"></i> �˶��� �ҷ�������.... </p>
        </a>
		<!-- �ؿ� �˶������� �Էµ� -->
        <div id="notificationsContainer" class="notifications-container"></div>

        <a id="notificationAucune" class="dropdown-item dropdown-notification" href="#">
          <p class="notification-solo text-center">���ο� �˶��� �����ϴ�.</p>
        </a>

        <a class="dropdown-item dropdown-notification-all">
          	�˶��� Ŭ���� �ش� ���������� �̵��մϴ�.
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