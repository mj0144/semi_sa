<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="resources/css/viewsaju3.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
<%@include file="side.jsp" %>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!--   <script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
 --><script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

<link href="resources/css/resultsaju.css" rel="stylesheet">
<script>
	$(function() {
		$('#sajutwo').click(function() {
			location='resultsajutwo';
		})
	})
	$(function() {
		$('#sajuthree').click(function() {
			location='resultsajuthree';
		})
	})
	  $(function(){
	        /** btnDown ��ư Ŭ�� **/
	        $('#btnDown').click(function() {
	            html2canvas($('.printDiv'), {
	                onrendered: function(canvas) {
	                    if (typeof FlashCanvas != "undefined") {
	                        FlashCanvas.initElement(canvas);
	                    }
	                    var image = canvas.toDataURL("image/png"); 
	                    $("#imgData").val(image);
	                    $("#imgForm").submit();
	                    console.log('1');
	                }
	            });
	        });
	    });
</script>
<div id="colorlib-main">

<style>
.wrap{font-size: 16px;}
.wrap > .inner{font-size: 1.1875rem;}
.wrap > .inner > .small{font-size: 1rem;}
</style>
	<section class="ftco-section" style="background-image: url(resources/img/headerimg.png); height:5em">
		<div class="container">
			<div class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-12 ftco-animate text-center">
					<h1 class="bread" style="color:white;"><b>���� ���ֵ����� ����?</b></h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section contact-section">
		 <div class="container">
	      <div class="row">
                <div class="col-md-6 text-center">
                <h3><strong>${name}���� ���ֵ�����!</strong></h3> 
                

<!-- ��ó: https://cofs.tistory.com/293 [CofS] -->
<!--                 	�ٿ�ε��� -->
                <form name="imgForm" id="imgForm" action="sajudown" method="post">
      			  <input type="hidden" id="imgData" name="imgData">
    			</form>


<!-- �ٿ�ε� ���� -->
                <div class="printDiv">
                <div class="single-team">
	                <div class="team-photo" style="display: table; margin-left: auto; margin-right: auto; display: inline-block;">
							<div class="col-md-12 img-fluid center-block" style=" background-repeat: no-repeat; background-image: url('resources/img/iljusky/${ilju.ilju_sky_num}.JPG'); 
<!-- 							width:480px; height:370px; background-size: contain; -->
							">
								<div class="col-md-4"style="float:left;">
										<img class="img-fluid center-block" src="resources/img/ilju_animal/${ilju.result_img}.png" alt="iljuanimal" style="margin-top:85px; margin-left:20%">
								</div>
								<div class="col-md-6 img-fluid center-block wrap" style="float:left;" >
									 <div class="inner" style="margin-top:50%;  margin-left:5%">
									 <span class="small"><strong>����</strong></span> <br>
									 <span><strong>${ilju.result_keyword}</strong></span> <br>
									 <span><strong>${ilju.result_animal}</strong> </span>  </div> 
								</div>
							</div>
					  </div>
				 </div>		
				  <div class="single-team">
				 
						<div class="explain">
							<h3>${ilju.result_animal} �Դϴ�</h3>
							<p class="card-text">${ilju.result_animal}��(��) ${ilju.ilju}���� �Դϴ�.</p>
							<p class="card-text">${ilju.result_basic}</p>
			
							<h5>������ �� ���� �߸´� ���ֵ����� ���� ���</h5><p class="card-text"> ${ilju.result_influ}</p>
				</div>
							
							<a id="btnDown" class="btn btn-warning small w-auto">�̹��� ����</a>
							
						</div>
 				</div>	
 			</div>
 			
		 		<div class="col-md-4 col-md-offset-4 text-center">
		 			<h3><strong><a href="listSome?code=1">�ٸ� �׽�Ʈ</a></strong></h3> 
		 			 <div class="single-team">
	               		 <div class="team-photo">
		               		 <div class="explain">
								<h5>����� �ο��� ����������?</h5>
								<p class="card-text">�ο� ã���� ����</p>
							</div>
					 	 </div>
					 </div>		
				 
				 	 <div class="single-team">
							
			    			<div class="col-md-12">
			    				<div class="blog-entry ftco-animate d-md-flex">
									<img id="sajutwo" src="resources/img/sajutest2.jpg" alt="iljuanimal" style="margin-top: 10px;" class="col-md-12">
								</div>

								
								<div class="blog-entry ftco-animate d-md-flex">
									<img id="sajuthree" src="resources/img/sajutest3.jpg" alt="iljuanimal" style="margin-top: 10px;" class="col-md-12">
								</div>
								<div>
				              		<p class="mb-2"></p>
				           	 			<div class="meta-wrap">
											<p class="meta"></p>
			              				</div>
				            		<p class="mb-4"> </p>
				            		<br>
								</div>
								
			    			</div>
			    		
			    		<a href="viewsaju">�� ��������</a>
 					</div>	
 				</div>
        </div>
     </div>
	    </section>


					
		<!-- ������ڸ� -->


	</section>
	
	<%@ include file="footer.jsp" %>