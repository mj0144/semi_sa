<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!-- <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a> -->
<aside id="colorlib-aside" role="complementary"
   class="js-fullheight text-center">
   	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- �˶� ��ũ��Ʈ -->
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
							// �˶�����
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
		
								// �ʱ�ȭ
								init : function() {
									$("#notificationsBadge").hide();
									$("#notificationAucune").hide();
		
									// Ŭ�� �˸��� ���ε�
									$("#notifications-dropdown").on('click', function() {
										var open = $("#notifications-dropdown").attr("aria-expanded");
										if (open === "false") {
											appNotifications.loadAll();
										}
		
									});
		
									// �˶��ҷ�����
									appNotifications.loadAll();
		
									// ��ư�� �˶�����
									setInterval(function() {
										appNotifications.loadNumber();
									}, 30000);
		
									// �˶����� ����
									$('.notification-read-desktop').on('click', function(event) {
										appNotifications.markAsReadDesktop(event, $(this));
									});
		
								},
		
								loadAll : function() {
		
									// �˶��� ���� ���
									if (count !== lastCount || count === 0) {
										appNotifications.load();
									}
									appNotifications.loadNumber();
		
								},
		
								badgeLoadingMask : function(show) {
									if (show === true) {
										$("#notificationsBadge").html(appNotifications.badgeSpinner);
										$("#notificationsBadge").show();
										// �����
										$("#notificationsBadgeMobile").html(count);
										$("#notificationsBadgeMobile").show();
									} else {
										$("#notificationsBadge").html(count);
										if (count > 0) {
											$("#notificationsIcon").removeClass("fa-bell-o");
											$("#notificationsIcon").addClass("fa-bell");
											$("#notificationsBadge").show();
											// �����
											$("#notificationsIconMobile").removeClass("fa-bell-o");
											$("#notificationsIconMobile").addClass("fa-bell");
											$("#notificationsBadgeMobile").show();
										} else {
											$("#notificationsIcon").addClass("fa-bell-o");
											$("#notificationsBadge").hide();
											// �����
											$("#notificationsIconMobile").addClass("fa-bell-o");
											$("#notificationsBadgeMobile").hide();
										}
		
									}
								},
		
								// �˶��� �������� Ȯ��
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
		
								// �˶� �ε�
								load : function() {
									appNotifications.loadingMask(true);
		
									$('#notificationsContainer').html("");
		
									// �˶�����
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
		
								// �˶��� �д»��·� ǥ��
								markAsRead : function(event, elem) {
									// ��Ͽ���
									event.preventDefault();
									event.stopPropagation();
		
									// �˶�����
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
							alert("������ ��� ����");
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
         <li><a href="viewsaju">���ֺ���</a></li>
         <li><a href="feed">�ǵ�</a></li>
         <li><a href="chat.do">ä��</a></li>
         <li><a href="listWhole">�ο� ��õ</a></li>
         <li><a href="findlove">������ ���� ��</a></li>
         <li><a href="mypage">����������</a></li>
         <li><a href="pay">Shop</a></li>
         <li><a href="qnapage">Q&A</a></li>
         <li><a href="/AFinal/">�α׾ƿ�</a></li>
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