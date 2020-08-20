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
											<!-- ä�� ��û -->
                				            <input type="hidden" id="nickname" value="${membervo.name }">
                				            <input type="hidden" id="userNum" value="${board_writer}">
                				            <img src="resources/img/btn/chat.png" style="width:15%; cursor: pointer;" onclick="chatrequest()" 
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
                        <div class="text d-flex align-items-center">
                           <span>���� ���ƿ�</span>
                           <strong class="number" data-number="${liked_cnt}">0</strong> 
                        </div>
                     </div>
                  </div>
                  <div
                     class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
                     <div class="block-18">
                        <div class="text d-flex align-items-center">
                           <span>���� ���ƿ�</span>
                           <strong class="number" data-number="${like_cnt}">0</strong> 
                        </div>
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
		function chatrequest() {
			var responeUser = $("#userNum").val(); //�޴���
			var link = "mypage"
			var param = new Object();
			var requestUser = ${sessionScope.user_num}; //��������
			var nickname = $("#nickname").val();
			param.notifyLink = link;
			param.notifycontent = nickname+"���� ȸ���Կ��� ä���� ��û�Ͽ����ϴ�.";
			param.notifyuser  = responeUser; //�޴���
			param.notifyusernum = requestUser; //��������
			var paramJson = JSON.stringify(param);
			$.ajax({
				type : "POST",
				url : "notifyin",
				contentType: "application/json; charset=utf-8",
				dataType : "json",
				data : paramJson,
				success :  function(res){
					if(res.result == "success"){
						var notifyparam = 'ä��|'+link+"|"+nickname;
						notifyon(notifyparam);
					}else{
						alert("�˶��� �����µ��� ajax ������ �߻��Ͽ����ϴ�.");
					}
				},
				error:function(request,status,error){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});
			var user1 = ${sessionScope.user_num};
			$.ajax({
				type : "POST",
				url : "chRequest",
				data : "user1="+user1,
				success : function(res){
					alert("���濡�� ä�ý�û�Ͽ����ϴ�. ���� ������ ä�ù��� �����˴ϴ�.");
				},
				error : function(request,status,error){
					console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});
		}
		</script>
   <%@include file="footer.jsp"%>