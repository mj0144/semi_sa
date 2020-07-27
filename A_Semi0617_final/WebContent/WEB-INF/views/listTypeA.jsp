<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script>
	$(document).on('click', '#person', function(event) {
		$(this).children('#send_num').submit();
	});
</script>

<script>
	$(document).on('click', '.img1', function(event) { 
		 var like = 'false';
	    var user_num = ${sessionScope.user_num};
	     
	     if ($(this).attr("src") === "images/hearton.png") {
	
	   	  $(this).attr("src", "images/heartoff.png"); //하트 버림
	        like='false';
	        
			} else if($(this).attr("src") === "images/heartoff.png") {
			
				$(this).attr("src", "images/hearton.png"); //하트 채움
				like='true';
			}
	     var param = {"like" : like, "liked_user" : $(this).attr("id"), "user_num": user_num};
	     console.log(param);
	
	     ajax(param);
		
	});


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

<script>
	$(document).on('click', '#block img', function(event) {
		$(this).closest("#block").children('#send_num').submit();
	});
</script>

<div id="colorlib-main">
	<c:choose>
	<c:when test="${pm eq 'listSome'}">
	<section class="ftco-section ftco-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-8 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index">Home</a></span> <span>인연찾기</span>
					</p>
					<h1 class="bread">이성인연 찾기</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section">
		<div style="margin-bottom: 30px; margin-left: 30px; font-size: 20px;">
			<a>합이 잘 맞는 이성</a> &nbsp;<span>/</span>&nbsp;
			<a href="listSome?code=2">나에게 귀인인 이성 찾기</a> &nbsp;<span>/</span>&nbsp;
			<a href="listSome?code=3">이성 전체보기</a>
		</div>
	</c:when>
	<c:when test="${pm eq 'listFriend'}">
	
	<section class="ftco-section ftco-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-8 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index">Home</a></span> <span>인연찾기</span>
					</p>
					<h1 class="bread">인생친구 찾기</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section">
		<div style="margin-bottom: 30px; margin-left: 30px; font-size: 20px;">
			<a>합이 잘맞는 동성</a> &nbsp;<span>/</span>&nbsp;
			<a href="listFriend?code=2">나에게 귀인인 동성</a> &nbsp;<span>/</span>&nbsp;
			<a href="listFriend?code=3">동성 전체보기</a>
		</div>
	</c:when>
	<c:when test="${pm eq 'listWhole'}">
		<section class="ftco-section ftco-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-8 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index">Home</a></span> <span>인연찾기</span>
					</p>
					<h1 class="bread">전체 찾기</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section">
		<div style="margin-bottom: 30px; margin-left: 30px; font-size: 20px;">
			<a>합이 잘맞는 인연</a> &nbsp;<span>/</span>&nbsp;
			<a href="listWhole?code=2">나에게 귀인인 인연</a> &nbsp;<span>/</span>&nbsp;
			<a href="listWhole?code=3">전체 인연 찾기</a>
		</div>
	</c:when>
	</c:choose>
		<div class="container">
			<div class="row d-flex">
				<div class="col-md-11">
					<div class="row">

						<c:forEach var="e" items="${list.mem }" varStatus="r">
							<div class="col-md-6">
								<div class="blog-entry ftco-animate d-md-flex">
									<a id="person" class="img img-2"
										style="background-image: url(resources/upload/${e.user_img}); cursor: pointer;">
										<form action="friend" method="post" id="send_num">
											<input type="hidden" name="user_num" id="user_num"
												value="${e.user_num }">
										</form>
									</a>
									<div class="text text-2 p-4">
										<div style="float: left; width: 70%; height: 40px;">
											<h3 class="mb-2">${e.nickname}</h3>
										</div>
										<div style="float: right; width: 30%;">
											<img src="resources/img/ilju_animal/${list.result_img}.png" alt="iljuanimal" style="width: 40px; float: right;">
										</div>
										<div class="meta-wrap">
											<p class="meta">
												<span>${e.birth}</span>
											</p>
										</div>
										<p class="mb-4">${e.user_intro}</p>
											<div style="position:absolute; width: 100%;" >
											<div style="clear:both;">											
											<p>
												<span style="float:left;">좋아요</span> 
											</p>
											<c:set var="hearton" value="false"/>
											<c:forEach var="g" items="${heart }">
												<c:choose>
													<c:when test="${g.liked_user == e.user_num}">
														<c:set var="hearton" value="true"/>
													</c:when>													
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${hearton == 'true'}">
													<img id="${e.user_num}" class="img1" style="width: 20px; cursor:pointer; float: left;" src="images/hearton.png" />
												</c:when>
												<c:otherwise>
													<img id="${e.user_num}" class="img1" style="width: 20px; cursor:pointer; float: left;" src="images/heartoff.png"/>												
												</c:otherwise>
											</c:choose>
									</div>
									<div style="float:left;" id="block">
										<span style="position:absolute; right:45px;">차단</span>
										<img id="${e.user_num}" class="img2" style="width: 40px; position:absolute;right:10px; bottom:0; cursor:pointer;" src="images/blockon.png" />
										<form action="block" method="post" id="send_num">
											<input type="hidden" name="user_num" id="user_num" value="${f.user_num }">
											<input type="hidden" name="pm" id="pm" value="${pm}">
											<input type="hidden" name="code" id="code" value="${code}">
										</form>
									</div>
									</div>
								</div>
							</div>
							</div>
						</c:forEach>

					</div>
					<!-- END-->
					<div class="row">
						<div class="col">
							<div class="block-27">
								<div style="display: block; text-align: center;">
									<c:if test="${paging.prev }">
										<a href="${pm }?code=${code }&nowPage=${paging.startPage - 1 }">&lt;</a>
									</c:if>
									<c:if test="${paging.startPage != 1 }">
										<a
											href="${pm }?code=${code }&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&nbsp;</a>
									</c:if>
									<c:forEach begin="${paging.startPage }"
										end="${paging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == paging.nowPage }">
												<b>${p }</b>
											</c:when>
											<c:when test="${p != paging.nowPage }">
												<a
													href="${pm }?code=${code }&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
											</c:when>
										</c:choose>
									</c:forEach>
									<!-- 다음페이지 -->
									<c:if test="${paging.endPage != paging.lastPage}">
										<a
											href="${pm }?code=${code }&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&nbsp;</a>
									</c:if>
									<c:if test="${paging.next && paging.endPage > 0 }">
										<a href="${pm }?code=${code }&nowPage=${paging.endPage + 1 }">&gt;</a>
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