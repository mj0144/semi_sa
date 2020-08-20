<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>

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
                  <input type="text" id="user_num" name="user_num" value="${board_writer}">
                   <img style="height: 50px;" src="images/offline_big.png" class="indicator" id="indicator">
                   <br>
                  <h1 class="mb-4">
                     <span>���� ${membervo.name}�Դϴ�</span>
                  </h1>
                  <p class="mb-4">${membervo.user_intro}</p>
                  <h3 class="signature h1">Eric</h3>
                  <div>
                  	           <div>

											<!-- ��� �߰� ���� -->                				            
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
													src="resources/img/btn/like.png" data-toggle="tooltip" data-placement="top" title="��õ ���� ���"/>
												</c:when>
												<c:otherwise>
													<img id="${profile.USER_NUM}" class="blockox" style="width: 15%; cursor:pointer;" 
													src="resources/img/btn/dislike.png" data-toggle="tooltip" data-placement="top" title="��õ���� ����"/>												
												</c:otherwise>
											</c:choose>
                				            <!-- ��� �߰� ���� �� -->
                				            
                				            <!-- ������ �̵� ���� -->
                				            <img src="resources/img/btn/profile.png" style="width:15%; cursor: pointer;" onclick="profile()"
                				            data-toggle="tooltip" data-placement="top" title="�� ������ ����">
											<!-- ������ �̵� �� -->
                				            
                				            <img src="resources/img/btn/chat.png" style="width:15%; cursor: pointer;" onclick="chatting()"
                				            data-toggle="tooltip" data-placement="top" title="ä���ϱ�">

			        						<!-- ���ƿ� ��ư ���� -->
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
													src="resources/img/btn/hearton.png" data-toggle="tooltip" data-placement="top" title="���ƿ� ���"/>
												</c:when>
												<c:otherwise>
													<img id="${profile.USER_NUM}" class="heart" style="width: 15%; cursor:pointer;" 
													src="resources/img/btn/heartoff.png" data-toggle="tooltip" data-placement="top" title="���ƿ�"/>												
												</c:otherwise>
											</c:choose>
											<!-- ���ƿ� ��ư �� -->
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
                     <a onclick="fillower()" data-target="#followermodal" data-toggle="modal" style="cursor: pointer;">
                        <div class="text d-flex align-items-center">
                           <span>���� ���ƿ�</span>
                           <strong class="number" data-number="${liked_cnt}">0</strong> 
                        </div></a>
                     </div>
                  </div>
                  <div
                     class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
                     <div class="block-18">
                     <a onclick="follow()" data-target="#followmodal" data-toggle="modal" style="cursor: pointer;">
                        <div class="text d-flex align-items-center">
                           <span>���� ���ƿ�</span>
                           <strong class="number" data-number="${like_cnt}">0</strong> 
                        </div></a>
                     </div>
                  </div>
                  <div
                     class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
                     <div class="block-18">
                        <div class="text d-flex align-items-center">
                           <span>�Խñ�</span>
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
                             <a href="friend?user_num=${f.LIKER_USER }">
                             <img style=" width:50px; height:50px; border-radius:50%;display:block;" src="resources/upload/${f.USER_IMG }"></a> 
                             <input type="hidden" class="user_number" name="user_number" value="${f.LIKER_USER }">   
                     	   <!-- Ȱ���� -->
                             <img style="width: 10px;" src="images/offline.png" id="indicator${r.count }">
                             </div>
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
                             <a href="friend?user_num=${f.LIKER_USER }">
                             <img style=" width:50px; height:50px; border-radius:50%; display:block;" src="resources/upload/${f.USER_IMG }"> 
                             <input type="hidden" class="user_number2" name="user_number2" value="${f.LIKER_USER }">   
                     <!-- Ȱ���� -->
                          <img style="width: 10px;" src="images/offline.png" id="indicator_rc${r.count }">
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
		//��Ʈ ������ ��, ��Ʈ on/off ��� ��ȭ		
		$(document).on('click', '.heart', function(event) { 
				 var like = 'false';
			     var user_num = ${sessionScope.user_num};
			      
			      if ($(this).attr("src") === "resources/img/btn/hearton.png") {
	
			    	  $(this).attr("src", "resources/img/btn/heartoff.png"); //��Ʈ ����
			    	  $(this).attr('data-original-title', '���ƿ�').tooltip('show');
			    	  like='false';
			         
		 			} else if($(this).attr("src") === "resources/img/btn/heartoff.png") {
		 			
		 				$(this).attr("src", "resources/img/btn/hearton.png"); //��Ʈ ä��
		 				$(this).attr('data-original-title', '���ƿ� ���').tooltip('show')
		 				like='true';
		 			}
			      var param = {"like" : like, "liked_user" : $(this).attr("id"), "user_num": user_num};
	
			      ajax(param);
				
			});
		
		 //���ƿ� ���� �� �޾ƿͼ� ����   
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
			
			var blockon = "resources/img/btn/dislike.png"; //��� �ϱ�
			var blockoff = "resources/img/btn/like.png"; //��� ����
			
			var user_num = ${sessionScope.user_num};
			
			if ($(this).attr("src") === blockon) {
					$(this).attr("src", "resources/img/btn/like.png"); //������
					$(this).attr('data-original-title', '��õ ���� ���').tooltip('show')
					block='true';
			} else if($(this).attr("src") === blockoff){
					$(this).attr("src", "resources/img/btn/dislike.png"); //���
					$(this).attr('data-original-title', '��õ���� ����').tooltip('show')
					block='false';
			}
			
			var pm = {"block" : block, "blocked_user" : $('#user_num').val()};
			
			blocked(pm);
	
		});
		</script>
   <%@include file="footer.jsp"%>