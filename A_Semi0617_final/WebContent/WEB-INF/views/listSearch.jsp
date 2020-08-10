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

<script>
	$(document).on('click', '#block img', function(event) {
		$(this).closest("#block").children('#send_num').submit();
	});
</script>

<div id="colorlib-main">
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
				<div 
					style="margin-bottom: 30px; margin-left: 30px; font-size: 20px;">
					<a href="listWhole?code=1">���� �߸´� �ο�</a> &nbsp;<span>/</span>&nbsp; <a
						href="listWhole?code=2">������ ������ �ο�</a> &nbsp;<span>/</span>&nbsp;
						<a href="listWhole?code=3">��ü �ο� ã��</a>
				</div>
		<div class="container">
			<div class="row d-flex">
				<div class="col-md-11">
					<div class="row" style="position: static;">															
						<c:forEach var="e" items="${list}">
							<c:forEach var="f" items="${e.mem }" varStatus="status">
								<div class="col-md-6">
									<div class="blog-entry ftco-animate d-md-flex">								
										<a id="person" class="img img-2"
											style="background-image: url(resources/upload/${f.user_img}); cursor: pointer;">
											<form action="friend" method="post" id="send_num">
												<input type="hidden" name="user_num" id="user_num"
													value="${f.user_num }">
											</form>
										</a>
										<div class="text text-2 p-4">
											<div style="float: left; width: 70%; height: 40px;">
												<h3 class="mb-2">${f.nickname}</h3>
											</div>
											<div style="float: right; width: 30%;">
												<img src="resources/img/ilju_animal/${e.result_img}.png" alt="iljuanimal" style="width: 40px; float: right;">
											</div>
											<div class="meta-wrap">
												<p class="meta">
													<span>${f.birth}</span>
												</p>
											</div>
											<p class="mb-4">${f.user_intro}</p>
											<div style="position:absolute; width: 100%;" >
											<div style="clear:both;">											
											<p>
												<span style="float:left;">���ƿ�</span> 
											</p>
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
										</div>
											<div style="float:left;" id="block">
												<span style="position:absolute; right:45px;">����</span>
												<img id="${f.user_num}" class="img2" style="width: 40px; position:absolute;right:10px; bottom:0; cursor:pointer;" src="images/blockon.png" />
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
						</c:forEach>
					<div style="margin: 0 auto;" class="col-md-12">
						<form action="listSearch" method="POST" style="text-align:center;">
							<select name="searchType">
								<option value="1">�̼�</option>
								<option value="2">����</option>
								<option value="3">��ü</option>
							</select>
								<input type="text" name="searchValue" placeholder="Search...">
								<input type="hidden" name="code" value="1">
								<span class="input-group-btn">
								<input type="submit" value="Search" class="btn btn-default">
								</span>
						</form>
					</div>
					</div>
					<!-- END-->
					<div class="row">
						<div class="col">
							<div class="block-27">
								<div style="display: block; text-align: center;">
									<!-- �������� -->
									<c:if test="${paging.prev }">
									<a id="setpm" href = "${pm }?code=${code }&nowPage=${paging.startPage - 1 }&searchType=${searchType}&searchValue=${searchValue}">&lt;</a>
									</c:if>
									<!-- ���������� -->
									<c:if test="${paging.startPage != 1 }">
										<a id="setpm"
											href="${pm }?code=${code }&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&searchType=${searchType}&searchValue=${searchValue}">&nbsp;</a>
									</c:if>
									<c:forEach begin="${paging.startPage }"
										end="${paging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == paging.nowPage }">
												<b>${p }</b>
											</c:when>
											<c:when test="${p != paging.nowPage }">
												<a id="setpm"
													href="${pm }?code=${code }&nowPage=${p }&cntPerPage=${paging.cntPerPage}&searchType=${searchType}&searchValue=${searchValue}">${p }</a>
											</c:when>
										</c:choose>
									</c:forEach>
									<!-- ���������� -->
									<c:if test="${paging.endPage != paging.lastPage}">
										<a id="setpm"
											href="${pm }?code=${code }&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&searchType=${searchType}&searchValue=${searchValue}">&nbsp;</a>
									</c:if>
									<!-- �������� -->
									<c:if test="${paging.next && paging.endPage > 0 }">
									<a id="setpm" 
									href = "${pm }?code=${code }&nowPage=${paging.endPage + 1 }&searchType=${searchType}&searchValue=${searchValue}">&gt;</a>
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