<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="index/header.jsp"%>
<%@include file="side.jsp"%>
<div id="colorlib-main">


	<style>
#size {
	width: 30px;
	margin: 0 15px;
	border-style: none;
	text-shadow: 20px;
}

.count {
	font-weight: bold;
	border: 2.5px solid lightgray;
	box-shadow: 5px 1px 5px 0;
	border-radius: 20px;
}

span {
	margin-left: 30px;
}
</style>
	<section class="ftco-section-no-padding bg-light">
		<div class="hero-wrap">
			<div class="overlay"></div>
			<div class="d-flex align-items-center js-fullheight">
				<div class="author-image text img d-flex">
					<section class="home-slider js-fullheight owl-carousel">
						<div class="slider-item js-fullheight"
							style="background-image: url(resources/img/banner.png);"></div>

						<div class="slider-item js-fullheight"
							style="background-image: url(resources/img/banner2.png);"></div>
					</section>
				</div>
				<div class="author-info text p-3 p-md-5">
					<div class="desc">
						<span class="subheading">운명속</span>
						<h1 class="big-letter">나의 인연은?</h1>
						<h1 class="mb-4">
							<span>상대방과의</span> 사주궁합 <span><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							지금 찾아보세요</span>
						</h1>
						

					</div>
					<div class="msp_bn_area count p-md-5"
						style="float: none; margin: 0; padding: 0; background-image: none; min-width: 0; display: block; margin: 0 auto;">
						<div class="temp">
							<div class="member" style="float: left; margin-right: 10px;">
								<div
									style="font-size: 16px; line-height: 20px; font-family: 'Noto Sans KR'; margin-left: 70px;">회원수</div>
								<div
									style="font-size: 40px; line-height: 44px; font-family: 'Noto Sans KR';">
									<span style="font-weight: 700;"> <span id="m_cnt">${usercount }</span></span>명
								</div>
							</div>
							<div class="couple" style="float: left; margin-right: 10px;">
								<div
									style="font-size: 16px; line-height: 20px; margin-left: 50px;">매칭률</div>
								<div style="font-size: 40px; line-height: 44px;">
									<span style="font-weight: 700;"> <span id="r_cnt">${matavg}</span></span>%
								</div>
							</div>
							<div class="couple" style="margin-left: 20px;"">

								<div
									style="font-size: 16px; line-height: 20px; margin-left: 100px;">실시간
									접속자</div>
								<div style="font-size: 40px; line-height: 44px;">
									<span style="font-weight: 700;"> <input
										style="font-weight: 700; color: gray;" type="text" id="size"
										name="size" value=""></span>명
								</div>
							</div>
							<div class="day"></div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section instagram">
		<div class="container">
			<div class="row justify-content-center mb-2 pb-3">
				<div
					class="col-md-7 heading-section heading-section-2 text-center ftco-animate">
					<h2 class="mb-4">나랑 잘 맞는 친구 찾기</h2>
				</div>
			</div>
			<div class="row no-gutters">
				<c:forEach var="e" items="${list}">
					<c:forEach var="f" items="${e.mem }">
						<div class="col-sm-12 col-md ftco-animate">


							<a href="friend?user_num=${f.user_num }" class="insta-img"
								style="background-image: url(resources/upload/${f.user_img});">

							</a>
							<%-- <form action="friend" method="post" id="user_num">   
                           <input type="hidden" name="user_num" id="user_num" value="${f.user_num }">
                  </form> --%>
						</div>
					</c:forEach>
				</c:forEach>
			</div>
		</div>
	</section>
	<section class="ftco-section instagram">
		<div class="container">
			<div class="row justify-content-center mb-2 pb-3">
				<div
					class="col-md-7 heading-section heading-section-2 text-center ftco-animate">
					<h2 class="mb-4">나랑 잘 맞는 이성 추천</h2>
				</div>
			</div>

			<div class="row no-gutters">
				<c:forEach var="e" items="${list2}">
					<c:forEach var="f" items="${e.mem }">
						<div class="col-sm-12 col-md ftco-animate">
							<a href="friend?user_num=${f.user_num }" class="insta-img"
								style="background-image: url(resources/upload/${f.user_img});">
							</a>
						</div>
					</c:forEach>
				</c:forEach>
			</div>
		</div>
	</section>

	<%@ include file="footer.jsp"%>