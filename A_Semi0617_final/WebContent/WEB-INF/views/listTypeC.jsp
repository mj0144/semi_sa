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
	<!-- �̹��� ������ �� ���� �����ʷ� �Ѿ --> 
	$(document).on('click', '#person', function(event) {
		$(this).children('#send_num').submit();
	});

</script>

<script>

	<!-- ��Ʈ ������ ��, ��Ʈ on/off ��� ��ȭ -->		
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
	
<!-- ���ƿ� ���� �� �޾ƿͼ� ���� -->	   
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
	<!-- ��� �� �Ķ���Ͱ� controller�� �ѱ� -->
	$(document).on('click', '#block img', function(event) {
		$(this).closest("#block").children('#send_num').submit();
	});
</script>

<script>
<!--  üũ�ڽ� ��ü���� �� ��ü����(����) -->
$(document).on('click', '#box-3', function(event) {

    if($("#box-3").is(":checked")){
        $(".chk").prop("checked", true);
    }
    else{
        $(".chk").prop("checked", false);
    }
});

<!--  üũ�ڽ� ��ü���� �� ��ü ����(����) -->
$(document).on('click', '#box2-3', function(event) {

    if($("#box2-3").is(":checked")){
        $(".chk2").prop("checked", true);
    }
    else{
        $(".chk2").prop("checked", false);
    }
});

    
<!-- // �Ѱ��� üũ�ڽ� ���� ������ ��ü���� üũ�ڽ��� ����(����) -->
$(document).on('click', '.chk', function(event) {
    if($("input[class='chk']:checked").length == 2){
        $("#box-3").prop("checked", true);
    }else{
        $("#box-3").prop("checked", false);
    }
});

<!-- // �Ѱ��� üũ�ڽ� ���� ������ ��ü���� üũ�ڽ��� ����(����) -->
$(document).on('click', '.chk2', function(event) {
    if($("input[class='chk2']:checked").length == 2){
        $("#box2-3").prop("checked", true);
    }else{
        $("#box2-3").prop("checked", false);
    }
});


</script>

<style>
input[type="checkbox"] { display: none; }

input[type="checkbox"] + label {
  display: block;
  position: relative;
  padding-left: 35px;
  margin: 0 35px 0 10px;
  margin-bottom: 20px;
  font: 14px/20px 'Open Sans', Arial, sans-serif;
  color: #ddd;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  float: left;
}

input[type="checkbox"] + label:before {
  content: '';
  display: block;
  width: 20px;
  height: 20px;
  border: 1px solid #ccb78f;
  position: absolute;
  left: 0;
  top: 0;
  opacity: .6;
  -webkit-transition: all .12s, border-color .08s;
  transition: all .12s, border-color .08s;
}

input[type="checkbox"]:checked + label:before {
  width: 10px;
  top: -5px;
  left: 5px;
  border-radius: 0;
  opacity: 1;
  border-top-color: transparent;
  border-left-color: transparent;
  -webkit-transform: rotate(45deg);
  transform: rotate(45deg);
}
</style>

