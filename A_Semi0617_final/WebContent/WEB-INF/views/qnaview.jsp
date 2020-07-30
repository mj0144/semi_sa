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


	<div class="container">
		<header>
			<h1>Q&A</h1>
		</header>
		<hr />

		<section id="container">


			<c:forEach var="vo" items="${list}">
				<div class="form-group">
				<form action="deleteqnapage" name="deleteqnapage" method="post"
					id="deleteqnapage">
					<input type="hidden" name="qna_num" value="${vo.qna_num}">
					<input type="hidden" name="user_id" value="${vo.user_id}">
				</form>
					<label for="regdate" class="col-sm-2 control-label">�ۼ���¥</label>
					<c:out value="${vo.qdate}" />
				</div>
				<br>
				<br>
				<div class="form-group">
					<label for="writer" class="col-sm-2 control-label">�ۼ���</label> <input
						type="text" id="user_id" name="user_id" class="form-control"
						value="${vo.user_id}" readonly="readonly" />
				</div>
				<br>
				<br>
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label">����</label> <input
						type="text" id="qtitle" name="qtitle" class="form-control"
						value="${vo.qtitle}" readonly="readonly" />
				</div>
				<br>
				<br>
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">����</label>
					<textarea id="askcontent" name="askcontent" class="form-control"
						readonly="readonly"><c:out value="${vo.askcontent}" /></textarea>
				</div>
			</c:forEach>

		</section>
		<section>
			<hr>
			<br>
			<div>
				<button type="button" id="delete_btn"
					class="delete_btn btn btn-danger" style="float: left;">����</button>

				<button type="button" class="list_btn btn btn-primary"
					style="float: right;">���</button>
			</div>
		</section>
		<hr />
	</div>
	<!--  �������-->
	<div id="list_deobogi"></div>


	<%@ include file="footer.jsp"%>
	<script type="text/javascript">
		$(document).ready(function() {

			$(document).on('click', '#delete_btn', function() {
				alert('wdwd');

				console.log($(this).children('#deleteqnapage'))

				var f = document.forms['deleteqnapage'];

				f.submit();

			});

			// 				location.href = 'deleteqnapage';

			// ���
			$(".list_btn").on("click", function() {

				location.href = 'qnapage';
			});

		});
	</script>