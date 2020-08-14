<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- �ΰ����� �׸� -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style>
.ftco-section2 {
	text-align: right;
	margin-right: 50px;
	border-bottom: 1px solid black;
	margin-bottom: 20px;
}

button {
	width: 120px;
	margin-bottom: 10px;
}

button:hover {
	background: black;
	color: white;
	font-weight: bold;
	cursor: pointer;
	transition: 0.5s;
}
</style>
<div id="colorlib-main">
	<section class="ftco-section ftco-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-8 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index">Home</a></span> <span>Q&A</span>
					</p>
					<h1 class="bread">Q&A</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- �������-->

	<section class="ftco-section-3">
		<div class="pt-5 mt-5">
			<!-- END comment-list -->

			<div class="comment-form-wrap pt-5">
				<h3 class="mb-5" style="text-align: center;">1:1 ���Ǳ� �ۼ��ϱ�</h3>
				<form action="qnawrite" name="qnawrite" method="post"
					class="p-3 p-md-5 bg-light" enctype="multipart/form-data">
					<input type="hidden" class="form-control" name="user_num" id="user_num" value="${user_num }">

					<div class="form-group">
						<label for="name">�ۼ���</label> <input type="text"
							class="form-control" name="user_id" value="${user_id }"
							id="user_id" readonly="readonly"> <input type="hidden"
							class="form-control" name="qdate" id="qdate">
					</div>
					<div class="form-group">
						<label for="name">����</label> <input type="text"
							class="form-control" name="qtitle" id="qtitle">
					</div>
					<div class="form-group">
						<label for="message">����</label>
						<textarea name="askcontent" id="askcontent" cols="30" rows="10"
							class="form-control"></textarea>
					</div>

					<div class="form-group">
						<input type="submit" value="�ۼ��ϱ�" id="clickbtn"
							class="btn py-3 px-4 btn-primary">
							<button type="button" onclick="location.href='qnapage'"
							class="list_btn btn btn-primary" style="float: right;">���</button>
					</div>
				</form>
						
			</div>
		</div>
	</section>

	<!-- ������� -->



	<%@ include file="footer.jsp"%>
	<script>
		$('#clickbtn').on("click", function() {
			var bTitle = $("#qtitle").val();
			var bContent = $("#askcontent").val();
			if (bTitle == "") {
				alert("������ �Է��ϼ���.");
				return false;
			}
			if (bContent == "") {
				alert("������ �Է��ϼ���.");
				return false;
			}
		});
	</script>