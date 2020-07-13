<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
<div id="colorlib-main">
   <div style="position: absolute; right: 20px; top: 10;">
      <a href="logout">로그아웃</a>
   </div>
   <section class="ftco-section-no-padding bg-light">
      <div class="hero-wrap">
         <div class="overlay"></div>
         <div class="d-flex align-items-center js-fullheight">
            <div class="author-image text img d-flex">
               <section class="home-slider js-fullheight owl-carousel">
                  <div class="slider-item js-fullheight"
                     style="background-image: url(images/mainbanner2.jpg);"></div>

                  <div class="slider-item js-fullheight"
                     style="background-image: url(images/mainbanner4.jpg);"></div>
               </section>
            </div>
            <div class="author-info text p-3 p-md-5">
               <div class="desc">
                  <span class="subheading">운명속에</span>
                  <h1 class="big-letter">나의 인연은?</h1>
                  <h1 class="mb-4">
                     <span>상대방과의</span> 사주궁합 <span>지금 찾아보세요</span>
                  </h1>
                  <p class="mb-4">사주를 바탕으로 빅데이터를 통해 당신의 인연을 찾아드립니다. 운명 속에 인연을 만나보세요.</p>
                  <h3 class="signature h1">To the world you may be one person, <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								But to one person you may be world.</h3>

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
                        style="background-image: url(resources/upload/${f.user_img});"> </a>
                        </div>
               </c:forEach>
            </c:forEach>
         </div>
      </div>
   </section>
   <%@ include file="footer.jsp"%>