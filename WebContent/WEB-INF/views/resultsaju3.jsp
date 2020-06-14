<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="header.jsp" %>
<%@ include file="side.jsp" %>
<link href="resources/css/resultsaju.css" rel="stylesheet">
<div id="colorlib-main">
			<section class="ftco-section ftco-bread">
				<div class="container">
					<div class="row no-gutters slider-text justify-content-center align-items-center">
	          <div class="col-md-8 ftco-animate">
	            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>���ֺ���</span></p>
	            <h1 class="bread">���� �����ִ� �ο���?</h1>
	          </div>
	        </div>
				</div>
			</section>
			<section class="ftco-section contact-section">
		 <div class="container">
	      <div class="row">
                <div class="col-md-6 text-center">
                <h3><strong>ù��° ${name}���� ����!</strong></h3> 
                <div class="single-team">
	                <div class="team-photo">
							<div style="background-image: url('resources/img/iljusky/${plus.ilju_sky_num}.JPG'); width:480px; height:370px; background-size: contain;">
								<div style="float:left;">
									<img src="resources/img/ilju_animal/${plus.result_img}.png" alt="iljuanimal" style="margin-top: 80px; width:200px; margin-left: 40px">
						
									
								</div>
								<div style="float:left;" >
									 <div style="margin-top: 80px; width:220px; margin-left: 20px"><h5>���� �߸´� �ο���</h5> <br>
									 <h4> ${plus.result_keyword}</h4> <br>
									 <h5>${plus.result_animal} </h5>  </div> 
								</div>
							</div>
					  </div>
				 </div>		
				 
				  <div class="single-team">
				 
						<div class="explain">
							<h3>${plus.result_animal} �Դϴ�</h3>
							<p class="card-text">${plus.result_animal}��(��) ${plus.ilju}���� �Դϴ�.</p>
							<p class="card-text">${plus.result_basic}</p>
			
							<h5>������ �� ���� �߸´� ���ֵ����� ���� ���</h5><p class="card-text"> ${plus.result_influ}</p>
							<button type="button" class="btn btn-warning">�ǵ忡 �ø���</button>
							<button type="button" class="btn btn-warning" onclick="location.href='listSome?code='">���� �� �´� ��� ��������</button>
							<ul class="ftco-social mt-3" style="text-align: center;">
				              <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
				              <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
				            </ul>
						</div>
		                
		         
 				</div>	
 			</div>
 			
			<div class="col-md-6 text-center">
                <h3><strong>�ι�° ${name}���� ����!</strong></h3> 
                <div class="single-team">
	                <div class="team-photo">
							<div style="background-image: url('resources/img/iljusky/${minus.ilju_sky_num}.JPG'); width:480px; height:370px; background-size: contain;">
								<div style="float:left;">
									<img src="resources/img/ilju_animal/${minus.result_img}.png" alt="iljuanimal" style="margin-top: 80px; width:200px; margin-left: 40px">
						
									
								</div>
								<div style="float:left;" >
									 <div style="margin-top: 80px; width:220px; margin-left: 20px"><h5>���� �߸´� �ο���</h5> <br>
									 <h4> ${minus.result_keyword}</h4> <br>
									 <h5>${minus.result_animal} </h5>  </div> 
								</div>
							</div>
					  </div>
				 </div>		
				 
				  <div class="single-team">
				 
						<div class="explain">
							<h3>${minus.result_animal} �Դϴ�</h3>
							<p class="card-text">${minus.result_animal}��(��) ${minus.ilju}���� �Դϴ�.</p>
							<p class="card-text">${minus.result_basic}</p>
			
							<h5>������ �� ���� �߸´� ���ֵ����� ���� ���</h5><p class="card-text"> ${minus.result_influ}</p>
							<button type="button" class="btn btn-warning">�ǵ忡 �ø���</button>
							<button type="button" class="btn btn-warning" onclick="location.href='listSome?code='">���� �� �´� ��� ��������</button>
							<ul class="ftco-social mt-3" style="text-align: center;">
				              <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
				              <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
				            </ul>
						</div>
		                
		         
 				</div>	
 			</div>


					
<div class="col-md-4 col-md-offset-4 text-center">
		 			<h3><strong><a href="listSome?code=1">${plus.result_animal} ��������Ʈ</a></strong></h3> 
		 			 <div class="single-team">
	               		 <div class="team-photo">
		               		 <div class="explain">
								<h5>� ���� ����� ����ϱ��?</h5>
								<p class="card-text">��ȭ�� �ɾ����</p>
							</div>
					 	 </div>
					 </div>		
				 
				 	 <div class="single-team">
							<c:forEach var="e" items="${list1.mem }" begin="0" end="1">
			    			<div class="col-md-12">
			    				<div class="blog-entry ftco-animate d-md-flex">
										<a id="friend1" class="img img-2" style="background-image: url(images/image_1.jpg);"></a>
										<div class="text text-2 p-4">
				              <h3 class="mb-2">${e.nickname}</h3>
				              <div class="meta-wrap">
												<p class="meta">
				              	</p>
			              	</div>
				              <p class="mb-4"> ${e.user_intro} </p>
				              <br>

				            </div>
							</div>
			    			</div>
			    		</c:forEach>
 					</div>	
</div>
<div class="col-md-4 col-md-offset-4 text-center">
		 			<h3><strong><a href="listSome?code=1">${minus.result_animal} ��������Ʈ</a></strong></h3> 
		 			 <div class="single-team">
	               		 <div class="team-photo">
		               		 <div class="explain">
								<h5>� ���� ����� ����ϱ��?</h5>
								<p class="card-text">��ȭ�� �ɾ����</p>
							</div>
					 	 </div>
					 	 
					 </div>		
				 
				 	 <div class="single-team">
							<c:forEach var="e" items="${list2.mem }" begin="0" end="1">
			    			<div class="col-md-12">
			    				<div class="blog-entry ftco-animate d-md-flex">
										<a id="friend1" class="img img-2" style="background-image: url(images/image_1.jpg);"></a>
										<div class="text text-2 p-4">
				              <h3 class="mb-2">${e.nickname}</h3>
				              <div class="meta-wrap">
												<p class="meta">
				              	</p>
			              	</div>
				              <p class="mb-4"> ${e.user_intro} </p>
				              <br>

				            </div>
							</div>
			    			</div>
			    		</c:forEach>
			    		<a href="listSome?code=1">�� ��������</a>
 					</div>	
 </div>


	</section>
	
	<%@ include file="footer.jsp" %>