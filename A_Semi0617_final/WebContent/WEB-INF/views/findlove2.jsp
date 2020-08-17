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

<!-- 이동현 -->

<div id="colorlib-main">
	<section class="ftco-section"
		style="background-image: url(resources/img/headerimg.png); height: 5em">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-12 ftco-animate text-center">
					<h1 class="bread" style="color: white;">
						<b>연예인 닮은 꼴 찾기</b>
					</h1>
				</div>
			</div>
		</div>
	</section>
	<br>
	<p style="color: orange; text-align: center;">*이상형 인 연예인의 이름을
		적어주세요*</p>
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
										<h6>나와 닮은 연예인은 ( )입니다.</h6>
										<br> <br> <br>
										<h4>% 닮은꼴</h4>
									</div>
								</div>
							</div>
							<!-- 추천인 얼굴 -->
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
							<!-- 추천인 얼굴 끝 -->
							<!-- 추천인 정보 및 버튼(좋아요, 프로필보기, 채팅하기, 블락하기) -->
							<div class="col-xs-4 col-sm-4 col-md-4"
								style="text-align: center; float: left">
								<div class="single-team">
									<div style="height: 430px; padding-top: 10%;">
										<h3>${profile.NICKNAME }</h3>
										<p>${profile.BIRTH }</p>
										<br>
										<h5>${profile.USER_INTRO }</h5>

										<!-- 버튼 구현 -->
										<div style="position: fixed; bottom: 25px;">

											<!-- 블락 추가 구현 -->
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
														data-placement="top" title="추천 제외 취소" />
												</c:when>
												<c:otherwise>
													<img id="${profile.USER_NUM}" class="blockox"
														style="width: 15%; cursor: pointer;"
														src="resources/img/btn/dislike.png" data-toggle="tooltip"
														data-placement="top" title="추천에서 제외" />
												</c:otherwise>
											</c:choose>
											<!-- 블락 추가 구현 끝 -->

											<!-- 프로필 이동 구현 -->
											<img src="resources/img/btn/profile.png"
												style="width: 15%; cursor: pointer;" onclick="profile()"
												data-toggle="tooltip" data-placement="top" title="상세 프로필 보기">
											<!-- 프로필 이동 끝 -->

											<img src="resources/img/btn/chat.png"
												style="width: 15%; cursor: pointer;" onclick="chatting()"
												data-toggle="tooltip" data-placement="top" title="채팅하기">

											<!-- 좋아요 버튼 구현 -->
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
														data-placement="top" title="좋아요 취소" />
												</c:when>
												<c:otherwise>
													<img id="${profile.USER_NUM}" class="heart"
														style="width: 15%; cursor: pointer;"
														src="resources/img/btn/heartoff.png" data-toggle="tooltip"
														data-placement="top" title="좋아요" />
												</c:otherwise>
											</c:choose>
											<!-- 좋아요 버튼 끝 -->
										</div>
										<!-- 버튼 구현 끝 -->
									</div>
								</div>
							</div>
							<!-- 추천인 정보 및 버튼 끝 -->
							<br>
						</div>
					</div>
					<br>
				</div>
				<!-- 이전 페이지 및 다음 페이지 -->
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
				<!-- 이전 페이지 및 다음 페이지 끝 -->
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
		//하트 눌렀을 때, 하트 on/off 모양 변화		
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
										"resources/img/btn/heartoff.png"); //하트 버림
								$(this).attr('data-original-title', '좋아요')
										.tooltip('show');
								like = 'false';

							} else if ($(this).attr("src") === "resources/img/btn/heartoff.png") {

								$(this).attr("src",
										"resources/img/btn/hearton.png"); //하트 채움
								$(this).attr('data-original-title', '좋아요 취소')
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

		//좋아요 유무 값 받아와서 띄우기   
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

			var blockon = "resources/img/btn/dislike.png"; //블락 하기
			var blockoff = "resources/img/btn/like.png"; //블락 해제

			var user_num = $
			{
				sessionScope.user_num
			}
			;

			if ($(this).attr("src") === blockon) {
				$(this).attr("src", "resources/img/btn/like.png"); //블락취소
				$(this).attr('data-original-title', '추천 제외 취소').tooltip('show')
				block = 'true';
			} else if ($(this).attr("src") === blockoff) {
				$(this).attr("src", "resources/img/btn/dislike.png"); //블락
				$(this).attr('data-original-title', '추천에서 제외').tooltip('show')
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
		//상세 프로필로 이동 시 파라미터값 controller로 넘김
		function profile() {
			$("#profile").submit();
		};

		//채팅.
		function chatting() {
			$('#profile').attr("action", "chatting");
			$('#profile').submit();
		}
	</script>

	

	

	

	<script>
		//이전페이지 이동
		function prevProfile() {
			$("#prevProfile").submit();
		}

		//다음페이지 이동
		function nextProfile() {
			//alert($("#num").val());
			if ($("#num").val() > 10) {
				alert("오늘 볼 수 있는 인원을 전부 소진했습니다.");
			} else {
				$("#nextProfile").submit();
			}

		}
	</script>

	<script>
		//tooltip 기능 구현
		$(document).ready(function() {
			$('[data-toggle="tooltip"]').tooltip();
		});
	</script>

	<%@ include file="footer.jsp"%>