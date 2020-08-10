/*$(function() {
			setInterval(function () {
				var notifyuser = $("#sessionNum").val();
				var param = new Object();
				if(notifyuser == null || notifyuser == ''){
					alert("로그인이 만료되었거나 로그아웃되었습니다.");
					return;
				}
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

							// 알람내용
							var notifications = new Array();
							notifications.push({
								href : "#",
								image : "Modification",
								texte : "Votre incident " + makeBadge("17-0253") + " 내용이지롱",
								date : "요기는 날짜지롱!"
							});
							notifications.push({
								href : "#",
								image : "Modification",
								texte : "Votre incident " + makeBadge("17-0253") + " 내용이지롱",
								date : "요기는 날짜지롱!"
							});
							notifications.push({
								href : "#",
								image : "Modification",
								texte : "Votre incident " + makeBadge("17-0253") + " 내용이지롱",
								date : "요기는 날짜지롱!"
							});
							notifications.push({
								href : "#",
								image : "Modification",
								texte : "Votre incident " + makeBadge("17-0253") + " 내용이지롱",
								date : "요기는 날짜지롱!"
							});
							notifications.push({
								href : "#",
								image : "Modification",
								texte : "Votre incident " + makeBadge("17-0253") + " 내용이지롱",
								date : "요기는 날짜지롱!"
							});
							notifications.push({
								href : "#",
								image : "Modification",
								texte : "Votre incident " + makeBadge("17-0253") + " 내용이지롱",
								date : "요기는 날짜지롱!"
							});

							function makeBadge(texte) {
								return "<span class=\"badge badge-default\">" + texte + "</span>";
							}

							appNotifications = {

								// 초기화
								init : function() {
									console.log(count);
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
									}, 180000);

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
		})*/