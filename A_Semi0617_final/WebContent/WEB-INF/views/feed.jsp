<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
<link href="https://fonts.googleapis.com/css?family=Yatra+One"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">


<link rel="stylesheet" href="resources/css/feed.css">

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
						<span class="mr-2"><a href="index">Home</a></span> <span>피드</span>
					</p>
					<h1 class="bread">피드</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section-3">
		<div class="photograhy">


			<div class="wrapper" style="height: 100px;">
				<h3>looking for something?</h3>
				<div class="search">
					<form name="cse" id="searchbox_demo" class="searchform"
						autocomplete="off">
						<input type="text" size="40" class="searchbox" /> <input
							type="submit" name="sa" value="Search"/>
					</form>


				</div>
			</div>
			
			<div class="ftco-section2">
				<button onclick="location='boardwrite'">write</button>
			</div>
			<div class="row">
				<c:forEach var="list" items="${ boardlist}">
					<div class="col-md-4 ftco-animate" id="scrollFeed">
						<a href="board?board_num=${ list.board_num }"> <input
							type="hidden" id="${list.board_num }"> <img
							src="resources/upload/${list.board_img }"
							class="photography-entry img d-flex justify-content-start align-items-end"
							style="width: 420px;">
							<div class="overlay"></div>
						</a>
					</div>
				</c:forEach>

			</div>
		</div>
	</section>
	<div id="list_deobogi"></div>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>

	<script src="resources/js/index.js"></script>
	<%@ include file="footer.jsp"%>
	<script>
		
	</script>