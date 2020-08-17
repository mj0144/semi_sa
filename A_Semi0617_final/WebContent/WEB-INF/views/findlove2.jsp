<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/css/viewsaju3.css">
<link rel="stylesheet" href="resources/css/checkbox.css">
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
<c:set var="tf" value="true" />

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<!-- �̵��� -->

<div id="colorlib-main">
	<section class="ftco-section"
		style="background-image: url(resources/img/headerimg.png); height: 5em">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-12 ftco-animate text-center">
					<h1 class="bread" style="color: white;">
						<b>������ ���� �� ã��</b>
					</h1>
				</div>
			</div>
		</div>
	</section>
	<br>
	<p style="color: orange; text-align: center;">*�̻��� �� �������� �̸���
		�����ּ���*</p>
	<div class="col-sm-12 pull-center well" style="margin-left: 400px;">
		<form class="form-inline" action="lovesearch" method="post">

			<div class="input-group custom-search-form">

				<input type="text" name="looklike" class="form-control"
					placeholder="Search..."
					style="width: 400px; border-radius: 10px 10px 10px 10px; border: 0.5px solid;">
				&nbsp;&nbsp;&nbsp; <span class="input-group-btn">
					<button class="btn btn-default" id="searchbtn" type="submit"
						style="height: 52px; width: 75px; border-radius: 10px 10px 10px 10px; background-color: black; color: white; border: 0.5px solid;">
						search</button>
				</span>
			</div>
		</form>
	</div>
	<hr>
	<section class="ftco-section contact-section">
		<div class="container ">
			<div class="row ">
				<div class="col-xs-12 col-sm-6 col-md-12"
					style="text-align: center;">
					<div class="single-team"></div>
					
					<br>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="col-xs-12 col-sm-6 col-md-12"
					style="text-align: center;">
					<div class="" style="border: 1px solid #D8D8D8; height: 435px">
						<div class="explain">
							<div class="col-xs-4 col-sm-4 col-md-4"
								style="text-align: center; float: left">
								<div class="single-team">
									<div style="height: 430px">
										<br> <br> <br>
										<h6>���� ���� �������� ( )�Դϴ�.</h6>
										<br> <br> <br>
										<h4>% ������</h4>
									</div>
								</div>
							</div>
							<!-- ��õ�� �� -->
							<div class="col-xs-4 col-sm-4 col-md-4"
								style="text-align: center; float: left">
								<div class="single-team">
									<div style="height: 430px">
										<img class="center-block"
											src="resources/upload/${profile.USER_IMG }"
											alt="profile_photo" style="height: 100%; width: 100%">
									</div>
								</div>
							</div>
							<!-- ��õ�� �� �� -->
							<!-- ��õ�� ���� �� ��ư(���ƿ�, �����ʺ���, ä���ϱ�, ����ϱ�) -->
							<div class="col-xs-4 col-sm-4 col-md-4"
								style="text-align: center; float: left">
								<div class="single-team">
									<div style="height: 430px; padding-top: 10%;">
										<h3>${profile.NICKNAME }</h3>
										<p>${profile.BIRTH }</p>
										<br>
										<h5>${profile.USER_INTRO }</h5>

										<!-- ��ư ���� -->
										<div style="position: fixed; bottom: 25px;">

											<!-- ��� �߰� ���� -->
											<c:set var="blockox" value="false" />
											<c:forEach var="g" items="${set.blist }">
												<c:choose>
													<c:when test="${g == profile.USER_NUM}">
														<c:set var="blockox" value="true" />
													</c:when>
												</c:choose>
											</c:forEach>

											<c:choose>
												<c:when test="${blockox == 'true'}">
													<img id="${profile.USER_NUM}" class="blockox"
														style="width: 15%; cursor: pointer;"
														src="resources/img/btn/like.png" data-toggle="tooltip"
														data-placement="top" title="��õ ���� ���" />
												</c:when>
												<c:otherwise>
													<img id="${profile.USER_NUM}" class="blockox"
														style="width: 15%; cursor: pointer;"
														src="resources/img/btn/dislike.png" data-toggle="tooltip"
														data-placement="top" title="��õ���� ����" />
												</c:otherwise>
											</c:choose>
											<!-- ��� �߰� ���� �� -->

											<!-- ������ �̵� ���� -->
											<img src="resources/img/btn/profile.png"
												style="width: 15%; cursor: pointer;" onclick="profile()"
												data-toggle="tooltip" data-placement="top" title="�� ������ ����">
											<!-- ������ �̵� �� -->

											<img src="resources/img/btn/chat.png"
												style="width: 15%; cursor: pointer;" onclick="chatting()"
												data-toggle="tooltip" data-placement="top" title="ä���ϱ�">

											<!-- ���ƿ� ��ư ���� -->
											<c:set var="hearton" value="false" />
											<c:forEach var="g" items="${heart }">
												<c:choose>
													<c:when test="${g.liked_user == profile.USER_NUM}">
														<c:set var="hearton" value="true" />
													</c:when>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${hearton == 'true'}">
													<img id="${profile.USER_NUM}" class="heart"
														style="width: 15%; cursor: pointer;"
														src="resources/img/btn/hearton.png" data-toggle="tooltip"
														data-placement="top" title="���ƿ� ���" />
												</c:when>
												<c:otherwise>
													<img id="${profile.USER_NUM}" class="heart"
														style="width: 15%; cursor: pointer;"
														src="resources/img/btn/heartoff.png" data-toggle="tooltip"
														data-placement="top" title="���ƿ�" />
												</c:otherwise>
											</c:choose>
											<!-- ���ƿ� ��ư �� -->
										</div>
										<!-- ��ư ���� �� -->
									</div>
								</div>
							</div>
							<!-- ��õ�� ���� �� ��ư �� -->
							<br>
						</div>
					</div>
					<br>
				</div>
				<!-- ���� ������ �� ���� ������ -->
				<div class="col-xs-4 col-sm-4 col-md-12" style="text-align: center;">
					<c:if test="${num != 1 }">
						<img src="resources/img/btn/back.png"
							style="width: 5em; float: left; cursor: pointer;"
							onclick="prevProfile()">
					</c:if>
					<img src="resources/img/btn/forword.png"
						style="width: 5em; float: right; cursor: pointer;"
						onclick="nextProfile()">
				</div>
				<!-- ���� ������ �� ���� ������ �� -->
			</div>
		</div>
	</section>


	<form action="friend" method="post" id="profile">
		<input type="hidden" name="user_num" id="user_num"
			value="${profile.USER_NUM }">
	</form>

	<form action="listWhole" method="post" id="prevProfile">
		<input type="hidden" name="num" value="${num -1 }"> <input
			type="hidden" name="sex" value="${set.sex }"> <input
			type="hidden" name="samb" value="${set.samb }">
	</form>

	<form action="listWhole" method="post" id="nextProfile">
		<input type="hidden" id="num" name="num" value="${num +1 }"> <input
			type="hidden" name="sex" value="${set.sex }"> <input
			type="hidden" name="samb" value="${set.samb }">
	</form>

	<!-- Modal -->
	<div class="modal fade" id="modalall" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-scrollable" role="document"
			aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
			<div class="modal-content"></div>
		</div>
	</div>




	<script>
		//��Ʈ ������ ��, ��Ʈ on/off ��� ��ȭ		
		$(document)
				.on(
						'click',
						'.heart',
						function(event) {
							var like = 'false';
							var user_num = $
							{
								sessionScope.user_num
							}
							;

							if ($(this).attr("src") === "resources/img/btn/hearton.png") {

								$(this).attr("src",
										"resources/img/btn/heartoff.png"); //��Ʈ ����
								$(this).attr('data-original-title', '���ƿ�')
										.tooltip('show');
								like = 'false';

							} else if ($(this).attr("src") === "resources/img/btn/heartoff.png") {

								$(this).attr("src",
										"resources/img/btn/hearton.png"); //��Ʈ ä��
								$(this).attr('data-original-title', '���ƿ� ���')
										.tooltip('show')
								like = 'true';
							}
							var param = {
								"like" : like,
								"liked_user" : $(this).attr("id"),
								"user_num" : user_num
							};

							ajax(param);

						});

		//���ƿ� ���� �� �޾ƿͼ� ����   
		function ajax(param) {
			$.ajax({
				url : "likeox",
				type : "post",
				data : param,
				success : function(data) {

				},
				error : function() {

				}
			});
		}
	</script>

	<script>
		$(document).on('click', '.blockox', function(event) {

			var block = 'false';

			var blockon = "resources/img/btn/dislike.png"; //��� �ϱ�
			var blockoff = "resources/img/btn/like.png"; //��� ����

			var user_num = $
			{
				sessionScope.user_num
			}
			;

			if ($(this).attr("src") === blockon) {
				$(this).attr("src", "resources/img/btn/like.png"); //������
				$(this).attr('data-original-title', '��õ ���� ���').tooltip('show')
				block = 'true';
			} else if ($(this).attr("src") === blockoff) {
				$(this).attr("src", "resources/img/btn/dislike.png"); //���
				$(this).attr('data-original-title', '��õ���� ����').tooltip('show')
				block = 'false';
			}

			var pm = {
				"block" : block,
				"blocked_user" : $('#user_num').val()
			};

			blocked(pm);

		});

		function blocked(pm) {

			$.ajax({
				url : "blockox",
				type : "post",
				data : pm,
				success : function(data) {
				},
				error : function(request, error) {
					console.log("code:" + request.status + "\n" + "message:"
							+ request.responsetext + "\n" + "error:" + error);
				}
			});
		}
	</script>

	<script>
		//�� �����ʷ� �̵� �� �Ķ���Ͱ� controller�� �ѱ�
		function profile() {
			$("#profile").submit();
		};

		//ä��.
		function chatting() {
			$('#profile').attr("action", "chatting");
			$('#profile').submit();
		}
	</script>

	

	

	

	<script>
		//���������� �̵�
		function prevProfile() {
			$("#prevProfile").submit();
		}

		//���������� �̵�
		function nextProfile() {
			//alert($("#num").val());
			if ($("#num").val() > 10) {
				alert("���� �� �� �ִ� �ο��� ���� �����߽��ϴ�.");
			} else {
				$("#nextProfile").submit();
			}

		}
	</script>

	<script>
		//tooltip ��� ����
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>

	<%@ include file="footer.jsp"%>