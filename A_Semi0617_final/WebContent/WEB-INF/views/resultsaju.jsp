<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/css/viewsaju3.css">

<%@include file="header.jsp" %>
<%@include file="side.jsp" %>
		<div id="colorlib-main">
			<section class="ftco-section" style="background-image: url(resources/img/headerimg.png); height:5em">
		<div class="container">
			<div class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-12 ftco-animate text-center">
					<h1 class="bread" style="color:white;"><b>사주 보기</b></h1>
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
                        <h4><br> 사주를 기반으로 <br>내가 어떤 <b>동물 유형인지 알려드립니다.</b> <br><br>알고리즘 통한 분석으로<br><b>내가 어떤 성격을 가졌고</b> <br><br>유명인 중 누가 나랑 같은 유형인지 <br>알려드려요.
                        </h4><br>
                     <br><button class="btn btn-warning" id="viewilju">결과보기</button>
                        </div>
                    </div>
                    <br>
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