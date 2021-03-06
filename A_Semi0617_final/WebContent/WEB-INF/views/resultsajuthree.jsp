<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="resources/css/viewsaju3.css">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp" %>
<%@include file="side.jsp" %>
		<div id="colorlib-main">
			<section class="ftco-section" style="background-image: url(resources/img/headerimg.png); height:5em">
		<div class="container">
			<div class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-12 ftco-animate text-center">
					<h1 class="bread" style="color:white;"><b>사주보기</b></h1>
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
                            <img src="resources/img/sajutest3.jpg" alt="">
                        </div>
                        <h6>사주로 보는 귀인</h6>
                        <h4>하늘이 내린 선물같은 사람은?</h4>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-8" style="text-align: center;">
                    <div class="single-team">
                        <div class="explain">
                        <h5>어떤 검사일까요?</h5><br>
                        <h4>나에게 도움이 될 수 있는 사람을 <br>사주 팔자를 기반으로 알려드립니다. <br><br><b>귀인</b>이라고 하죠. <br><br>나에게 어떤 사람이 <br> <b>귀인</b>이 될 수 있을지 <br>확인해보세요.
                        </h4>
                    <br> <button class="btn btn-warning" id="viewhelp">결과보기</button>
                        </div>
                    </div>
                     <br>
                </div>
            </div>
            </div>
	    </section>
	<script>
		$(function() {
			$('#viewhelp').click(function() {
		
				location='resultsaju3';
			})
		})
	</script>
<%@ include file="footer.jsp" %>