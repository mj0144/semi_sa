<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- ���ƿ� �� ���ƿ� ���  -->
<script>
 	function toggleImage() {
		var like = 'false';
		
		var hearton = "images/hearton.png"; //���ִ� ��Ʈ
		var heartoff = "images/heartoff.png"; //����ִ� ��Ʈ
		
		console.log("�۾��� : " + $('#friend_num').val());
		
		
		var user_num = ${sessionScope.user_num};
		
		if ($('#img1').attr("src") === hearton) {
				$('#img1').attr("src", "images/heartoff.png"); //��Ʈ ����
				like='false';
			//console.log(${param.op_num});
		} else {
				$('#img1').attr("src", "images/hearton.png"); //��Ʈ ä��
				like='true';
		}
		
		var param = {"like" : like, "liked_user" : $('#friend_num').val(), "user_num": user_num};

		ajax(param);
	}
	
	function ajax(param){			
		$.ajax({
				url : "likeox",
				type : "post",
				data : param,
				success : function(data){
					
				},
				error : function(){
					
				}
			});
	}

</script>

<!-- ��� �� ��� ���  -->
<script>

	function blockImage() {
		
		var block = 'false';
		
		var blockon = "images/blockon.png"; //����� ����(������)
		var blockoff = "images/blockoff.png"; //��� ���� ����(���)
		
		console.log("�۾��� : " + $('#friend_num').val());
		
		
		var user_num = ${sessionScope.user_num};
		
		if ($('#img2').attr("src") === blockon) {
				$('#img2').attr("src", "images/blockoff.png"); //������
				block='false';
			//console.log(${param.op_num});
		} else {
				$('#img2').attr("src", "images/blockon.png"); //���
				block='true';
		}
		
		var pm = {"block" : block, "blocked_user" : $('#friend_num').val()};
		
		blocked(pm);

	}
	
	function blocked(pm){
		
		console.log("������?");
		
		$.ajax({
				url : "blockox",
				type : "post",
				data : pm,
				success : function(data){
					
				},
				error : function(){
					
				}
			});
	}


</script>

<div id="colorlib-main">
	<section class="ftco-section ftco-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-8 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index">Home</a></span> <span
							class="mr-2"><a href="listSome">ģ��ã��</a></span> <span>������</span>
					</p>
					<h1 class="bread">${membervo.name} </h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section">
		<div class="hero-wrap" style="margin-bottom: -75px; margin-left: -27px;">
			<div class="overlay"></div>
			<div class="d-flex">
				<div class="author-image text img p-md-5"
					style="background-image: url(resources/upload/${membervo.user_img});">
				</div>
				<div class="author-info text p-4 p-md-5 mt-5 mb-5">
					<div class="desc">
						<div style="margin-top: -100px; margin-bottom: 40px;">
							<p style="text-align: center; float: left;">
								���ƿ� &nbsp;
								<!-- <img id="img1" src="images/heart1.png" onclick="toggleImage();"> -->
								<c:choose>
									<c:when test="${heartchk == 1}">
										<img id="img1" src="images/hearton.png" onclick="toggleImage()"/>
									</c:when>
									<c:otherwise>
										<img id="img1" src="images/heartoff.png" onclick="toggleImage()"/>
									</c:otherwise>
								</c:choose>
								<input type="hidden" name="friend_num" id="friend_num" value="${board_writer }"/>
							</p>
							<p style="text-align: center; margin-left: -300px;">
							<!-- 	<a href="#">ä���ϱ�<img src="images/chat.png" style="margin-left: 10px;"></a> -->
							</p>
							<!-- ��� �� ��� ��� -->
							<p style="text-align: center; float: right;">
								���� &nbsp;
								<c:choose>
									<c:when test="${blockchk == 1}">
										<img id="img2" src="images/blockon.png" onclick="blockImage()" style="width: 50px;"/>
									</c:when>
									<c:otherwise>
										<img id="img2" src="images/blockoff.png" onclick="blockImage()" style="width: 50px;"/>
									</c:otherwise>
								</c:choose>
							</p>
							<!-- ��� �� -->
						</div>
						<br>
						<h1 class="mb-4">
							<span>���� ${membervo.name}�Դϴ�</span>
						</h1>
						<p class="mb-4">${membervo.user_intro}</p>
						<h3 class="signature h1">Eric</h3>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="ftco-section ftco-counter img" id="section-counter"
		style="background-image: url(images/bg_1.jpg); padding: -50px 0;">
		<div class="container">
			<div class="row justify-content-start">
				<div class="col-md-10">
					<div class="row">

						<div
							class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18">
								<div class="text d-flex align-items-center">
									<span> </span>
								</div>
							</div>
						</div>
						<div
							class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18">
								<div class="text d-flex align-items-center">
									<span>���� ���ƿ�</span>
									<strong class="number" data-number="${liked_cnt}">0</strong> 
								</div>
							</div>
						</div>
						<div
							class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18">
								<div class="text d-flex align-items-center">
									<span>���� ���ƿ�</span>
									<strong class="number" data-number="${like_cnt}">0</strong> 
								</div>
							</div>
						</div>
						<div
							class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18">
								<div class="text d-flex align-items-center">
									<span>�Խñ�</span>
									<strong class="number" data-number="${board_cnt}">0</strong> 
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
				<section class="ftco-section-3">
		<div class="photograhy">
			<div class="row">
			<c:forEach var="e" items="${blist }">
				<div class="col-md-4 ftco-animate">
					<a href="board?board_num=${e.board_num }">
						<img src="resources/upload/${e.board_img }" class="photography-entry img d-flex justify-content-start align-items-end" style="width: 420px;">
						<div class="overlay"></div>
					</a>
				</div>
			</c:forEach>
			</div>
		</div>
	</section>
	<%@include file="footer.jsp"%>