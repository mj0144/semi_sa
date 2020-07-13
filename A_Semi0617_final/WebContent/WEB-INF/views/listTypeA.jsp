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
	
	   	  $(this).attr("src", "images/heartoff.png"); //��Ʈ ����
	        like='false';
	        
			} else if($(this).attr("src") === "images/heartoff.png") {
			
				$(this).attr("src", "images/hearton.png"); //��Ʈ ä��
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
						<span class="mr-2"><a href="index">Home</a></span> <span>�ο�ã��</span>
					</p>
					<h1 class="bread">�̼��ο� ã��</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section">
		<div style="margin-bottom: 30px; margin-left: 30px; font-size: 20px;">
			<a>���� �� �´� �̼�</a> &nbsp;<span>/</span>&nbsp;
			<a href="listSome?code=2">������ ������ �̼� ã��</a> &nbsp;<span>/</span>&nbsp;
			<a href="listSome?code=3">�̼� ��ü����</a>
		</div>
	</c:when>
	<c:when test="${pm eq 'listFriend'}">
	
	<section class="ftco-section ftco-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-8 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index">Home</a></span> <span>�ο�ã��</span>
					</p>
					<h1 class="bread">�λ�ģ�� ã��</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section">
		<div style="margin-bottom: 30px; margin-left: 30px; font-size: 20px;">
			<a>���� �߸´� ����</a> &nbsp;<span>/</span>&nbsp;
			<a href="listFriend?code=2">������ ������ ����</a> &nbsp;<span>/</span>&nbsp;
			<a href="listFriend?code=3">���� ��ü����</a>
		</div>
	</c:when>
	<c:when test="${pm eq 'listWhole'}">
		<section class="ftco-section ftco-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-8 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index">Home</a></span> <span>�ο�ã��</span>
					</p>
					<h1 class="bread">��ü ã��</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section">
		<div style="margin-bottom: 30px; margin-left: 30px; font-size: 20px;">
			<a>���� �߸´� �ο�</a> &nbsp;<span>/</span>&nbsp;
			<a href="listWhole?code=2">������ ������ �ο�</a> &nbsp;<span>/</span>&nbsp;
			<a href="listWhole?code=3">��ü �ο� ã��</a>
		</div>
	</c:when>
	</c:choose>
		<div class="container">
			<div class="row d-flex">
				<div class="col-lg-8">
					<div class="row">

						<c:forEach var="e" items="${list.mem }" varStatus="r">
							<div class="col-md-12">
								<div class="blog-entry ftco-animate d-md-flex">
									<a id="person" class="img img-2"
										style="background-image: url(resources/upload/${e.user_img}); cursor: pointer;">
										<form action="friend" method="post" id="send_num">
											<input type="hidden" name="user_num" id="user_num"
												value="${e.user_num }">
										</form>
									</a>
									<div class="text text-2 p-4">
										<h3 class="mb-2">${e.nickname}</h3>
										<div class="meta-wrap">
											<p class="meta">
												<span>${e.birth}</span>
											</p>
										</div>
										<p class="mb-4">${e.user_intro}</p>
										<br>
										<p>
										���ƿ� &nbsp;
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
													<img id="${e.user_num}" class="img1" src="images/hearton.png" />
												</c:when>
												<c:otherwise>
													<img id="${e.user_num}" class="img1" src="images/heartoff.png"/>												
												</c:otherwise>
											</c:choose>
                           				<input type="hidden" name="friend_num" id="friend_num" value="${e.user_num}"/>
                           			
										</p>
									</div>
									<div>
										<img src="resources/img/ilju_animal/${list.result_img}.png" alt="iljuanimal" style="width: 70px;">
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
									<!-- ���������� -->
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