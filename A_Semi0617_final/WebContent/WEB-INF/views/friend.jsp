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
               <div style="float: right;"><div id="boardBtn_group" ><button type="button" id="modal_open_btn" style="float: right;">신고하기</button></div></div>
               
                  <input type="hidden" id="user_num" name="user_num" value="${board_writer}">
                   <img style="height: 50px;" src="images/offline_big.png" class="indicator" id="indicator">
                   <br>
                  <h1 class="mb-4">
                     <span>저는 ${membervo.name}입니다</span>
                  </h1>
                  <p class="mb-4">${membervo.user_intro}</p>
                  <h3 class="signature h1">Eric</h3>
                  <div>
                  
                  	           <div>

											<!-- 블락 추가 구현 -->                				            
											 		
											<c:choose>
												<c:when test="${blockchk == 1}">
													<img id="${user_num}" class="blockox" style="width:15%; cursor: pointer;" 
													src="resources/img/btn/like.png" data-toggle="tooltip" data-placement="top" title="추천 제외 취소"/>
												</c:when>
												<c:otherwise>
													<img id="${user_num}" class="blockox" style="width: 15%; cursor:pointer;" 
													src="resources/img/btn/dislike.png" data-toggle="tooltip" data-placement="top" title="추천에서 제외"/>												
												</c:otherwise>
											</c:choose>
                				            <!-- 블락 추가 구현 끝 -->
                				            
											<!-- 채팅 신청 -->
                				            <input type="hidden" id="nickname" value="${sessionScope.nickname }">
                				            <input type="hidden" id="userNum" value="${board_writer}">
                				            <img src="resources/img/btn/chat.png" style="width:15%; cursor: pointer;" onclick="chatrequest()" 
                				            data-toggle="tooltip" data-placement="top" title="채팅하기">

			        						<!-- 좋아요 버튼 구현 -->
											<c:choose>
												<c:when test="${heartchk == 1}">
													<img id="${user_num}" class="heart" style="width: 15%; cursor:pointer;" 
													src="resources/img/btn/hearton.png" data-toggle="tooltip" data-placement="top" title="좋아요 취소"/>
												</c:when>
												<c:otherwise>
													<img id="${user_num}" class="heart" style="width: 15%; cursor:pointer;" 
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
                     <a onclick="fillower()" data-target="#followermodal" data-toggle="modal" style="cursor: pointer;">
                        <div class="text d-flex align-items-center">
                           <span>받은 좋아요</span>
                           <strong class="number" data-number="${liked_cnt}">0</strong> 
                        </div></a>
                     </div>
                  </div>
                  <div
                     class="col-xl-3 col-md-6 d-flex justify-content-center counter-wrap ftco-animate">
                     <div class="block-18">
                     <a onclick="follow()" data-target="#followmodal" data-toggle="modal" style="cursor: pointer;">
                        <div class="text d-flex align-items-center">
                           <span>보낸 좋아요</span>
                           <strong class="number" data-number="${like_cnt}">0</strong> 
                        </div></a>
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
   
	<!-- Modal -->
				    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				        <div class="modal-dialog  modal-dialog-centered" role="document">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <b><h2 class="modal-title" id="myModalLabel">불량유저 신고하기</h2></b>
				                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="float: right;">
				                        <span aria-hidden="true">&times;</span>
				                    </button>
				                </div>
				                <div class="modal-body" >
										<hr style="color: gray;"><br><br>
										<form method="post" id="checked" action="reportUser">
										<input type="radio" name="report_comment" value="의심스럽거나 스팸입니다." checked/> 의심스럽거나 스팸입니다. <br/><br/>
										<input type="radio" name="report_comment" value="계정 해킹이 의심됩니다."/> 계정 해킹이 의심됩니다.<br/><br/>
										<input type="radio" name="report_comment" value="신고자 본인,또는 타인을 사칭하고 있습니다."/> 신고자 본인,또는 타인을 사칭하고 있습니다.<br/><br/>
										<input type="radio" name="report_comment" value="부적합한 게시물을 게시했습니다."/> 부적합한 게시물을 게시했습니다.<br/><br/>
										<input type="radio" name="report_comment" value="기타"/> 기타<br/><br/>
										<input type="hidden" name="friend_num" id="friend_num" value="${board_writer }"/>
								</div>
				                <div class="modal-footer">
				                    <button type="submit" class="btn btn-primary" id="report_btn">제출</button>
				                     </form>
				                     <button type="button" class="btn btn-secondary" data-dismiss="modal" id="report_cancel">취소</button>
				                </div>
				            </div>
				        </div>
				    </div>
   
   
   <!-- Modal -->
   <div class="modal fade" id="followermodal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog  modal-dialog-centered" role="document" style="max-width: 100%; width: 500px; height:600px; display: table;">
         <div class="modal-content">
            <div class="modal-header">
               <b><h2 class="modal-title" id="myModalLabel">좋아요 받은 LIST</h2></b>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close" style="float: right;">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
            
            
            
            
          					 
                             <c:forEach var="f" items="${follower }" varStatus="r">
                             <input type="hidden" class="user_number" name="user_number" value="${f.LIKER_USER}">
                             <div>
                              <div style="float: left;">
                               <a href="friend?user_num=${f.LIKER_USER }">
                              <div style="position: absolute;">
                              <div style="position: relative;"><img style="width: 10px;" src="images/offline.png" id="indicator${r.count }"></div>
                              </div>
                              <img style=" width:50px; height:50px; border-radius:50%;display:block;" src="resources/upload/${f.USER_IMG }"></a> 
                              </div>
                              <div style="color: black; font-size: 20px;">&nbsp;${f.NICKNAME }</div><br>
                              </div>
                               <hr style="color: gray;">
                 			 </c:forEach>
            
            
            
            
            
             <%--   <!-- <form method="post" id="checked" action="reportBoard"> -->
                          <c:forEach var="f" items="${follower }" varStatus="r">
                             <div>
                                <div style="float: left;">
                             <a href="friend?user_num=${f.LIKER_USER }">
                             <img style=" width:50px; height:50px; border-radius:50%;display:block;" src="resources/upload/${f.USER_IMG }"></a> 
                             <input type="hidden" class="user_number" name="user_number" value="${f.LIKER_USER }">   
                     	   <!-- 활동중 -->
                             <img style="width: 10px;" src="images/offline.png" id="indicator${r.count }">
                             </div>
                             <div style="color: black; font-size: 20px;">&nbsp;${f.NICKNAME }</div><br>
                             <hr style="color: gray;">
                  </div>
                  </c:forEach> --%>
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
               <b><h2 class="modal-title" id="myModalLabel">좋아요 누른 LIST</h2></b>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close" style="float: right;">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
           <div class="modal-body">
           
             
                             <c:forEach var="f" items="${follow}" varStatus="r">
                             <input type="hidden" class="user_number2" name="user_number2" value="${f.LIKER_USER}">  
                             <div>
                              <div style="float: left;">
                               <a href="friend?user_num=${f.LIKER_USER }">
                              <div style="position: absolute;">
                              <div style="position: relative;"><img style="width: 10px;" src="images/offline.png" id="indicator_rc${r.count }"></div>
                              </div>
                              <img style=" width:50px; height:50px; border-radius:50%;display:block;" src="resources/upload/${f.USER_IMG }"></a> 
                              </div>
                              <div style="color: black; font-size: 20px;">&nbsp;${f.NICKNAME }</div><br>
                              </div>
                               <hr style="color: gray;">
                 			 </c:forEach>
           
           
          <%--  
           
           
           
           
               <!-- <form method="post" id="checked" action="reportBoard"> -->
                          <c:forEach var="f" items="${follow }" varStatus="r">
                             <div>
                                <div style="float: left;">
                             <a href="friend?user_num=${f.LIKER_USER }">
                             <img style=" width:50px; height:50px; border-radius:50%; display:block;" src="resources/upload/${f.USER_IMG }"> 
                             <input type="hidden" class="user_number2" name="user_number2" value="${f.LIKER_USER }">   
                     <!-- 활동중 -->
                          <img style="width: 10px;" src="images/offline.png" id="indicator_rc${r.count }">
                             </a></div>
                             <div style="color: black; font-size: 20px;">&nbsp;${f.NICKNAME }</div><br>
                             <hr style="color: gray;">
                  </div>
                  </c:forEach> --%>
            </div>
            <div class="modal-footer">
               
            </div>
         </div>
      </div>
   </div>
   
   
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
			
			console.log(block)
			
			var pm = {"block" : block, "blocked_user" : $('#user_num').val()};
			
			blocked(pm);
	
		  });
		
		
	    function blocked(pm){
               
	          $.ajax({
	                url : "blockox",
	                type : "post",
	                data : pm,
	                success : function(data){
	                },
	                error : function(request, error){
	                   console.log("code:"+request.status+"\n"+"message:"+request.responsetext+"\n"+"error:"+error);
	                }
	             });
	    }
		
		function chatrequest() {
			var responeUser = $("#userNum").val(); //받는자
			var link = "mypage"
			var param = new Object();
			var requestUser = ${sessionScope.user_num}; //보내는자
			var nickname = $("#nickname").val();
			console.log(nickname);
			param.notifyLink = link;
			param.notifycontent = nickname+"님이 회원님에게 채팅을 요청하였습니다.";
			param.notifyuser  = responeUser; //받는자
			param.notifyusernum = requestUser; //보내는자
			var paramJson = JSON.stringify(param);
			$.ajax({
				type : "POST",
				url : "notifyin",
				contentType: "application/json; charset=utf-8",
				dataType : "json",
				data : paramJson,
				success :  function(res){
					if(res.result == "success"){
						var notifyparam = '채팅|'+link+"|"+nickname;
						notifyon(notifyparam);
					}else{
						alert("알람을 보내는도중 ajax 문제가 발생하였습니다.");
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
	            beforeSend : function(request){
	                request.setRequestHeader("chRequest", "chRequest");
	            },
				success : function(res){
					alert("상대방에게 채팅신청하였습니다. 상대방 수락시 채팅방이 개설됩니다.");
		               document.location.href = document.location.href;
				},
				error : function(request,status,error){
					console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});
	         document.location.href = document.location.href;

		}
		</script>
		
		<script>
	$(document).ready(function() {
		$('#modal_open_btn').click(function() {
			$('#myModal').modal('show');
		});
		
		$('#report_btn').click(function() {
 			alert('신고가 접수되었습니다.')
		})
	})
	</script>
   <%@include file="footer.jsp"%>