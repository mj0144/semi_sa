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
// 		var ilju_sky_num = '2';
// 		var ilju_land_num = '10';
		location='resultsajutwo';
	})
})
$(function() {
	$('#sajuthree').click(function() {
		location='resultsajuthree';
	})
})
  $(function(){
        /** btnDown 버튼 클릭 **/
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

<script>
	$(document).ready(function() {
		var result_img = ${ilju.result_img}
		$.ajax({
		    url : "http://192.168.0.172:8000/dpl/result1?result_img="+result_img+"&sex=m",
		    success : function(data){
		        data = data.replace(/&#x27;/gi, '"').replace(/&#x27;/gi, '"')
		        data = JSON.parse(data)
		        console.log(data);
		    	
		    	console.log(data[0].result1)
		    	console.log(data[0].result2)
		    	
		    	iljuBasic1 = $("#iljuResult1").text().split(" ")
				result1 = ''
				console.log(data[0].result1[Object.keys(data[0].result1)[0]])

				for (var i = 0; i < iljuBasic1.length; i++) {
					if (data[0].result1[Object.keys(data[0].result1)[i]] == 1) {
						result1 += '<a1>' + iljuBasic1[i] + '&nbsp;'+ '</a1>'
					}else {
						result1 += '<b1>' + iljuBasic1[i] + '&nbsp;'+ '</b1>'
					}
				}

				$("#iljuResult1").html(result1)
				
				iljuBasic2 = $("#iljuResult2").text().split(" ")
				result2 = ''
				console.log(data[0].result2[Object.keys(data[0].result2)[0]])

				for (var i = 0; i < iljuBasic2.length; i++) {
					if (data[0].result2[Object.keys(data[0].result2)[i]] == 1) {
						result2 += '<a1>' + iljuBasic2[i] + '&nbsp;'+ '</a1>'
					}else {
						result2 += '<b1>' + iljuBasic2[i] + '&nbsp;'+ '</b1>'
					}
				}

				$("#iljuResult2").html(result2)

		    },
		    error : function(){
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responsetext + "\n" + "error:" + error);
		    }
		 });		
	})
	

</script>

<style>
a1{color : blue;}


</style>


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
					<h1 class="bread" style="color:white;"><b>나의 사주동물은 뭘까?</b></h1>
				</div>
			</div>
		</div>
	</section>
			<section class="ftco-section contact-section">
		 <div class="container">
	      <div class="row">
                <div class="col-md-6 text-center">
                <h3><strong>${name}님의 사주동물은!</strong></h3> 
                

<!-- 출처: https://cofs.tistory.com/293 [CofS] -->
<!--                 	다운로드폼 -->
                <form name="imgForm" id="imgForm" action="sajudown" method="post">
      			  <input type="hidden" id="imgData" name="imgData">
    			</form>


<!-- 다운로드 영역 -->
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
									 <span class="small"><strong>나는</strong></span> <br>
									 <span><strong>${ilju.result_keyword}</strong></span> <br>
									 <span><strong>${ilju.result_animal}</strong> </span>  </div> 
								</div>
							</div>
					  </div>
				 </div>		
				  <div class="single-team">
				 
						<div class="explain">
							<h3>${ilju.result_animal} 입니다</h3>
							<p class="card-text">${ilju.result_animal}은(는) ${ilju.ilju}일주 입니다.</p>
							<p class="card-text" id="iljuResult1">${ilju.result_basic}</p>
							<p class="card-text" id="iljuResult2">${ilju.result_man}</p>
			
							<h5>유명인 중 나와 잘맞는 일주동물을 가진 사람</h5><p class="card-text"> ${ilju.result_influ}</p>
				</div>
							
							<a id="btnDown" class="btn btn-warning small w-auto">이미지 저장</a>
						</div>
		                
		         
 				</div>	
 			</div>
 			
		 		<div class="col-md-4 col-md-offset-4 text-center">
		 			<h3><strong><a href="listSome?code=1">다른 테스트</a></strong></h3> 
		 			 <div class="single-team">
	               		 <div class="team-photo">
		               		 <div class="explain">
								<h5>당신의 인연은 어디있을까요?</h5>
								<p class="card-text">인연 찾으러 가기</p>
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
			    		
			    		<a href="viewsaju">더 보러가기</a>
 					</div>	
 				</div>
        </div>
     </div>
	    </section>


					
		<!-- 내용들어갈자리 -->


	</section>
	
	<%@ include file="footer.jsp" %>