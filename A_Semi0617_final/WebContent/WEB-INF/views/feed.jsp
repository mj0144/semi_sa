<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
<aside id="colorlib-aside" role="complementary"
	class="js-fullheight text-center">
	<h1 id="colorlib-logo">
		<a href="mypage"><span class="img"
			style="background-image: url(resources/upload/${sessionScope.user_img});"></span>${sessionScope.name }</a>
	</h1>
	<nav id="colorlib-main-menu" role="navigation">
		<ul style="line-height: 2;">
			<li class="colorlib-active"><a href="index">Home</a></li>
			<li><a href="viewsaju">사주보기</a></li>
			<li><a href="feed">피드</a></li>
			<li class="panel panel-default" id="dropdown">
				<a data-toggle="collapse" href="#dropdown-lvl1">
					<span class="glyphicon glyphicon-user"></span>
					인연찾기 <span class="caret"></span>
				</a> 
			<!-- Dropdown level 1 -->
				<div id="dropdown-lvl1" class="panel-collapse collapse">
					<div class="panel-body">
						<ul class="nav navbar-nav">
							<li style="font-size: 12px; margin-top: 5px; margin-bottom: 1px;"><a href="listSome?code=3">이성</a></li>
							<li style="font-size: 12px; margin-bottom: 1px;"><a href="listFriend?code=3">동성</a></li>
							<li style="font-size: 12px; margin-bottom: 0px;"><a href="listWhole?code=3">전체</a></li>
						</ul>
					</div>
				</div>
			</li>
			<li><a href="mypage">마이페이지</a></li>
			<li><a href="pay">결제상품</a></li>
			<li><a href="qnapage">QnA</a></li>
			<br>
			<br>
			<br>
			<br>
			<li><a href="logoutdo">로그아웃</a></li>
		</ul>
		<h3>
			<img src="images/heart.png">
		</h3>
	</nav>
</aside>
<!-- END COLORLIB-ASIDE -->
<!-- <link -->
	<href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
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

#writebtn {
	width: 120px;
	margin-bottom: 10px;
}

#writebtn:hover {
	background-color: black;
	color: black;
	font-weight: bold;
	cursor: pointer;
	transition: 0.5s;
}

#searchbtn:hover {
	background-color: white;
	color: black;
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

			
				<div class="col-sm-12 pull-center well">
					<form class="form-inline" action="feedsearch" method="post">
							
							<div class="input-group custom-search-form">
							<select class="form-control" name="search_option" style="width: 130px; border:0.5px solid; border-radius: 10px 0px 0px 10px;">
								<option value="1" >글 제목</option>
								<option value="2">작성자</option>
								<option value="3">내용</option>
								<option value="4">전체</option>
							</select>
								<input type="text" name="keyword" class="form-control" placeholder="Search..." 
								style="width: 400px; border-radius: 0px 10px 10px 0px; border:0.5px solid;">
								&nbsp;&nbsp;&nbsp;
								<span class="input-group-btn">
									<button class="btn btn-default" id="searchbtn" type="submit" style="height: 52px; width: 75px;
									border-radius: 10px 10px 10px 10px; background-color: black; color:white; border: 0.5px solid;">
										search
									</button>
								</span>
							</div>
					</form>
				</div>
			



			<div class="ftco-section2">
				<button id="writebtn" style="background-color: white; border-radius: 10px;" onclick="location='boardwrite'">write</button>
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