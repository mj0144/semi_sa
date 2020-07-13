<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="resources/css/viewsaju3.css">

<%@include file="header.jsp" %>
<%@include file="side.jsp" %>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	    <script>
$(function() {
	$('#viewilju').click(function() {
// 		var ilju_sky_num = '2';
// 		var ilju_land_num = '10';
		location='resultsaju2';
	})
})
</script>
		<div id="colorlib-main">
			<section class="ftco-section ftco-bread">
				<div class="container">
					<div class="row no-gutters slider-text justify-content-center align-items-center">
	          <div class="col-md-8 ftco-animate">
	            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>사주보기</span></p>
	            <h1 class="bread">사주보기</h1>
	          </div>
	        </div>
				</div>
			</section>
			<section class="ftco-section contact-section">
		 <div class="container">
	      <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-4">
                    <div class="single-team">
                        <div class="team-photo">
                            <img src="resources/img/sajutest2.jpg" alt="">
                        </div>
                        <h6>사주로 보는 인연</h6>
                        <h4>나의 찰떡궁합 인연은?</h4>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-8" style="text-align: center;">
                    <div class="single-team">
                        <div class="explain">
                        <h5>어떤 검사일까요?</h5>
                        <h4>사주 팔자 중 태어난 날의 두 글자만을 통해서 본 나와 잘 어울리는 사주 궁합입니다. 나와 외면과 내면이 모두 잘 맞을 수 있는 사람을 알려드립니다. 100% 맞는게 아니니 재미로만 봐주세요 ㅎ. 
                        </h4>
                        </div>
                    </div>
                    <br>
                      <button class="btn btn-warning" id="viewilju">결과보기</button>
                </div>
            </div>
            </div>
	    </section>
	    

<%@ include file="footer.jsp" %>