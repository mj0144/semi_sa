<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="resources/css/viewsaju3.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="header.jsp" %>
<%@include file="side.jsp" %>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	    $(document).on('click', '#person', function(event) {
			$(this).children('#send_num').submit();
		});
</script>
		<div id="colorlib-main">
			<section class="ftco-section" style="background-image: url(resources/img/headerimg.png); height:5em">
		<div class="container">
			<div class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-12 ftco-animate text-center">
					<h1 class="bread" style="color:white;"><b>나의 천생연분은?</b></h1>
				</div>
			</div>
		</div>
	</section>
		 <div class="container">
	      <div class="row">
                <div class="col-md-6 text-center">
                <h3><strong>${name}님의 천생연분은!</strong></h3> 
                <div class="single-team">
	                <div class="team-photo">
							<div style="background-image: url('resources/img/iljusky/${minus.ilju_sky_num}.JPG'); width:480px; height:370px; background-size: contain;">
								<div style="float:left;">
									
										<img src="resources/img/ilju_animal/${ilju.result_img}.png" alt="iljuanimal" style="margin-top: 80px; width:180px; margin-left: 10%">
									
								</div>
								<div style="float:left;" >
									 <div style="margin-top: 80px; width:220px; margin-left: 20px"><h5>나와 잘맞는 인연은</h5> <br>
									 <h4> ${ilju.result_keyword}</h4> <br>
									 <h5>${ilju.result_animal} </h5>  </div> 
								</div>
							</div>
					  </div>
				 </div>		
				 
				  <div class="single-team">
				 
						<div class="explain">
							<h3>${ilju.result_animal} 입니다</h3>
							<p class="card-text">${ilju.result_animal}은(는) ${ilju.ilju}일주 입니다.</p>
							<p class="card-text">${ilju.result_basic}</p>
			
							<h5>유명인 중 나와 잘맞는 일주동물을 가진 사람</h5><p class="card-text"> ${ilju.result_influ}</p>
							<ul class="ftco-social mt-3" style="text-align: center;">
				              <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
				              <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
				            </ul>
						</div>
		                
		         
 				</div>	
 			</div>
 			
		 		<div class="col-md-4 col-md-offset-4 text-center">
		 			<h3><strong><a href="listSome?code=1">${ilju.result_animal} 유저리스트</a></strong></h3> 
		 			 <div class="single-team">
	               		 <div class="team-photo">
		               		 <div class="explain">
								<h5>어떤 분이 당신의 운명일까요?</h5>
								<p class="card-text">대화를 걸어보세요</p>
							</div>
					 	 </div>
					 </div>		
				 
				 	 <div class="single-team">
							<div class="col-md-12">
								<div class="blog-entry ftco-animate d-md-flex">
									<br>
										<h5 class="mb-12">아직 당신의 인연이 가입하지 않았습니다.</h5>
										<br>
										
										<br>
									
								</div>
							</div>
						
			    		<a href="listSome?code=1">전체 유저 보러가기</a>
 					</div>	
 				</div>
        </div>
     </div>
	    </section>
	    

<%@ include file="footer.jsp" %>