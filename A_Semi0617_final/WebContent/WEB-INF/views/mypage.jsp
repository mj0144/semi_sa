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
                     <input type="hidden" name="user_num" id="user_num"   value="${sessionScope.user_num }">
                        <span class="subheading">Mypage</span>
                        <!-- Ȱ���� -->
                     <img style="height: 50px;" src="images/offline_big.png" id="indicator" class="indicator">
                        <div style="position: absolute; right: 20px; top: 0;">
                        
                        </div>
                        <h1 class="big-letter"></h1>
                        <h1 class="mb-4"><span>${member.name }���� ����������</span></h1>
                        <p class="mb-4">${member.user_intro }</p>
                        <h3 class="signature h1">${member.nickname }</h3>
                        <img src="resources/img/btn/chat.png" id="chat" style="cursor: pointer; width:40px;" data-toggle="tooltip" data-placement="top" title="chat">ä��Ȯ��
                        
<!--                         ä��Ȯ�� ���� ����-->
                        <div class="col-md-12 col-md-offset-12 text-center" id="checkset" style="border: 1px solid #240B3B; margin-bottom: 30px; padding: 30px; display:none;">
	                        <div class="widget-content-wrapper">
                        		<div class="col-md-12 col-md-offset-12 text-center">
								 	 <div class="single-team">
							    			<div class="col-md-12">
							    				<div class="blog-entry ftco-animate d-md-flex" style="float: left;">
<!-- 							    				�������� -->
												<img id="sajutwo" src="images/iu2.png" alt="iljuanimal" style="margin-top: 10px;" class="col-md-4">
												<span class="col-md-6">
												<h4>�����г���</h4>
												<br>
												������ ����
												</span>
												<button class="border-0 btn-transition btn btn-outline-success col-md-1"> <i class="fa fa-check"></i></button> <button class="border-0 btn-transition btn btn-outline-danger col-md-1"> <i class="fa fa-check"></i> </button> 
												</div>
												<div class="blog-entry ftco-animate d-md-flex">
													
												</div>
												<div>
								              		<p class="mb-2"></p>
								           	 			<div class="meta-wrap">
															<p class="meta"></p>
							              				</div>
								            		<p class="mb-4"> </p>
								            		<br>
												</div>
												
							    			</div>
							    		
							    		<a href="chat.do">ä�� ��������</a>
				 					</div>	
	                     	   </div>
                      	 	 </div>
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
                       <a onclick="fillower()" data-target="#followermodal" data-toggle="modal" style="cursor: pointer;">
                       <div class="text d-flex align-items-center">
                         <span>���� ���ƿ�</span>

                         <strong class="number" data-number=${cnt2 }>0</strong>
                       </div></a>
                     </div>
                   </div>
                    <div class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
                     <div class="block-18">
                     <a onclick="follow()" data-target="#followmodal" data-toggle="modal" style="cursor: pointer;">
                       <div class="text d-flex align-items-center">
                         <span>���� ���ƿ�</span>

                         <strong class="number" data-number="${cnt1 }">0</strong>
                       </div></a>
                     </div>
                   </div>
                   <div class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
                     <div class="block-18">
                       <div class="text d-flex align-items-center">
                         <span>�Խù�</span>
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

<!-- Modal -->
   <div class="modal fade" id="followermodal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog  modal-dialog-centered" role="document" style="max-width: 100%; width: 500px; height:600px; display: table;">
         <div class="modal-content">
            <div class="modal-header">
               <b><h2 class="modal-title" id="myModalLabel">���ƿ� ���� LIST</h2></b>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close" style="float: right;">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <!-- <form method="post" id="checked" action="reportBoard"> -->
                          <c:forEach var="f" items="${follower }" varStatus="r">
                             <div>
                                <div style="float: left;">
                             <a href="friend?user_num=${f.USER_NUM }">
                             <img style=" width:50px; height:50px; border-radius:50%;" src="resources/upload/${f.USER_IMG }"> 
                             <input type="hidden" id="user_number3" class="user_number3" name="user_number3" value="${f.USER_NUM }">   
                     	   <!-- Ȱ���� -->
                             <img style="width: 10px;" src="images/offline.png" id="indicator_fr${r.count }">
                             </a></div>
                             <div style="color: black; font-size: 20px;">&nbsp;${f.NICKNAME }</div><br>
                             <hr style="color: gray;">
                  </div>
                  </c:forEach>
            </div>
            <div class="modal-footer">
               
            </div>
         </div>
      </div>
   </div>
   
      <!-- Modal2 -->
   <div class="modal fade" id="followmodal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog  modal-dialog-centered" role="document" style="max-width: 100%; width: 500px; height:600px; display: table;">
         <div class="modal-content">
            <div class="modal-header">
               <b><h2 class="modal-title" id="myModalLabel">���ƿ� ���� LIST</h2></b>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close" style="float: right;">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
           <div class="modal-body">
               <!-- <form method="post" id="checked" action="reportBoard"> -->
                          <c:forEach var="f" items="${follow }" varStatus="r">
                             <div>
                                <div style="float: left;">
                             <a href="friend?user_num=${f.USER_NUM }">
                             <img style=" width:50px; height:50px; border-radius:50%;" src="resources/upload/${f.USER_IMG }"> 
                             <input type="hidden" id="user_number4" class="user_number4" name="user_number4" value="${f.USER_NUM }">   
                     <!-- Ȱ���� -->
                          <img style="width: 10px;" src="images/offline.png" id="indicator_f${r.count }">
                             </a></div>
                             <div style="color: black; font-size: 20px;">&nbsp;${f.NICKNAME }</div><br>
                             <hr style="color: gray;">
                  </div>
                  </c:forEach>
            </div>
            <div class="modal-footer">
               
            </div>
         </div>
      </div>
   </div>
	<script>
		// üũ�ڽ� �����̵� ���
		$(document).on('click', '#chat', function(event) {
			$("#checkset").slideToggle(); 
		});
	</script>

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