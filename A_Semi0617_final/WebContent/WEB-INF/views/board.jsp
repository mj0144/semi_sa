<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<div id="colorlib-main">
	<section class="ftco-section ftco-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-8 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index">Home</a></span> <span>board</span>
					</p>
					<h1 class="bread">게시글</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section-3">
		<!-- 내용들어갈자리 -->
		<div class="container">
			<div class="row">
				<div class="col-lg-8 ftco-animate">
					<input type="hidden" name="board_num" id="board_num" value="${view.BOARD_NUM }">
					
					 <div class="col-xs-12" style="margin:15px auto;">
					 <div id="cmBtn_group">
        			<img src="images/board.PNG" style="width: 20px;">
        			<label style="font-size:20px; color: black; font: bolder; float: left;">제목 :  ${view.BOARD_TITLE }</label>
        			<button type="button" id="modal_open_btn" style="float: right; border: 0; outline: 0;"><b>신고하기</b></button>
    				<hr style="color: gray;">
					</div>
					
					

					<p style="text-align: right;"><a href = "friend?user_num=${view.USER_NUM }">
					작성자 : ${view.NICKNAME }</a> | 작성시간 : ${view.BOARD_DATE }</p></div>
					<p>
						<img src="resources/upload/${view.BOARD_IMG }" alt="" class="img-fluid">
					</p>
					<p>
						${view.BOARD_CONTENT }
					</p>
					<%-- <c:if test="${user_num eq view.user_num }"> --%>
					<form name="delUp" action="post">
					<div class="ftco-section2">
					<input type="hidden" name="board_num" id="board_num" value="${view.BOARD_NUM }">
					<br><br><br>
					<div id="boardBtn_group" role="group" style="float:right;">
						<button type="button" id="boardup">게시글수정</button>
						<button type="button" id="boardDel">게시글삭제</button>
					</div>
					</div>
					</form>
					<%-- </c:if> --%>
					<div class="pt-1 mt-5">
						<div class="comment-form-wrap pt-5">
							<div class="mb-1">Leave a comment</div>
							<form action="#" class="bg-light">
								<div class="form-group">
									<input type="text" class="form-control" id="content" name="content" style="display: inline-block; color: black;">
									<span>
									<button type="button" id="replySubmit" class="btn py-2 px-2 btn-primary" style="float: right;">댓글달기</button>
									</span>
								</div>
							</form>
						</div>
						<h3 class="mb-5 font-weight-bold">댓글 ${replyCnt} 개</h3>
						<ul class="comment-list">
							<c:forEach var="item" items="${reply}">
								<li class="comment" >
									<div class="vcard bio">
									<input type="hidden" id = "${item.USER_NUM }" value="${item.USER_NUM }">
										<a href="friend?user_num=${item.USER_NUM }">
											<img src="resources/upload/${item.USER_IMG }" alt="Image placeholder">
										</a>
									</div>
									<div class="comment-body">
									<div>
									<div class="cmtup" style="color: black;">${item.NICKNAME} | ${item.CM_DATE}</div>
									<div id="cmt01" style="display: '';">
									<div style="float: right; font: bold; color: black;" >
									<c:if test = "${sessionScope.user_num == item.USER_NUM}">
									<div id="cmBtn_group">
									<button type="button" onclick="updatecmt_chk1()" id="cntUpdateBtn">수정</button>
									<button type="button" onclick="deletedComment('${item.CM_NUM}')" id="cntDeleteBtn">삭제</button>
									</div>
									</c:if>
 									<c:if test = "${sessionScope.user_num ne item.USER_NUM}">
 									<div id="cmBtn_group">
									<button type="button" data-toggle="modal" data-target="#myModal2" data-test='${item.CM_NUM}' onclick="here('${item.CM_NUM }')" id="modal_open_btn${item.CM_NUM }" class="modal_open_btn2">신고</button>
									</div>
 									</c:if>
									</div>
									
									
									<p>${item.CM_CONTENT}</p>
									<p>
									<a href="javascript:openReplyInput('${item.CM_NUM}');" class="reply">대댓글달기</a>
									</p>
									</div>
									<div id="cmt02" style="display: none;">
									<div><input type="text" id="updatdtxt" name="updatdtxt" style="width:450px; border: 1px solid gray; outline: none;"></div>
									<div id="cmBtn_group" style="float: right;">
									<button type="button" onclick="updatecmt_chk12('${item.CM_NUM}')" id="cntUpdateBtn2">수정</button>
									<button type="button" onclick="cancel_updatecmt()" id="cntDeleteBtn2">취소</button>
									</div>
									</div>
									</div>

									
										<%-- <h3>${item.NICKNAME}</h3>
										<div class="meta">${item.CM_DATE}</div>
										<c:if test = "${sessionScope.user_num == item.USER_NUM}">
										<button type="button" id="cm_delete_btn" name="cm_delete_btn" onclick="deletedComment('${item.CM_NUM}')">삭제</button>
										<button type="button" id="cm_update_btn" name="cm_update_btn">수정</button>
										</c:if>
										<p>${item.CM_CONTENT}</p>
										<p>
											<a href="javascript:openReplyInput('${item.CM_NUM}');" class="reply">대댓글달기</a>
										</p> --%>
									</div>
									</li>
								<c:if test="${not empty item.subList }">
									<ul class="children">
									<c:forEach var="sub" items="${item.subList }">
										<li class="comment" style="margin-left : 30px;">
											<div class="vcard bio">
											<a href="friend?user_num=${sub.USER_NUM }">
												<img src="resources/upload/${sub.USER_IMG }" alt="Image placeholder">
											</a>
											</div>
											<div class="comment-body">
												<h3>${sub.NICKNAME}</h3>
												<div class="meta">${sub.CM_DATE}</div>
												<p>${sub.CM_CONTENT }</p>
											</div>
										</li>
									</c:forEach>	
									</ul>
								</c:if>
								<ul class="children" style="display:none;" id="child${item.CM_NUM}">
										<li class="comment">
											<div class="vcard bio">
												<img src="resources/upload/${item.USER_IMG }" alt="Image placeholder">
											</div>
											<div class="comment-body">
												<form action="#" class="bg-light">
													<div class="form-group">
													<input type="text" id="replyContent${item.CM_NUM}" placeholder="내용을 입력하세요.">
              										 <span class="input-group-btn">
                 									   <button type="button" onclick="applyRecomment('${item.CM_NUM}')"
															class="btn py-2 px-2 btn-primary">댓글달기</button>
           											    </span>
													</div>
												</form>
											</div>

										</li>
									</ul>
							</c:forEach>	
						</ul>
						<!-- END comment-list -->
					</div>
				</div>
			</div>
		</div>
		<!-- 내용들어갈자리 -->
	</section>
	
	<!-- Modal -->
				    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				        <div class="modal-dialog  modal-dialog-centered" role="document">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <b><h2 class="modal-title" id="myModalLabel">게시물 신고하기</h2></b>
				                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="float: right;">
				                        <span aria-hidden="true">&times;</span>
				                    </button>
				                </div>
				                <div class="modal-body" >
										<hr style="color: gray;"><br><br>
										<form method="post" id="checked" action="reportBoard">
										<input type="radio" name="report_board" value="의심스럽거나 스팸입니다." checked/> 의심스럽거나 스팸입니다. <br/><br/>
										<input type="radio" name="report_board" value="계정 해킹이 의심됩니다."/> 계정 해킹이 의심됩니다.<br/><br/>
										<input type="radio" name="report_board" value="신고자 본인,또는 타인을 사칭하고 있습니다."/> 신고자 본인,또는 타인을 사칭하고 있습니다.<br/><br/>
										<input type="radio" name="report_board" value="가학적이거나 혐오내용을 담은 내용입니다."/> 가학적이거나 혐오내용을 담은 내용입니다.<br/><br/>
										<input type="radio" name="report_board" value="나체이미지 또는 성적 행위"/> 나체이미지 또는 성적 행위<br/><br/>
										<input type="radio" name="report_board" value="불법 또는 규제 상품 판매"/> 불법 또는 규제 상품 판매<br/><br/><br/>
										<input type="hidden" name="board_num" id="board_num" value="${view.BOARD_NUM }">
								</div>
				                <div class="modal-footer">
				                    <button type="submit" class="btn btn-primary" id="report_btn">제출</button>
				                     </form>
				                     <button type="button" class="btn btn-secondary" data-dismiss="modal" id="report_cancel">취소</button>
				                </div>
				            </div>
				        </div>
				    </div>
	<!-- Modal2 -->
				    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				        <div class="modal-dialog  modal-dialog-centered" role="document">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <b><h2 class="modal-title" id="myModalLabel">댓글 신고하기</h2></b>
				                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="float: right;">
				                        <span aria-hidden="true">&times;</span>
				                    </button>
				                </div>
				                <div class="modal-body" >
										<hr style="color: gray;"><br><br>
										<form method="post" id="checked" action="reportComment">
										<input type="radio" name="report_comment" value="의심스럽거나 스팸입니다." checked/> 의심스럽거나 스팸입니다. <br/><br/>
										<input type="radio" name="report_comment" value="계정 해킹이 의심됩니다."/> 계정 해킹이 의심됩니다.<br/><br/>
										<input type="radio" name="report_comment" value="신고자 본인,또는 타인을 사칭하고 있습니다."/> 신고자 본인,또는 타인을 사칭하고 있습니다.<br/><br/>
										<input type="radio" name="report_comment" value="가학적이거나 혐오내용을 담은 내용입니다."/> 가학적이거나 혐오내용을 담은 내용입니다.<br/><br/>
										<input type="radio" name="report_comment" value="나체이미지 또는 성적 행위"/> 나체이미지 또는 성적 행위<br/><br/>
										<input type="radio" name="report_comment" value="불법 또는 규제 상품 판매"/> 불법 또는 규제 상품 판매<br/><br/><br/>
										<input type="hidden" name="board_num" id="board_num" value="${view.BOARD_NUM }">
										<input type="hidden" name="comment_num" id="comment_num" value="">
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
	
		function here(comment_num) {
			$('#comment_num').val(comment_num);
		};
	
		$(document).ready(function() {
			$("#replySubmit").off("click");
			$("#replySubmit").on("click", function() {
				insertReplySubmit();
			});
			//----
			$("#modal_open_btn").click(function() {
				//alert('aa');
               	$("#myModal").modal("show");
            });
						
             $("#close_modal").click(function() {
                $("#myModal").modal("hide");
            });
             
             $('#myModal2').on('show.bs.modal', function (e) {
            	   // var comment_num = $(e.relatedTarget).data('test');
            	});
             
			/* $(".modal_open_btn2}").click(function(){
				alert('ㅎㅇ');
				$("#myModal2").modal("show");
			});
 	
             $("#close_modal2").click(function() {
                $("#myModal2").modal("hide");
            }); */
				
             $('#report_btn').click(function() {
            	// var check = $('#checked input:radio[name="report_board"]:checked').val();
     			//alert(check);
     			//var user_num = ${sessionScope.user_num};
     			//alert(user_num);
     			//var board_num = $('#board_num').val();
     			//alert(board_num);
     			
     			//var param = new Object();
     			//param.check = check;
     			//param.user_num = user_num;
     			//param.board_num = board_num;
     			//var paramJson = JSON.stringify(param);
     			//console.log("아작 직전"+paramJson);
     			alert('신고가 접수되었습니다.')
     			/* $.ajax({
     				type : "GET",
     				url : "reportBoard?params="+paramJson,
     				data : paramJson,
     				contentType : "application/json; charset=utf-8",
     				success :function(res){
     					 $("#myModal").modal("hide");
     					alert('신고접수되었습니다.');
     				},
     				error:function(request,status,error){
     					console.log(error);
     			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
     			       }
     				}); */
			})
           
			//----
			
		});
		
		 /* function submitA() {
			var check = $('#checked input:radio[name="report_board"]:checked').val();
			//alert(check);
			var user_num = ${sessionScope.user_num};
			//alert(user_num);
			var board_num = $('#board_num').val();
			//alert(board_num);
			
			var param = new Object();
			param.check = check;
			param.user_num = user_num;
			param.board_num = board_num;
			var paramJson = JSON.stringify(param);
			console.log("아작 직전"+paramJson);
			$.ajax({
				type : "POST",
				url : "/reportBoard",
				data : paramJson,
				contentType : "application/json; charset=utf-8",
				success :function(res){
					 $("#myModal").modal("hide");
					alert('신고접수되었습니다.');
				},
				error:function(request,status,error){
					console.log(error);
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			       }
				});
			
		  } */
		
		
		function insertReplySubmit() {
			var content = $("#content").val();
			var boardNum = '${param.board_num}';
			var param = new Object();
			if(content == '') {
				alert("아무내용이 없습니다. 댓글을 입력할 수 없습니다.");
				return;
			}
			if(boardNum == "") {
				alert("오류가 발생했습니다. 새로고침 해보세요");
				return;
			}
			param.content = content;
			param.boardNum = boardNum;
			var paramJson = JSON.stringify(param);
			console.log(paramJson);
			$.ajax({
				type : "POST",
				url : "reply",
				contentType : "application/json; charset=utf-8", 
				dataType : "json" ,
				data : paramJson,
				success : function(res) {
					console.log(res);
					if(res.result == "success") {
						alert("정상적으로 댓글이 입력되었습니다.");
						document.location.href =document.location.href
					}else {
						alert("서버와의 통신중에 오류가 발생하였습니다.");
					}
				},
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			       }
			});
		}
		
		function openReplyInput(replyNum) {
			$popup = $("#child" + replyNum);
			if($popup.css("display") == "none") {
				$popup.fadeIn();
			}else {
				$popup.css("display", "none");
			}
		}
		
		function applyRecomment(replyNum) {
			var param = new Object();
			
			var content = $("#replyContent" + replyNum).val();
			var boardNum = '${param.board_num}';
			var recommentNum = replyNum;
			
			if(content == '') {
				alert("아무내용이 없습니다. 댓글을 입력할 수 없습니다.");
				return;
			}
			param.content = content;
			param.boardNum = boardNum;
			param.recommentNum = recommentNum;
			var paramJson = JSON.stringify(param);
			console.log(paramJson);
			$.ajax({
				type : "POST",
				url : "reply",
				contentType : "application/json; charset=utf-8", 
				dataType : "json" ,
				data : paramJson,
				success : function(res) {
					console.log(res);
					if(res.result == "success") {
						alert("정상적으로 댓글이 입력되었습니다.");
						document.location.href =document.location.href
					}else {
						alert("서버와의 통신중에 오류가 발생하였습니다.");
					}
				},
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			       }
			});
		}
	
		$('#boardDel').click(function () {
			if(confirm("삭제하시겠습니까?")){
				document.delUp.action = "boardDel";	
				document.delUp.submit();
				
			}
		});
		$('#boardup').click(function () {
			document.delUp.action="upboard";
			document.delUp.submit();
		});
		
		
		//--------------------
		function deletedComment(cm_num) {
			if(confirm("삭제하시겠습니까?")){
				$.ajax({
					type : "GET",
					url : "commentDel?cm_num="+cm_num,
					
						
					success :function(res){
						//alert("댓글이 삭제되었습니다.");
						document.location.href =document.location.href;
				},
					
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			       }
				});
			}
		}
		
		function updatecmt_chk1() {
			document.getElementById('cmt01').style.display = 'none';
		    document.getElementById('cmt02').style.display = '';
		}
		
		function cancel_updatecmt() {
			document.getElementById('cmt02').style.display = 'none';
		    document.getElementById('cmt01').style.display = '';
		}
		
		function updatecmt_chk12(cm_num) {
			if(confirm("댓글을 수정하시겠습니까?")){
				var cm_content = $("#updatdtxt").val();
				var param = new Object();
				if(content == '') {
					alert("아무내용이 없습니다. 댓글을 입력해주세요.");
					return;
				}
				param.cm_content = cm_content;
				param.cm_num = cm_num;
				var paramJson = JSON.stringify(param);
				
				$.ajax({
					type : "POST",
					url : "commentUpdate",
					contentType : "application/json; charset=utf-8", 
					dataType : "text" ,
					data : paramJson,
					success : function(res){
						//alert("정상적으로 댓글이 수정되었습니다.");
						document.location.href =document.location.href;
					},
					error:function(request,status,error){
				        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				       }
				});
			}
		}
		
	</script>