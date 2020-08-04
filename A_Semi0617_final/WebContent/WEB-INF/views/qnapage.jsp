<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
<!-- <link -->
<!-- 	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" -->
<!-- 	rel="stylesheet" id="bootstrap-css"> -->
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- <!-- 부가적인 테마 -->
-->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
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

#test_btn1 {
	float: right;
	border-radius: 5px;
	border: 1px solid white;
	background-color: #FFE08C;
	padding: 5px;
	color: white;
}

#test_btn1:hover {
	background: white;
	color: black;
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
	<!-- 여기부터-->
	<div class="container">
		<hr />

		<section id="container">
			<div style="height: 570px;">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>글 번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
						</tr>
					</thead>

					<c:forEach items="${vo}" var="list">
						<tr>
							<td><c:out value="${list.qna_num}" /></td>
							<td><a id="qtitle" style="cursor: pointer;"><c:out
										value="${list.qtitle}" />
									<form action="qnaDetail" method="post" id="qnalistform">
										<input type="hidden" name="qna_num" value="${list.qna_num}">
									</form> </a></td>
							<td><c:out value="${list.user_id}" /></td>
							<td><c:out value="${list.qdate}" /></td>
						</tr>
					</c:forEach>

				</table>
			</div>
			<form action="qnawritepage" method="post" id="qnawritepage">
				<input type="hidden" name="user_id" value="${user_id}">
				<button type="submit" id="test_btn1">1:1 문의하기</button>
			</form>
			<div class="col-md-offset-3">
				<ul class="pagination">
					<c:if test="${pageMaker.prev}">
						<li><a
							href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li
							<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
							<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>
			<!-- 			</form> -->
		</section>
	</div>
	<div id="list_deobogi"></div>


	<%@ include file="footer.jsp"%>
	<script>
		$(document).on('click', '#qtitle', function() {

			$(this).children('#qnalistform').submit();
		});

		// 		$(document).on('click', '#test_btn1', function() {
		// 			$('#qnawritepage').submit();
		// 		});

		//         var f = document.forms['qnalistform'];

		//         f.submit();
	</script>