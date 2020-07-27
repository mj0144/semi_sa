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

			
				<div class="col-sm-12 pull-center well" style="background-color: #FFFFE9">
					<form class="form-inline" action="feedsearch" method="post">
						<center>
							<select class="form-control" name="search_option">
								<option value="1" >글 제목</option>
								<option value="2">작성자</option>
								<option value="3">내용</option>
								<option value="4">전체</option>
								
							</select>


							<div class="input-group custom-search-form">
								<input type="text" name="keyword" class="form-control" placeholder="Search..."  style="width: 400px;">
								<span class="input-group-btn">
									<button class="btn btn-default" id="searchbtn" type="submit" style="height: 52px; width: 70px;">
										<i>search</i>
									</button>
								</span>
							</div>
					</form>
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


	<%@ include file="footer.jsp"%>
	<script>
		
	</script>