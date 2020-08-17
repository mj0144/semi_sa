<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
<%@include file="side.jsp" %>
      <div id="colorlib-main">
         <section class="ftco-section-no-padding bg-light">
            <div class="hero-wrap">
               <div class="overlay"></div>
               <div class="d-flex">
                  <div class="author-image text img p-md-5" style="background-image: url('resources/upload/${member.user_img}');">
                     
                  </div>
                  <div class="author-info text p-4 p-md-5 mt-5 mb-5">
                     <div class="desc">
                     
                        <span class="subheading">Mypage</span>
                        <div style="position: absolute; right: 20px; top: 0;">
                        
                        </div>
                        <h1 class="big-letter"></h1>
                        <h1 class="mb-4"><span>${member.name }님의 마이페이지</span></h1>
                        <p class="mb-4">${member.user_intro }</p>
                        <h3 class="signature h1">${member.nickname }</h3>
               </div>
                  </div>
               </div>
            </div>
         </section>
         <section class="ftco-section ftco-counter img" id="section-counter" style="background-image: url(images/bg_1.jpg);">
          <div class="container">
             <div class="row justify-content-start">
                <div class="col-md-10">
                   <div class="row">
                   <div class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
                     <div class="block-18">
                       <div class="text d-flex align-items-center">
                         <span> </span>
                       </div>
                     </div>
                   </div>
                   <div class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
                     <div class="block-18">
                       <div class="text d-flex align-items-center">
                         <span>받은 좋아요</span>
                         <strong class="number" data-number=${cnt2 }>0</strong>
                       </div>
                     </div>
                   </div>
                   <div class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
                     <div class="block-18">
                       <div class="text d-flex align-items-center">
                         <span>보낸 좋아요</span>
                         <strong class="number" data-number="${cnt1 }">0</strong>
                       </div>
                     </div>
                   </div>
                   <div class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
                     <div class="block-18">
                       <div class="text d-flex align-items-center">
                         <span>게시물</span>
                         <strong class="number" data-number="${maxnum }">0</strong>
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
         <c:forEach var="e" items="${boardlist}">
            <div class="col-md-4 ftco-animate">
               <a href="board?board_num=${e.board_num }">
                  <img src="resources/upload/${e.board_img}" class="photography-entry img d-flex justify-content-start align-items-end" style="width: 420px;">
                  <div class="overlay"></div>
               </a>
            </div>
            </c:forEach>
         </div>
      </div>
   </section>


</div>
<!-- END COLORLIB-MAIN -->
</div>
<!-- END COLORLIB-PAGE -->

<!-- loader -->
<div id="ftco-loader" class="show fullscreen">
	<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
			stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
</div>


<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/jquery.timepicker.min.js"></script>
<script src="js/scrollax.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>