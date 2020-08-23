<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!-- <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a> -->
<aside id="colorlib-aside" role="complementary"
   class="js-fullheight text-center">
   	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- 알람 스크립트 -->
	<script>
			setTimeout(function notifyList(){
				var notifyuser = $("#sessionNum").val();
				var param = new Object();
				param.notifyuser = notifyuser;
				var paramJson = JSON.stringify(param);
				$.ajax({
					url : "notifycations",
					contentType: "application/json; charset=utf-8",
					type : "POST",
					data : paramJson,
					dataType: "json",
					success: function (res) {
						if(res.result == "success"){
							var count = res.cnt;
							var lastCount = 0;
							var list = res.list;
							// 알람내용
							var notifications = new Array();
							for(var i=0; i<list.length; i++){
								var map = list[i];
								notifications.push({
									href : map["NOTIFYLINK"],
									image : map["USER_IMG"],
									texte : map["NOTIFYCONTENT"],
									date : map["NOTIFYDATE"]
								});
							}
							function makeBadge(texte) {
								return "<span class=\"badge badge-default\">" + texte + "</span>";
							}
		
							appNotifications = {
		
								// 초기화
								init : function() {
									$("#notificationsBadge").hide();
									$("#notificationAucune").hide();
		
									// 클릭 알림을 바인딩
									$("#notifications-dropdown").on('click', function() {
										var open = $("#notifications-dropdown").attr("aria-expanded");
										if (open === "false") {
											appNotifications.loadAll();
										}
		
									});
		
									// 알람불러오기
									appNotifications.loadAll();
		
									// 버튼속 알람숫자
									setInterval(function() {
										appNotifications.loadNumber();
									}, 30000);
		
									// 알람내역 띄우기
									$('.notification-read-desktop').on('click', function(event) {
										appNotifications.markAsReadDesktop(event, $(this));
									});
		
								},
		
								loadAll : function() {
		
									// 알람이 없는 경우
									if (count !== lastCount || count === 0) {
										appNotifications.load();
									}
									appNotifications.loadNumber();
		
								},
		
								badgeLoadingMask : function(show) {
									if (show === true) {
										$("#notificationsBadge").html(appNotifications.badgeSpinner);
										$("#notificationsBadge").show();
										// 모바일
										$("#notificationsBadgeMobile").html(count);
										$("#notificationsBadgeMobile").show();
									} else {
										$("#notificationsBadge").html(count);
										if (count > 0) {
											$("#notificationsIcon").removeClass("fa-bell-o");
											$("#notificationsIcon").addClass("fa-bell");
											$("#notificationsBadge").show();
											// 모바일
											$("#notificationsIconMobile").removeClass("fa-bell-o");
											$("#notificationsIconMobile").addClass("fa-bell");
											$("#notificationsBadgeMobile").show();
										} else {
											$("#notificationsIcon").addClass("fa-bell-o");
											$("#notificationsBadge").hide();
											// 모바일
											$("#notificationsIconMobile").addClass("fa-bell-o");
											$("#notificationsBadgeMobile").hide();
										}
		
									}
								},
		
								// 알람이 켜지는지 확인
								loadingMask : function(show) {
		
									if (show === true) {
										$("#notificationAucune").hide();
										$("#notificationsLoader").show();
									} else {
										$("#notificationsLoader").hide();
										if (count > 0) {
											$("#notificationAucune").hide();
										} else {
											$("#notificationAucune").show();
										}
									}
		
								},
		
								loadNumber : function() {
									appNotifications.badgeLoadingMask(true);
		
									setTimeout(function() {
										$("#notificationsBadge").html(count);
										appNotifications.badgeLoadingMask(false);
									}, 1000);
								},
		
								// 알람 로드
								load : function() {
									appNotifications.loadingMask(true);
		
									$('#notificationsContainer').html("");
		
									// 알람갯수
									lastCount = count;
		
									setTimeout(function() {
		
										for (i = 0; i < count; i++) {
		
											var template = $('#notificationTemplate').html();
											template = template.replace("{{href}}",
													notifications[i].href);
											template = template.replace("{{image}}",
													notifications[i].image);
											template = template.replace("{{texte}}",
													notifications[i].texte);
											template = template.replace("{{date}}",
													notifications[i].date);
		
											$('#notificationsContainer').append(template);
										}
		
										$('.notification-read').on('click', function(event) {
											appNotifications.markAsRead(event, $(this));
										});
		
										appNotifications.loadingMask(false);
		
										$("#notifications-dropdown").prop("disabled", false);
									}, 1000);
								},
		
								// 알람을 읽는상태로 표시
								markAsRead : function(event, elem) {
									// 목록열기
									event.preventDefault();
									event.stopPropagation();
		
									// 알람삭제
									elem.parent('.dropdown-notification').remove();
		
									// TEMP : pour le template
									count--;
		
									appNotifications.loadAll();
								},
		
								// Marquer une notification comme lue version bureau
								markAsReadDesktop : function(event, elem) {
									// Permet de ne pas change de page
									event.preventDefault();
									event.stopPropagation();
		
									// Suppression de la notification
									elem.parent('.dropdown-notification').removeClass(
											"notification-unread");
									elem.remove();
		
									// On supprime le focus
									if (document.activeElement) {
										document.activeElement.blur();
									}
									// TEMP : pour le template
									count--;
		
									appNotifications.loadAll();
								},
								add : function() {
									lastCount = count;
									count++;
								},
								// Template du badge
								badgeSpinner : '<i class="fa fa-spinner fa-pulse fa-fw" aria-hidden="true"></i>'
							};
							appNotifications.init();
		
						}else {
							alert("서버와 통신 문제");
						}
					},
					error: function (request,status,error) {
						alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
					}
				});
		}, 1000);
	</script>

 
<%@include file="notications.jsp"%>
	
   <h1 id="colorlib-logo">
      <a href="mypage"><span class="img"
         style="background-image: url(resources/upload/${sessionScope.user_img});"></span>
         
         <img id='gradeImg' src="" style="width: 50px; "/>
         
         
         
         ${sessionScope.name }</a>
   </h1>
   
	
		
   <nav id="colorlib-main-menu" role="navigation" style="margin-top: 20px;">
      <ul style="line-height: 2;">
         <li class="colorlib-active"><a href="index">Home</a></li>
         <li><a href="viewsaju">사주보기</a></li>
         <li><a href="feed">피드</a></li>
         <li><a href="chat.do">채팅</a></li>
         <li><a href="listWhole">인연 추천</a></li>
         <li><a href="findlove">연예인 닮은 꼴</a></li>
         <li><a href="mypage">마이페이지</a></li>
         <li><a href="pay">Shop</a></li>
         <li><a href="qnapage">Q&A</a></li>
         <li><a href="/AFinal/">로그아웃</a></li>
      </ul>
      <h3>
         <img src="images/heart.png">
      </h3>
      

   </nav>
</aside>
<script>
	$(function(){
		$('#gradeImg').attr('src', 'resources/img/grade/'+ '${sessionScope.grade_name}' +'.png')
	})
		
	</script>
<!-- END COLORLIB-ASIDE -->