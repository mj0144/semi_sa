<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
<c:set var="tf" value="true"/>

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
			<a href="listSome?code=1">합이 잘 맞는 이성</a> &nbsp;<span>/</span>&nbsp; <a
				href="listSome?code=2">나에게 귀인인 이성 찾기</a> &nbsp;<span>/</span>&nbsp;
			<a>이성 전체보기</a>
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
			<a href="listFriend?code=1">합이 잘맞는 동성</a> &nbsp;<span>/</span>&nbsp;
			<a href="listFriend?code=2">나에게 귀인인 동성</a> &nbsp;<span>/</span>&nbsp;
			<a>동성 전체보기</a>
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
			<a href="listWhole?code=1">합이 잘맞는 인연</a> &nbsp;<span>/</span>&nbsp;
			<a href="listWhole?code=2">나에게 귀인인 인연</a> &nbsp;<span>/</span>&nbsp;
			<a>전체 인연 찾기</a>
		</div>
	</c:when>
	</c:choose>
		<div class="container">
			<div class="row d-flex">
				<div class="col-lg-8">
					<div class="row">															
					

						<c:forEach var="e" items="${list}">
							<c:forEach var="f" items="${e.mem }" varStatus="status">
								<div class="col-md-12">
									<div class="blog-entry ftco-animate d-md-flex">								
										<a id="person" class="img img-2"
											style="background-image: url(resources/upload/${f.user_img}); cursor: pointer;">
											<form action="friend" method="post" id="send_num">
												<input type="hidden" name="user_num" id="user_num"
													value="${f.user_num }">
											</form>
										</a>
										<div class="text text-2 p-4">
											<h3 class="mb-2">${f.nickname}</h3>
											<div class="meta-wrap">
												<p class="meta">
													<span>${f.birth}</span>
												</p>
											</div>
											<p class="mb-4">${f.user_intro}</p>

											<br>
											<p>
											
											좋아요 &nbsp; 
											
											<c:set var="hearton" value="false"/>
											<c:forEach var="g" items="${heart }">
												<c:choose>
													<c:when test="${g.liked_user == f.user_num}">
														<c:set var="hearton" value="true"/>
													</c:when>													
												</c:choose>
											</c:forEach>
											 		
											<c:choose>
												<c:when test="${hearton == 'true'}">
													<img id="${f.user_num}" class="img1" src="images/hearton.png" />
												</c:when>
												<c:otherwise>
													<img id="${f.user_num}" class="img1" src="images/heartoff.png"/>												
												</c:otherwise>
											</c:choose>
											</p>
										</div>
										<div>
										<img src="resources/img/ilju_animal/${e.result_img}.png" alt="iljuanimal" style="width: 70px;">
										</div>
									</div>
								</div>
							</c:forEach>
						</c:forEach>
						<c:if test="${pm eq 'listWhole' }">
					<div style="margin: 0 auto;">
						<form action="listSearch" method="POST">
							<select name="searchType">
								<option value="1">이성</option>
								<option value="2">동성</option>
								<option value="3">전체</option>
							</select>
								<input type="text" name="searchValue" placeholder="Search...">
								<input type="hidden" name="code" value="1">
								<span class="input-group-btn">
								<input type="submit" value="Search" class="btn btn-default">
								</span>
						</form>
					</div>
					</c:if>

					</div>
					<!-- END-->
					<div class="row">
						<div class="col">
							<div class="block-27">
								<div style="display: block; text-align: center;">
									<!-- 이전으로 -->
									<c:if test="${paging.prev }">
									<a href = "${pm }?code=${code }&nowPage=${paging.startPage - 1 }">&lt;</a>
									</c:if>
									<!-- 이전페이지 -->
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
									<!-- 다음으로 -->
									<c:if test="${paging.next && paging.endPage > 0 }">
									<a href = "${pm }?code=${code }&nowPage=${paging.endPage + 1 }">&gt;</a>
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