<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>

<!-- ���ƿ� �� ���ƿ� ���  -->
<script>
 	function toggleImage() {
		var like = 'false';
		
		var hearton = "resources/img/btn/hearton.png"; //���ִ� ��Ʈ
		var heartoff = "resources/img/btn/heartoff.png"; //����ִ� ��Ʈ
		
		console.log("�۾��� : " + $('#friend_num').val());
		
		
		var user_num = ${sessionScope.user_num};
		
		if ($('#img1').attr("src") === hearton) {
				$('#img1').attr("src", "resources/img/btn/heartoff.png"); //��Ʈ ����
				$("img1").attr('data-original-title', '���ƿ�').tooltip('show');
				like='false';
			//console.log(${param.op_num});
		} else {
				$('#img1').attr("src", "resources/img/btn/hearton.png"); //��Ʈ ä��
				$('#img1').attr('data-original-title', '���ƿ� ���').tooltip('show')
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

<!-- ��� �� ��� ���  -->
<script>

	function blockImage() {
		
		var block = 'false';
		
		var blockon = "resources/img/btn/dislike.png"; //����� ����(������)
		var blockoff = "resources/img/btn/like.png"; //��� ���� ����(���)
		
		console.log("�۾��� : " + $('#friend_num').val());
		
		
		var user_num = ${sessionScope.user_num};
		
		if ($('#img2').attr("src") === blockon) {
				$('#img2').attr("src", "resources/img/btn/like.png"); //������
				$('#img2').attr('data-original-title', '��õ ���� ���').tooltip('show')
				block='true';
		} else {
				$('#img2').attr("src", "resources/img/btn/dislike.png"); //���
				$('#img2').attr('data-original-title', '��õ���� ����').tooltip('show')
				block='false';
		}
		
		var pm = {"block" : block, "blocked_user" : $('#friend_num').val()};
		
		blocked(pm);

	}
	
	function blocked(pm){
		
		console.log("������?");
		
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
	<section class="ftco-section ftco-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-8 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index">Home</a></span> <span
							class="mr-2"><a href="listSome">ģ��ã��</a></span> <span>������</span>
					</p>
					<h1 class="bread">${membervo.name} </h1><input type="hidden" id="nickname" value="${membervo.name }">
					<input type="hidden" id="userNum" value="${board_writer}">
				</div>
			</div>
		</div>
	</section>
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
										data-toggle="tooltip" data-placement="top" title="���ƿ� ���"/>
									</c:when>
									<c:otherwise>
										<img id="img1" src="resources/img/btn/heartoff.png" onclick="toggleImage()" style="width: 50px; cursor: pointer;"
										data-toggle="tooltip" data-placement="top" title="���ƿ�"/>
									</c:otherwise>
								</c:choose>
								<input type="hidden" name="friend_num" id="friend_num" value="${board_writer }"/>
							</p>
							<p style="text-align: center; margin-left: -300px;">
							<!-- 	<a href="#">ä���ϱ�<img src="images/chat.png" style="margin-left: 10px;"></a> -->
							</p>
							<!-- ��� �� ��� ��� -->
							<p style="text-align: center; float: right;">
								<c:choose>
									<c:when test="${blockchk == 1}">
										<img id="img2" src="resources/img/btn/like.png" onclick="blockImage()" style="width: 50px; cursor: pointer;"
										data-toggle="tooltip" data-placement="top" title="��õ ���� ���"/>
									</c:when>
									<c:otherwise>
										<img id="img2" src="resources/img/btn/dislike.png" onclick="blockImage()" style="width: 50px; cursor: pointer;"
										data-toggle="tooltip" data-placement="top" title="��õ���� ����"/>
									</c:otherwise>
								</c:choose>
							</p>
							<!-- ��� �� -->
						</div>
						<br>
						<h1 class="mb-4">
							<span>���� ${membervo.name}�Դϴ�</span>
						</h1>
						<p class="mb-4">${membervo.user_intro}</p>
						<h3 class="signature h1">Eric</h3>
						<button type="button" id="chatrequest" onclick="chatrequest()">ä�ý�û</button>
					</div>
					<div id="boardBtn_group" ><button type="button" id="modal_open_btn" style="float: right;">�Ű��ϱ�</button></div>
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
	
	<!-- Modal -->
				    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				        <div class="modal-dialog  modal-dialog-centered" role="document">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <b><h2 class="modal-title" id="myModalLabel">�ҷ����� �Ű��ϱ�</h2></b>
				                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="float: right;">
				                        <span aria-hidden="true">&times;</span>
				                    </button>
				                </div>
				                <div class="modal-body" >
										<hr style="color: gray;"><br><br>
										<form method="post" id="checked" action="reportUser">
										<input type="radio" name="report_comment" value="�ǽɽ����ų� �����Դϴ�." checked/> �ǽɽ����ų� �����Դϴ�. <br/><br/>
										<input type="radio" name="report_comment" value="���� ��ŷ�� �ǽɵ˴ϴ�."/> ���� ��ŷ�� �ǽɵ˴ϴ�.<br/><br/>
										<input type="radio" name="report_comment" value="�Ű��� ����,�Ǵ� Ÿ���� ��Ī�ϰ� �ֽ��ϴ�."/> �Ű��� ����,�Ǵ� Ÿ���� ��Ī�ϰ� �ֽ��ϴ�.<br/><br/>
										<input type="radio" name="report_comment" value="�������� �Խù��� �Խ��߽��ϴ�."/> �������� �Խù��� �Խ��߽��ϴ�.<br/><br/>
										<input type="radio" name="report_comment" value="��Ÿ"/> ��Ÿ<br/><br/>
										<input type="hidden" name="friend_num" id="friend_num" value="${board_writer }"/>
								</div>
				                <div class="modal-footer">
				                    <button type="submit" class="btn btn-primary" id="report_btn">����</button>
				                     </form>
				                     <button type="button" class="btn btn-secondary" data-dismiss="modal" id="report_cancel">���</button>
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
 			alert('�Ű� �����Ǿ����ϴ�.')
		})
	})
	function chatrequest() {
		var responeUser = $("#userNum").val(); //�޴���
		var link = "chatRequest"
		var param = new Object();
		var requestUser = ${sessionScope.user_num}; //��������
		var nickname = $("#nickname").val();
		console.log("nickname"+nickname);
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
				console.log("�˶������� ����!!!");
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
	}
	</script>