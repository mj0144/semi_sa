<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<div id="colorlib-main">

   <section class="ftco-section">
      <div class="hero-wrap" style="margin-bottom: -75px; margin-left: -27px;">
         <div class="overlay"></div>
         <div class="d-flex">
            <div class="author-image text img p-md-5"
               style="background-image: url(resources/upload/${membervo.user_img});">
            </div>
            <div class="author-info text p-4 p-md-5 mt-5 mb-5">
            <div>
 
            </div>
               <div class="desc">
                  <br>
                  <h1 class="mb-4">
                     <span>저는 ${membervo.name}입니다</span>
                  </h1>
                  <p class="mb-4">${membervo.user_intro}</p>
                  <h3 class="signature h1">Eric</h3>
                  <div>
                  	           <div>

											<!-- 블락 추가 구현 -->                				            
                				            <c:set var="blockox" value="false"/>
											<c:forEach var="g" items="${set.blist }">
												<c:choose>
													<c:when test="${g == profile.USER_NUM}">
														<c:set var="blockox" value="true"/>
													</c:when>													
												</c:choose>
											</c:forEach>
											 		
											<c:choose>
												<c:when test="${blockox == 'true'}">
													<img id="${profile.USER_NUM}" class="blockox" style="width:15%; cursor: pointer;" 
													src="resources/img/btn/like.png" data-toggle="tooltip" data-placement="top" title="추천 제외 취소"/>
												</c:when>
												<c:otherwise>
													<img id="${profile.USER_NUM}" class="blockox" style="width: 15%; cursor:pointer;" 
													src="resources/img/btn/dislike.png" data-toggle="tooltip" data-placement="top" title="추천에서 제외"/>												
												</c:otherwise>
											</c:choose>
                				            <!-- 블락 추가 구현 끝 -->
                				            
                				            <!-- 프로필 이동 구현 -->
                				            <img src="resources/img/btn/profile.png" style="width:15%; cursor: pointer;" onclick="profile()"
                				            data-toggle="tooltip" data-placement="top" title="상세 프로필 보기">
											<!-- 프로필 이동 끝 -->
                				            
                				            <img src="resources/img/btn/chat.png" style="width:15%; cursor: pointer;" onclick="chatting()"
                				            data-toggle="tooltip" data-placement="top" title="채팅하기">

			        						<!-- 좋아요 버튼 구현 -->
			        						<c:set var="hearton" value="false"/>
											<c:forEach var="g" items="${heart }">
												<c:choose>
													<c:when test="${g.liked_user == profile.USER_NUM}">
														<c:set var="hearton" value="true"/>
													</c:when>													
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${hearton == 'true'}">
													<img id="${profile.USER_NUM}" class="heart" style="width: 15%; cursor:pointer;" 
													src="resources/img/btn/hearton.png" data-toggle="tooltip" data-placement="top" title="좋아요 취소"/>
												</c:when>
												<c:otherwise>
													<img id="${profile.USER_NUM}" class="heart" style="width: 15%; cursor:pointer;" 
													src="resources/img/btn/heartoff.png" data-toggle="tooltip" data-placement="top" title="좋아요"/>												
												</c:otherwise>
											</c:choose>
											<!-- 좋아요 버튼 끝 -->
			                   			</div>
                  </div>
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
                           <span>받은 좋아요</span>
                           <strong class="number" data-number="${liked_cnt}">0</strong> 
                        </div>
                     </div>
                  </div>
                  <div
                     class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
                     <div class="block-18">
                        <div class="text d-flex align-items-center">
                           <span>보낸 좋아요</span>
                           <strong class="number" data-number="${like_cnt}">0</strong> 
                        </div>
                     </div>
                  </div>
                  <div
                     class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
                     <div class="block-18">
                        <div class="text d-flex align-items-center">
                           <span>게시글</span>
                           <strong class="number" data-number="${board_cnt}">0</strong> 
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
         <c:forEach var="e" items="${blist }">
            <div class="col-md-4 ftco-animate">
               <a href="board?board_num=${e.board_num }">
                  <img src="resources/upload/${e.board_img }" class="photography-entry img d-flex justify-content-start align-items-end" style="width: 420px;">
                  <div class="overlay"></div>
               </a>
            </div>
         </c:forEach>
         </div>
      </div>
   </section>
   	<script>	
		//하트 눌렀을 때, 하트 on/off 모양 변화		
		$(document).on('click', '.heart', function(event) { 
				 var like = 'false';
			     var user_num = ${sessionScope.user_num};
			      
			      if ($(this).attr("src") === "resources/img/btn/hearton.png") {
	
			    	  $(this).attr("src", "resources/img/btn/heartoff.png"); //하트 버림
			    	  $(this).attr('data-original-title', '좋아요').tooltip('show');
			    	  like='false';
			         
		 			} else if($(this).attr("src") === "resources/img/btn/heartoff.png") {
		 			
		 				$(this).attr("src", "resources/img/btn/hearton.png"); //하트 채움
		 				$(this).attr('data-original-title', '좋아요 취소').tooltip('show')
		 				like='true';
		 			}
			      var param = {"like" : like, "liked_user" : $(this).attr("id"), "user_num": user_num};
	
			      ajax(param);
				
			});
		
		 //좋아요 유무 값 받아와서 띄우기   
		 function ajax(param){
		   $.ajax({
		         url : "likeox",
		         type : "post",
		         data : param,
		         success : function(data){
		            
		         },
		         error : function(){
		            
		         }
		      });
		   }
	</script>
	
	<script>
		$(document).on('click', '.blockox', function(event) {
			
			var block = 'false';
			
			var blockon = "resources/img/btn/dislike.png"; //블락 하기
			var blockoff = "resources/img/btn/like.png"; //블락 해제
			
			var user_num = ${sessionScope.user_num};
			
			if ($(this).attr("src") === blockon) {
					$(this).attr("src", "resources/img/btn/like.png"); //블락취소
					$(this).attr('data-original-title', '추천 제외 취소').tooltip('show')
					block='true';
			} else if($(this).attr("src") === blockoff){
					$(this).attr("src", "resources/img/btn/dislike.png"); //블락
					$(this).attr('data-original-title', '추천에서 제외').tooltip('show')
					block='false';
			}
			
			var pm = {"block" : block, "blocked_user" : $('#user_num').val()};
			
			blocked(pm);
	
		});
		</script>
   <%@include file="footer.jsp"%>