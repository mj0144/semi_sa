<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
<%@include file="side.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
$(document).on('click', '#person', function(event){
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

<script>
<!--  체크박스 전체선택 및 전체해제 -->
$(document).on('click', '#box-3', function(event) {

    if($("#box-3").is(":checked")){
        $(".chk").prop("checked", true);
    }
    else{
        $(".chk").prop("checked", false);
    }
});

    
<!-- // 한개의 체크박스 선택 해제시 전체선택 체크박스도 해제 -->
$(document).on('click', '.chk', function(event) {
    if($("input[class='chk']:checked").length == 2){
        $("#box-3").prop("checked", true);
    }else{
        $("#box-3").prop("checked", false);
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
						<span class="mr-2"><a href="index">Home</a></span> <span>인연찾기</span>
					</p>
					<h1 class="bread">나의 귀인인 인연 찾기</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section">

	    	<div class="container">
	    		<div class="row d-flex">
		    		<div class="col-md-12" style="border: 1px solid #ccb78f; margin-bottom: 30px; padding: 30px;">
						<form action="listFriend?code=2" class="detailck" method="post">
						<div class="boxes" style="padding-bottom: 30px;">
						  <div style="float: left; margin-right: 100px;">성별 </div>
						  <input type="checkbox" id="box-1" class="chk" name="sex" value="m"<c:if test="${paging.sex =='m' ||paging.sex ==null }">checked</c:if>>
						  <label for="box-1">남자</label>
						  
						  <input type="checkbox" id="box-2" class="chk" name="sex" value="f" <c:if test="${paging.sex =='f'||paging.sex ==null}">checked</c:if>>
						  <label for="box-2">여자</label>
						   
						  <input type="checkbox" id="box-3" name="sex" value="a" <c:if test="${paging.sex ==null}">checked</c:if>>
						  <label for="box-3">전체</label>
						  
						</div>
						<div>
	<!-- 					여기는 키, 나이, 체형, 위치, 사주, MBTI 선택사항이 들어갈 예정 -->
						</div>
						<div>
						<input type="submit" value="실행" style="float: right;">
						</div>
						</form>
						<input type="hidden" value="${paging.sex} " name="sex" id="sex">
					</div>
	    			<div class="col-md-11">
	    				<div class="row">
	    				
	    				<c:forEach var="e" items="${list}">
			    			<c:forEach var="f" items="${e.mem }">
			    			<div class="col-md-6">
			    				<div class="blog-entry ftco-animate d-md-flex">
									<a id="person" class="img img-2" style="background-image: url(resources/upload/${f.user_img}); cursor: pointer;">
									<form action="friend" method="post" id="send_num">
									<input type="hidden" name="user_num" id="user_num" value="${f.user_num }">
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
				              <p class="mb-4"> ${f.user_intro} </p>
							  <div style="position:absolute; width: 100%;" >
							  <div style="clear:both;">											
								<p>
								<span style="float:left;">좋아요</span> 
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
													<img id="${f.user_num}" class="img1" style="width: 20px; cursor:pointer; float: left;" src="images/hearton.png" />
												</c:when>
												<c:otherwise>
													<img id="${f.user_num}" class="img1" style="width: 20px; cursor:pointer; float: left;" src="images/heartoff.png"/>												
												</c:otherwise>
											</c:choose>
				            </div>
				            <div style="float:left;" id="block">
								<span style="position:absolute; right:45px;">차단</span>
								<img id="${f.user_num}" class="img2" style="width: 40px; position:absolute;right:10px; bottom:0; cursor:pointer;" src="images/blockon.png" />
								<form action="block" method="post" id="send_num">
									<input type="hidden" name="user_num" id="user_num" value="${f.user_num }">
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
			    		</c:forEach>

			    		</div><!-- END-->
			    		<div class="row">
			          <div class="col">
			            <div class="block-27">
								<div style="display: block; text-align: center;">
									<c:if test="${paging.prev }">
									<a href = "${pm }?nowPage=${paging.startPage - 1 }&sex=${paging.sex}">&lt;</a>
									</c:if>
									<c:if test="${paging.startPage != 1 }">
										<a
											href="${pm }?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&sex=${paging.sex}">&nbsp;</a>
									</c:if>
									<c:forEach begin="${paging.startPage }"
										end="${paging.endPage }" var="p">
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
									<!-- 다음페이지 -->
									<c:if test="${paging.endPage != paging.lastPage}">
										<a
											href="${pm }?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&sex=${paging.sex}">&nbsp;</a>
									</c:if>
									<c:if test="${paging.next && paging.endPage > 0 }">
									<a href = "${pm }?nowPage=${paging.endPage + 1 }&sex=${paging.sex}">&gt;</a>
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
	    
<%@ include file="footer.jsp" %>