<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
<aside id="colorlib-aside" role="complementary"
   class="js-fullheight text-center">
   	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<!-- 알람 스크립트 -->

<%@include file="notications.jsp"%>
	<a href="setting" style="float:right; margin-top:-10%"><img src="images/setting.png"></a>
   <h1 id="colorlib-logo">
      <a href="mypage"><span class="img"
         style="background-image: url(resources/upload/${sessionScope.user_img});"></span>${sessionScope.name }</a>
   </h1>
   <nav id="colorlib-main-menu" role="navigation">
      <ul style="line-height: 2;">
         <li class="colorlib-active"><a href="index">Home</a></li>
         <li><a href="viewsaju">사주보기</a></li>
         <li><a href="feed">피드</a></li>
         <li><a href="chat.do">채팅</a></li>
         <li><a href="listWhole">인연찾기</a></li>
         <li><a href="findlove">이상형찾기</a></li>
         <li><a href="mypage">마이페이지</a></li>
         <li><a href="pay">결제상품</a></li>
         <li><a href="qnapage">Q&A</a></li>
         <br>
         <br>
         <br>
         <br>
         
         <li><a href="logoutdo">로그아웃</a></li>
      </ul>
      <h3>
         <img src="images/heart.png">
      </h3>
   </nav>
</aside>
<!-- END COLORLIB-ASIDE -->
