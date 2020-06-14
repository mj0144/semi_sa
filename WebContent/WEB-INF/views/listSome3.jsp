<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script>
	$(document).on('click', '#person', function(event) {
		$(this).children('#send_num').submit();
	});
</script>

<div id="colorlib-main">
	<section class="ftco-section ftco-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-8 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index">Home</a></span> <span>친구찾기</span>
					</p>
					<h1 class="bread">애인 찾기</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section">
		<div style="margin-bottom: 30px; margin-left: 30px; font-size: 20px;">
			<a href="listSome?code=1">천생연분 찾기</a> &nbsp;<span>/</span>&nbsp; <a
				href="listSome?code=2">나를 도와주는 인연 찾기</a> &nbsp;<span>/</span>&nbsp;
			<a>전체보기</a>
		</div>
		<div class="container">
			<div class="row d-flex">
				<div class="col-lg-8">
					<div class="row">

						<c:forEach var="e" items="${list}">
							<c:forEach var="f" items="${e.mem }">
								<div class="col-md-12">
									<div class="blog-entry ftco-animate d-md-flex">
										<a id="person" class="img img-2"
											style="background-image: url(images/image_1.jpg); cursor: pointer;">
											<form action="friend" method="post" id="send_num">
												<input type="hidden" name="user_num" id="user_num"
													value="${f.user_num }">
											</form>
										</a>
										<div class="text text-2 p-4">
											<h3 class="mb-2">${f.name}</h3>
											<div class="meta-wrap">
												<p class="meta">
													<span>${f.birth}</span>
												</p>
											</div>
											<p class="mb-4">${f.user_intro}</p>

											<br>
											<p>
												<a href="#">좋아요 &nbsp;<img src="images/heart2.png"></a>
											</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:forEach>

					</div>
					<!-- END-->
					<div class="row">
						<div class="col">
							<div class="block-27">
								<div style="display: block; text-align: center;">
									<!-- 이전으로 -->
									<c:if test="${paging.prev }">
									<a href = "listSome?code=3&nowPage=${paging.startPage - 1 }">&lt;</a>
									</c:if>
									<!-- 이전페이지 -->
									<c:if test="${paging.startPage != 1 }">
										<a
											href="listSome?code=3&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&nbsp;</a>
									</c:if>
									<c:forEach begin="${paging.startPage }"
										end="${paging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == paging.nowPage }">
												<b>${p }</b>
											</c:when>
											<c:when test="${p != paging.nowPage }">
												<a
													href="listSome?code=3&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
											</c:when>
										</c:choose>
									</c:forEach>
									<!-- 다음페이지 -->
									<c:if test="${paging.endPage != paging.lastPage}">
										<a
											href="listSome?code=3&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&nbsp;</a>
									</c:if>
									<!-- 다음으로 -->
									<c:if test="${paging.next && paging.endPage > 0 }">
									<a href = "listSome?code=3&nowPage=${paging.endPage + 1 }">&gt;</a>
									</c:if>
								</div>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>

	<script>
		
	</script>

	<%@ include file="footer.jsp"%>