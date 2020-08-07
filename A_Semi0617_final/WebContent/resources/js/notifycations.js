/*$(function() {
			setInterval(function () {
				var notifyuser = $("#sessionNum").val();
				var param = new Object();
				if(notifyuser == null || notifyuser == ''){
					alert("�α����� ����Ǿ��ų� �α׾ƿ��Ǿ����ϴ�.");
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

							// �˶�����
							var notifications = new Array();
							notifications.push({
								href : "#",
								image : "Modification",
								texte : "Votre incident " + makeBadge("17-0253") + " ����������",
								date : "���� ��¥����!"
							});
							notifications.push({
								href : "#",
								image : "Modification",
								texte : "Votre incident " + makeBadge("17-0253") + " ����������",
								date : "���� ��¥����!"
							});
							notifications.push({
								href : "#",
								image : "Modification",
								texte : "Votre incident " + makeBadge("17-0253") + " ����������",
								date : "���� ��¥����!"
							});
							notifications.push({
								href : "#",
								image : "Modification",
								texte : "Votre incident " + makeBadge("17-0253") + " ����������",
								date : "���� ��¥����!"
							});
							notifications.push({
								href : "#",
								image : "Modification",
								texte : "Votre incident " + makeBadge("17-0253") + " ����������",
								date : "���� ��¥����!"
							});
							notifications.push({
								href : "#",
								image : "Modification",
								texte : "Votre incident " + makeBadge("17-0253") + " ����������",
								date : "���� ��¥����!"
							});

							function makeBadge(texte) {
								return "<span class=\"badge badge-default\">" + texte + "</span>";
							}

							appNotifications = {

								// �ʱ�ȭ
								init : function() {
									console.log(count);
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
									}, 180000);

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
		})*/