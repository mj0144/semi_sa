<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="resources/css/viewsaju3.css">

<%@include file="header.jsp" %>
<%@include file="side.jsp" %>
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
                            <img src="resources/img/sajutest1.jpg" alt="">
                        </div>
                        <h6>사주로 보는 성격</h6>
                        <h4>나는 어떤 일주 동물일까?</h4>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-8" style="text-align: center;">
                    <div class="single-team">
                        <div class="explain">
                        <h5>어떤 검사일까요?</h5>
                        <h4> 사주를 기반으로 내가 어떤 동물 유형인지 알려드립니다. 빅데이터와 인공지능을 통한 분석으로 내가 어떤 성격을 가졌고 유명인 중 누가 나랑 같은 유형인지 알려드려요.
                        </h4><br>
                        </div>
                    </div>
                    <br>
                     <button class="btn btn-warning" id="viewilju">결과보기</button>
                </div>
            </div>
            </div>
            
	    </section>
	    
	    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	    
	    
<script>
$(function() {
	$('#viewilju').click(function() {
// 		var ilju_sky_num = '2';
// 		var ilju_land_num = '10';
		location='resultsaju1';
	})
})
</script>
<%@ include file="footer.jsp" %>