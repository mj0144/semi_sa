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
						<span class="mr-2"><a href="index">Home</a></span> <span>�ο���õ</span>
					</p>
					<h1 class="bread">������ �ο� ��õ�ޱ�</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section">
					<!-- modal���� -->
					<div class="container">
							<div class="row d-flex">
									<div class="form-group">
												
												<button type="button" class="btn btn-primary"
													data-toggle="modal" data-target="#myModal">���� �ٲٱ�</button>
												<br>
												<div class="modal fade" id="myModal" tabindex="-1"
													role="dialog" aria-labelledby="myModalLabel">
													<div class="modal-dialog modal-lg" role="document">
														<div class="modal-content">
															<div class="modal-header">

																<h4 class="modal-title" id="myModalLabel">����� �̻�����?</h4>
															</div>
															<div class="modal-body">
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
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">�ݱ�</button>
															</div>
														</div>
													</div>
												</div>
											</div>
				
							<div class="col-md-11">
						<div class="row">
						
					
					
				</div>
			</div>
		</div>
	</section>
	<script>
	</script>

<%@ include file="footer.jsp"%>