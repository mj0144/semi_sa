<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<!-- 좋아요 및 좋아요 취소  -->
<script>
 	function toggleImage() {
		var like = 'false';
		
		var hearton = "resources/img/btn/hearton.png"; //차있는 하트
		var heartoff = "resources/img/btn/heartoff.png"; //비어있는 하트
		
		console.log("글쓴이 : " + $('#friend_num').val());
		
		
		var user_num = ${sessionScope.user_num};
		
		if ($('#img1').attr("src") === hearton) {
				$('#img1').attr("src", "resources/img/btn/heartoff.png"); //하트 버림
				$("img1").attr('data-original-title', '좋아요').tooltip('show');
				like='false';
			//console.log(${param.op_num});
		} else {
				$('#img1').attr("src", "resources/img/btn/hearton.png"); //하트 채움
				$('#img1').attr('data-original-title', '좋아요 취소').tooltip('show')
				like='true';
		}
		
		var param = {"like" : like, "liked_user" : $('#friend_num').val(), "user_num": user_num};

		ajax(param);
	}
	
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

<!-- 블락 및 블락 취소  -->
<script>

	function blockImage() {
		
		var block = 'false';
		
		var blockon = "resources/img/btn/dislike.png"; //블락한 상태(빨간색)
		var blockoff = "resources/img/btn/like.png"; //블락 안한 상태(까만색)
		
		console.log("글쓴이 : " + $('#friend_num').val());
		
		
		var user_num = ${sessionScope.user_num};
		
		if ($('#img2').attr("src") === blockon) {
				$('#img2').attr("src", "resources/img/btn/like.png"); //블락취소
				$('#img2').attr('data-original-title', '추천 제외 취소').tooltip('show')
				block='true';
		} else {
				$('#img2').attr("src", "resources/img/btn/dislike.png"); //블락
				$('#img2').attr('data-original-title', '추천에서 제외').tooltip('show')
				block='false';
		}
		
		var pm = {"block" : block, "blocked_user" : $('#friend_num').val()};
		
		blocked(pm);

	}
	
	function blocked(pm){
		
		console.log("들어오니?");
		
		$.ajax({
				url : "blockox",
				type : "post",
				data : pm,
				success : function(data){
					
				},
				error : function(){
					
				}
			});
	}


</script>

<div id="colorlib-main">

	<section class="ftco-section">
		<div class="hero-wrap" style="margin-bottom: -75px; margin-left: -27px;">
			<div class="overlay"></div>
			<div class="d-flex">
				<div class="author-image text img p-md-5"
					style="background-image: url(resources/upload/${membervo.user_img});">
				</div>
				<div class="author-info text p-4 p-md-5 mt-5 mb-5">
					<div class="desc">
						<div style="margin-top: -100px; margin-bottom: 40px;">
							<p style="text-align: center; float: left;">
								<c:choose>
									<c:when test="${heartchk == 1}">
										<img id="img1" src="resources/img/btn/hearton.png" onclick="toggleImage()" style="width: 50px; cursor: pointer;"
										data-toggle="tooltip" data-placement="top" title="좋아요 취소"/>
									</c:when>
									<c:otherwise>
										<img id="img1" src="resources/img/btn/heartoff.png" onclick="toggleImage()" style="width: 50px; cursor: pointer;"
										data-toggle="tooltip" data-placement="top" title="좋아요"/>
									</c:otherwise>
								</c:choose>
								<input type="hidden" name="friend_num" id="friend_num" value="${board_writer }"/>
							</p>
							<p style="text-align: center; margin-left: -300px;">
							<!-- 	<a href="#">채팅하기<img src="images/chat.png" style="margin-left: 10px;"></a> -->
							</p>
							<!-- 블락 및 블락 취소 -->
							<p style="text-align: center; float: right;">
								<c:choose>
									<c:when test="${blockchk == 1}">
										<img id="img2" src="resources/img/btn/like.png" onclick="blockImage()" style="width: 50px; cursor: pointer;"
										data-toggle="tooltip" data-placement="top" title="추천 제외 취소"/>
									</c:when>
									<c:otherwise>
										<img id="img2" src="resources/img/btn/dislike.png" onclick="blockImage()" style="width: 50px; cursor: pointer;"
										data-toggle="tooltip" data-placement="top" title="추천에서 제외"/>
									</c:otherwise>
								</c:choose>
							</p>
							<!-- 블락 끝 -->
						</div>
						<br>
						<h1 class="mb-4">
							<span>저는 ${membervo.name}입니다</span>
						</h1>
						<p class="mb-4">${membervo.user_intro}</p>
						<h3 class="signature h1">Eric</h3>
						<button type="button" id="chatrequest" onclick="chatrequest()">채팅신청</button>
					</div>
					<div id="boardBtn_group" ><button type="button" id="modal_open_btn" style="float: right;">신고하기</button></div>
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
	<%@include file="footer.jsp"%>
	<script>
	$(document).ready(function() {
		$('#modal_open_btn').click(function() {
			$('#myModal').modal('show');
		});
		
		$('#report_btn').click(function() {
 			alert('신고가 접수되었습니다.')
		})
	})
	function chatrequest() {
		var responeUser = $("#userNum").val(); //받는자
		var link = "chatRequest"
		var param = new Object();
		var requestUser = ${sessionScope.user_num}; //보내는자
		var nickname = $("#nickname").val();
		console.log("nickname"+nickname);
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
				console.log("알람보내기 성공!!!");
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
	}
	</script>