<div id="colorlib-main">
	<section class="ftco-section ftco-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-8 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index">Home</a></span> <span>�ο�ã��</span>
					</p>
					<h1 class="bread">��ü �ο� ã��</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section">

		<div class="container">
			<div class="row d-flex">
				<!-- üũ�ڽ� ���� -->
				<div class="col-md-12" style="border: 1px solid #ccb78f; margin-bottom: 30px; padding: 30px;">
					<form action="listWhole?code=3" class="detailck" method="post">
					<div class="boxes" style="padding-bottom: 30px;">
					<!-- ���� üũ �ڽ� -->
					  <div style="float: left; margin-right: 100px;">���� </div>
					  <input type="checkbox" id="box-1" class="chk" name="sex" value="m"<c:if test="${paging.sex =='m' ||paging.sex ==null }">checked</c:if>>
					  <label for="box-1">����</label>
					  
					  <input type="checkbox" id="box-2" class="chk" name="sex" value="f" <c:if test="${paging.sex =='f'||paging.sex ==null}">checked</c:if>>
					  <label for="box-2">����</label>
					   
					  <input type="checkbox" id="box-3" name="sex" value="a" <c:if test="${paging.sex ==null}">checked</c:if>>
					  <label for="box-3">��ü</label>
					  
					</div>
					<hr>
					<!-- ����, MBTI ���� üũ�ڽ� -->
					  <div class="boxes2" style="padding-bottom: 30px;">
						  <div style="float: left; margin-right: 100px;">���� </div>
						  <input type="checkbox" id="box2-1" class="chk2" name="samb" value="saju"<c:if test="${paging.samb !='mbti'}">checked</c:if>>
						  <label for="box2-1">����</label>
						  
						  <input type="checkbox" id="box2-2" class="chk2" name="samb" value="mbti"<c:if test="${paging.samb !='saju'}">checked</c:if>>
						  <label for="box2-2">MBTI</label>
						   
						  <input type="checkbox" id="box2-3" name="samb" value="all"<c:if test="${paging.samb !='saju' && paging.samb !='mbti'}">checked</c:if>>
						  <label for="box2-3">���� + MBTI</label>
					  </div>
					<div>
					<input type="submit" value="����" style="float: right;">
					</div>
					</form>
				</div>
				<!-- üũ�ڽ� �� -->
				<div class="col-md-11">
					<div class="row">
						<!-- ����Ʈ ���� -->
					
						<c:forEach var="e" items="${list}">
								<div class="col-md-6">
									<div class="blog-entry ftco-animate d-md-flex">								
										<a id="person" class="img img-2"
											style="background-image: url(resources/upload/${e.USER_IMG}); cursor: pointer;">
											<form action="friend" method="post" id="send_num">
												<input type="hidden" name="user_num" id="user_num"
													value="${e.USER_NUM }">
											</form>
										</a>
										<div class="text text-2 p-4">
											<div style="float: left; width: 90%; height: 40px;">
												<h3 class="mb-2">${e.NICKNAME}</h3>
											</div>
											<div style="float: right; width: 10%;">
												${e.F_SCORE }
											</div>
											<div class="meta-wrap">
												<p class="meta">
													<span>${e.BIRTH}</span>
												</p>
											</div>
											<p class="mb-4">${e.USER_INTRO}</p>
											<div style="position:absolute; width: 100%;" >
											<div style="clear:both;">											
											<p>
												<span style="float:left;">���ƿ�</span> 
											</p>
											<c:set var="hearton" value="false"/>
											<c:forEach var="g" items="${heart }">
												<c:choose>
													<c:when test="${g.liked_user == e.USER_NUM}">
														<c:set var="hearton" value="true"/>
													</c:when>													
												</c:choose>
											</c:forEach>
											 		
											<c:choose>
												<c:when test="${hearton == 'true'}">
													<img id="${e.USER_NUM}" class="img1" style="width: 20px; cursor:pointer; float: left;" src="images/hearton.png" />
												</c:when>
												<c:otherwise>
													<img id="${e.USER_NUM}" class="img1" style="width: 20px; cursor:pointer; float: left;" src="images/heartoff.png"/>												
												</c:otherwise>
											</c:choose>
											</div>
											<div style="float:left;" id="block">
												<span style="position:absolute; right:45px;">����</span>
												<img id="${e.USER_NUM}" class="img2" style="width: 40px; position:absolute;right:10px; bottom:0; cursor:pointer;" src="images/blockon.png" />
												<form action="block" method="post" id="send_num">
												<input type="hidden" name="user_num" id="user_num" value="${e.USER_NUM }">
												<input type="hidden" name="pm" id="pm" value="${pm}">
												<input type="hidden" name="sex" id="sex" value="${paging.sex}">
												<input type="hidden" name="nowPage" value="${paging.nowPage }">
												<input type="hidden" name="cntPerPage" value="${paging.cntPerPage}">
												</form>
											</div>
											</div>
										</div>
									</div>
								</div>
						</c:forEach>
						<!-- ����Ʈ �� -->
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
					<!-- Page �̵� -->
					<div class="row">
						<div class="col">
							<div class="block-27">
								<div style="display: block; text-align: center;">
									<!-- �������� -->
									<c:if test="${paging.prev }">
									<a href = "${pm }?nowPage=${paging.startPage - 1 }&sex=${paging.sex}">&lt;</a>
									</c:if>
									<!-- ���������� -->
									<c:if test="${paging.startPage != 1 }">
										<a
											href="${pm }?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&sex=${paging.sex}" >&nbsp;</a>
									</c:if>
									<!-- ���������� -->
									<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
										<c:choose>
											<c:when test="${p == paging.nowPage }">
												<b>${p }</b>
											</c:when>
											<c:when test="${p != paging.nowPage }">
												<a
													href="${pm }?nowPage=${p }&cntPerPage=${paging.cntPerPage}&sex=${paging.sex}">${p }</a>
											</c:when>
										</c:choose>
									</c:forEach>
									<!-- ���������� -->
									<c:if test="${paging.endPage != paging.lastPage}">
										<a
											href="${pm }?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&sex=${paging.sex}">&nbsp;</a>
									</c:if>
									<!-- �������� -->
									<c:if test="${paging.next && paging.endPage > 0 }">
									<a href = "${pm }?nowPage=${paging.endPage + 1 }&sex=${paging.sex}">&gt;</a>
									</c:if>
								</div>
							</div>
						</div>
					</div>
					<!-- Page �̵� end -->
				</div>
			</div>
		</div>
	</section>
	<script>
	</script>

<%@ include file="footer.jsp"%>