<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
	function toggleImage() {
		var hearton = "images/heart2.png";
		var heartoff = "images/heart1.png";

		if ($('#img1').attr("src") === hearton) {
			$('#img1').attr("src", "images/heart1.png");

		} else {
			$('#img1').attr("src", "images/heart2.png");

		}
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
							class="mr-2"><a href="listSome">친구찾기</a></span> <span>프로필</span>
					</p>
					<h1 class="bread">상대방 프로필</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section">
		<div class="hero-wrap" style="margin-bottom: -75px; margin-left: -27px;">
			<div class="overlay"></div>
			<div class="d-flex">
				<div class="author-image text img p-md-5"
					style="background-image: url(images/joehyun.jpg);"></div>
				<div class="author-info text p-4 p-md-5 mt-5 mb-5">
					<div class="desc">
						<div style="margin-top: -100px; margin-bottom: 40px;">
							<p style="text-align: center; float: left;">
								<a href="#">팔로우하기 &nbsp;<img id="img1" src="images/heart1.png" 
									onclick="toggleImage();"></a>
							</p>
							<p style="text-align: center; margin-left: -300px;">
								<a href="#">채팅하기<img src="images/chat.png" style="margin-left: 10px;"></a>
							</p>
						</div>
						<span class="subheading">만나서 반가워요 </span><!-- <a href="memberchange"
							style="position: absolute; right: 20px; top: 0;"><img
							src="images/change.png"></a> -->
						<h1 class="big-letter">사용자</h1>
						<h1 class="mb-4">
							<span>제이름은 사용자입니다</span>
						</h1>
						<p class="mb-4">자기소개 아무거나 다써봐요 자기소개 아무거나 다써봐요자기소개 아무거나
							다써봐요자기소개 아무거나 다써봐요자기소개 아무거나 다써봐요자기소개 아무거나 다써봐요자기소개 아무거나 다써봐요</p>
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
									<strong class="number" data-number="290">0</strong> <span>팔로워</span>
								</div>
							</div>
						</div>
						<div
							class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18">
								<div class="text d-flex align-items-center">
									<strong class="number" data-number="700">0</strong> <span>팔로우</span>
								</div>
							</div>
						</div>
						<div
							class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
							<div class="block-18">
								<div class="text d-flex align-items-center">
									<strong class="number" data-number="20">0</strong> <span>게시물</span>
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
				<div class="col-md-4 ftco-animate">
					<a href="board">
						<img src="images/image_1.jpg" class="photography-entry img d-flex justify-content-start align-items-end" style="width: 420px;">
						<div class="overlay"></div>
					</a>
				</div>
					<div class="col-md-4 ftco-animate">
					<a href="board">
						<img src="images/image_2.jpg" class="photography-entry img d-flex justify-content-start align-items-end" style="width: 420px;">
						<div class="overlay"></div>
					</a>
				</div>
					<div class="col-md-4 ftco-animate">
					<a href="board">
						<img src="images/image_3.jpg" class="photography-entry img d-flex justify-content-start align-items-end" style="width: 420px;">
						<div class="overlay"></div>
					</a>
				</div>
					<div class="col-md-4 ftco-animate">
					<a href="board">
						<img src="images/image_4.jpg" class="photography-entry img d-flex justify-content-start align-items-end" style="width: 420px;">
						<div class="overlay"></div>
					</a>
				</div>
					<div class="col-md-4 ftco-animate">
					<a href="board">
						<img src="images/image_5.jpg" class="photography-entry img d-flex justify-content-start align-items-end" style="width: 420px;">
						<div class="overlay"></div>
					</a>
				</div>
					<div class="col-md-4 ftco-animate">
					<a href="board">
						<img src="images/image_6.jpg" class="photography-entry img d-flex justify-content-start align-items-end" style="width: 420px;">
						<div class="overlay"></div>
					</a>
				</div>
				<div class="col-md-4 ftco-animate">
					<a href="board">
						<img src="images/image_7.jpg" class="photography-entry img d-flex justify-content-start align-items-end" style="width: 420px;">
						<div class="overlay"></div>
					</a>
				</div>
					<div class="col-md-4 ftco-animate">
					<a href="board">
						<img src="images/image_8.jpg" class="photography-entry img d-flex justify-content-start align-items-end" style="width: 420px;">
						<div class="overlay"></div>
					</a>
				</div>
					<div class="col-md-4 ftco-animate">
					<a href="board">
						<img src="images/image_9.jpg" class="photography-entry img d-flex justify-content-start align-items-end" style="width: 420px;">
						<div class="overlay"></div>
					</a>
				</div>
					<div class="col-md-4 ftco-animate">
					<a href="board">
						<img src="images/image_10.jpg" class="photography-entry img d-flex justify-content-start align-items-end" style="width: 420px;">
						<div class="overlay"></div>
					</a>
				</div>
					<div class="col-md-4 ftco-animate">
					<a href="board">
						<img src="images/image_11.jpg" class="photography-entry img d-flex justify-content-start align-items-end" style="width: 420px;">
						<div class="overlay"></div>
					</a>
				</div>
					<div class="col-md-4 ftco-animate">
					<a href="board">
						<img src="images/image_12.jpg" class="photography-entry img d-flex justify-content-start align-items-end" style="width: 420px;">
						<div class="overlay"></div>
					</a>
				</div>
			</div>
		</div>
	</section>
	<%@include file="footer.jsp"%>