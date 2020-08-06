<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>

<div id="colorlib-main">
	<section class="ftco-section ftco-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-8 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index">Home</a></span> <span>board</span>
					</p>
					<h1 class="bread">�Խñ�</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section-3">
		<!-- ������ڸ� -->
		<div class="container">
			<div class="row">
				<div class="col-lg-8 ftco-animate">
					<input type="hidden" name="board_num" id="board_num" value="${view.BOARD_NUM }">
					<h2 class="titless">���� :  ${view.BOARD_TITLE } </h2>
					<p><a href = "friend?user_num=${view.USER_NUM }">�ۼ��� : ${view.NICKNAME }</a></p>
					<p>�ۼ��ð� : ${view.BOARD_DATE }</p>
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
					
					<div class="boardbtn" role="group" style="float:right;">
						<button type="button" id="boardup">�Խñۼ���</button>
						<button type="button" id="boardDel">�Խñۻ���</button>
					</div>
					</div>
					</form>
					<%-- </c:if> --%>
					<div class="pt-1 mt-5">
						<div class="comment-form-wrap pt-5">
							<div class="mb-1">Leave a comment</div>
							<form action="#" class="bg-light">
								<div class="form-group">
									<input type="text" class="form-control" id="content" style="color: black;">
								</div>
								<div class="form-group">
									<button type="button" id="replySubmit" 
										class="btn py-2 px-2 btn-primary">��۴ޱ�</button>
								</div>
							</form>
						</div>
						<h3 class="mb-5 font-weight-bold">��� ${replyCnt} ��</h3>
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
									<div style="float: right; font: bold; color: black;" >
									<c:if test = "${sessionScope.user_num == item.USER_NUM}">
									<a onclick="deletedComment('${item.CM_NUM}')" >����</a> | 
									<a onclick="deletedComment('${item.CM_NUM}')" >����</a>
									</c:if>
									</div>
									</div>
									<div>
									<p>${item.CM_CONTENT}</p>
									<p>
									<a href="javascript:openReplyInput('${item.CM_NUM}');" class="reply">���۴ޱ�</a>
									</p>
									</div>

									
										<%-- <h3>${item.NICKNAME}</h3>
										<div class="meta">${item.CM_DATE}</div>
										<c:if test = "${sessionScope.user_num == item.USER_NUM}">
										<button type="button" id="cm_delete_btn" name="cm_delete_btn" onclick="deletedComment('${item.CM_NUM}')">����</button>
										<button type="button" id="cm_update_btn" name="cm_update_btn">����</button>
										</c:if>
										<p>${item.CM_CONTENT}</p>
										<p>
											<a href="javascript:openReplyInput('${item.CM_NUM}');" class="reply">���۴ޱ�</a>
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
													
													<input type="text" id="replyContent${item.CM_NUM}" placeholder="������ �Է��ϼ���.">
              										 <span class="input-group-btn">
                 									   <button type="button" onclick="applyRecomment('${item.CM_NUM}')"
															class="btn py-2 px-2 btn-primary">��۴ޱ�</button>
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
		<!-- ������ڸ� -->
	</section>
	<%@include file="footer.jsp"%>
	
	<script>
		$(document).ready(function() {
			$("#replySubmit").off("click");
			$("#replySubmit").on("click", function() {
				insertReplySubmit();
			});
			//----
			
			//----
			
		});
		
		
		
		function insertReplySubmit() {
			var content = $("#content").val();
			var boardNum = '${param.board_num}';
			var param = new Object();
			if(content == '') {
				alert("�ƹ������� �����ϴ�. ����� �Է��� �� �����ϴ�.");
				return;
			}
			if(boardNum == "") {
				alert("������ �߻��߽��ϴ�. ���ΰ�ħ �غ�����");
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
						alert("���������� ����� �ԷµǾ����ϴ�.");
						document.location.href =document.location.href
					}else {
						alert("�������� ����߿� ������ �߻��Ͽ����ϴ�.");
					}
				},
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
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
				alert("�ƹ������� �����ϴ�. ����� �Է��� �� �����ϴ�.");
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
						alert("���������� ����� �ԷµǾ����ϴ�.");
						document.location.href =document.location.href
					}else {
						alert("�������� ����߿� ������ �߻��Ͽ����ϴ�.");
					}
				},
				error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // ���� �� ó��
			       }
			});
		}
	
		$('#boardDel').click(function () {
			if(confirm("�����Ͻðڽ��ϱ�?")){
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
			if(confirm("�����Ͻðڽ��ϱ�?")){
				$.ajax({
					type : "GET",
					url : "commentDel?cm_num="+cm_num,
					
						
					success :function(res){
						alert("����� �����Ǿ����ϴ�.");
						document.location.href =document.location.href;
				},
					
					error : function(error) {
						alert("��ۻ�������"+error)
					}
				});
			}
		}
		
		
	</script>