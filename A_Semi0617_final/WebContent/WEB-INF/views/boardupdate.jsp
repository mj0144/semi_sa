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
						<span class="mr-2"><a href="index">Home</a></span> <span>boardwrite</span>
					</p>
					<h1 class="bread">�����ϱ�</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section-3">
		<div class="pt-5 mt-5">
			<!-- END comment-list -->

			<div class="comment-form-wrap pt-5">
				<h3 class="mb-5">Leave a comment</h3>
				<form action="updatefeed" method="post" class="p-3 p-md-5 bg-light" enctype="multipart/form-data">
				<input type="hidden" name="BOARD_NUM" id="BOARD_NUM" value="${updateB.BOARD_NUM }">
					<div class="form-group">
						<label for="name">����</label> <input type="text"
							class="form-control" name="board_title" id="board_title">
					</div>
					<div class="form-group">
						<label for="message">����</label>
						<textarea name="board_content" id="board_content" cols="30" rows="10"
							class="form-control"></textarea>
					</div>
					<div class="form-group">
						<label for="file">�̹��� �߰��ϱ�</label> 
						<input type="file" id="files" name="files" multiple="multiple">
					</div>
					<div class="form-group">
						<input type="submit" value="�ۼ��ϱ�" id="clickbtn"
							class="btn py-3 px-4 btn-primary">
					</div>
				</form>
			</div>
		</div>
	</section>
	<%@include file="footer.jsp"%>
	<script>
			$('#clickbtn').on("click", function() {
				var bTitle = $("#board_title").val();
				var bContent = $("#board_content").val();
				var imgFile = $("#files").val();
				if(bTitle == ""){
					alert("������ �Է��ϼ���.");
					return false;
				}
				if(bContent == ""){
					alert("������ �Է��ϼ���.");
					return false;
				}
				if(imgFile == ""){
					alert("�̹����� �����ϴ�.");
					return false;
				}
				imgFile = imgFile.slice(imgFile.indexOf(".")+1).toLowerCase();
				if(imgFile != "jpg" && imgFile != "png" && imgFile != "gif" && imgFile != "jpeg"){
					alert("�̹������ϸ� ���ε� �� �� �ֽ��ϴ�.");
					return false;
				}
			});
	</script>