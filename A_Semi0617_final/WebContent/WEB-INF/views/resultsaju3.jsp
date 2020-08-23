<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp" %>
<%@ include file="side.jsp" %>

<link href="resources/css/resultsaju.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
		$(function() {
			$('#sajutwo').click(function() {
				location='resultsajutwo';
			})
		})
		$(function() {
			$('#sajuone').click(function() {
				location='resultsaju';
			})
		})


	    $(document).on('click', '#person', function(event) {
			$(this).children('#send_num').submit();
		});
</script>

<script>

	$(document).ready(function() {
		var result_img1 = '${plus.result_img}'
		var result_img2 = '${minus.result_img}'
		
		$.ajax({
		    url : "http://192.168.0.172:8000/dpl/result3?result_img1="+result_img1 +'&result_img2='+result_img2,
		    success : function(data){
		    	alert('성공')
		    	data = data.replace(/&#x27;/gi, '"').replace(/&#x27;/gi, '"')
		    	data = JSON.parse(data)
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
	<section class="ftco-section" style="background-image: url(resources/img/headerimg.png); height:5em">
		<div class="container">
			<div class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-12 ftco-animate text-center">
					<h1 class="bread" style="color:white;"><b>나의 귀인은?</b></h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section contact-section">
		 <div class="container">
	      <div class="row">
                <div class="col-md-6 text-center">
                <h3><strong>첫번째 ${name}님의 귀인!</strong></h3> 
                <div class="single-team">
	                <div class="team-photo" style="display: table; margin-left: auto; margin-right: auto; display: inline-block;">
							<div style="background-image: url('resources/img/iljusky/${plus.ilju_sky_num}.JPG'); width:480px; height:370px; background-size: contain;">
								<div style="float:left;">
									<img src="resources/img/ilju_animal/${plus.result_img}.png" alt="iljuanimal" style="margin-top: 80px; width:200px; margin-left: 40px">
									
								</div>
								<div style="float:left;" >
									 <div style="margin-top: 80px; width:220px; margin-left: 20px"><h5>나와 잘맞는 인연은</h5> <br>
									 <h4> ${plus.result_keyword}</h4> <br>
									 <h5>${plus.result_animal} </h5>  </div> 
								</div>
							</div>
					  </div>
				 </div>		
				 
				  <div class="single-team">
				 
						<div class="explain">
							<h3>${plus.result_animal} 입니다</h3>
							<p class="card-text">${plus.result_animal}은(는) ${plus.ilju}일주 입니다.</p>
							<p class="card-text" id="iljuResult1">${plus.result_basic}</p>
			
							<h5>유명인 중 나와 잘맞는 일주동물을 가진 사람</h5><p class="card-text"> ${plus.result_influ}</p>
							
						</div>
		                
		         
 				</div>	
 			</div>
 			
			<div class="col-md-6 text-center">
                <h3><strong>두번째 ${name}님의 귀인!</strong></h3> 
                <div class="single-team">
	                <div class="team-photo" style="display: table; margin-left: auto; margin-right: auto; display: inline-block;">
							<div style="background-image: url('resources/img/iljusky/${minus.ilju_sky_num}.JPG'); width:480px; height:370px; background-size: contain;">
								<div style="float:left;">
									<img src="resources/img/ilju_animal/${minus.result_img}.png" alt="iljuanimal" style="margin-top: 80px; width:200px; margin-left: 40px">
						
									
								</div>
								<div style="float:left;" >
									 <div style="margin-top: 80px; width:220px; margin-left: 20px"><h5>나와 잘맞는 인연은</h5> <br>
									 <h4> ${minus.result_keyword}</h4> <br>
									 <h5>${minus.result_animal} </h5>  </div> 
								</div>
							</div>
					  </div>
				 </div>		
				 
				  <div class="single-team">
				 
						<div class="explain">
							<h3>${minus.result_animal} 입니다</h3>
							<p class="card-text">${minus.result_animal}은(는) ${minus.ilju}일주 입니다.</p>
							<p class="card-text" id="iljuResult2">${minus.result_basic}</p>
			
							<h5>유명인 중 나와 잘맞는 일주동물을 가진 사람</h5><p class="card-text"> ${minus.result_influ}</p>
							
						</div>
		                
		         
 				</div>	
 			</div>


					
				<div class="col-md-4 col-md-offset-4 text-center">
		 			<h3><strong><a href="listSome?code=1">다른 테스트</a></strong></h3> 
		 			 <div class="single-team">
	               		 <div class="team-photo">
		               		 <div class="explain">
								<h5>나는 어떤 일주 동물일까?</h5>
								<p class="card-text">사주 동물 확인하러 가기</p>
							</div>
					 	 </div>
					 	 
					 </div>		
					 
				 
				 	 <div class="single-team">
							
			    			
			    				<div class="blog-entry ftco-animate d-md-flex" style="float: right;">
									<img id="sajuone" src="resources/img/sajutest1.jpg" alt="iljuanimal" style="margin-top: 10px; float: right;" class="col-md-12">
								</div>
								<div class="single-team">
						               		 <div class="team-photo" >
							               		 <div class="explain">
													<h5>나의 찰떡궁합은 누구일까?</h5>
													<p class="card-text">궁합맞는 천생연분 찾으러 가기</p>
												</div>
										 	 </div>
								 </div>	
								<div class="blog-entry ftco-animate d-md-flex" style="float: right;">
									<img id="sajutwo" src="resources/img/sajutest2.jpg" alt="iljuanimal" style="margin-top: 10px; float: right;" class="col-md-12">
								</div>
								
								
			    			
			    		
 					</div>	
 				</div>
				
  	</div>
</div>
	</section>
	
	<%@ include file="footer.jsp" %>