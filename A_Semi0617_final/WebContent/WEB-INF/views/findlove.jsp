<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="resources/css/viewsaju3.css">

<%@include file="header.jsp" %>
<%@include file="side.jsp" %>
		<div id="colorlib-main">
			<section class="ftco-section ftco-bread">
				<div class="container">
					<div class="row no-gutters slider-text justify-content-center align-items-center">
	          <div class="col-md-8 ftco-animate">
	            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>이상형찾기</span></p>
	            <h1 class="bread">이상형찾기</h1>
	          </div>
	        </div>
				</div>
			</section>
			<br>
			<p style="color: orange; text-align: center;">*이상형 인 연예인의 이름을 적어주세요*</p>
			<div class="col-sm-12 pull-center well" style="margin-left: 400px;">
					<form class="form-inline" action="feedsearch" method="post">
							
							<div class="input-group custom-search-form">
							
								<input type="text" name="keyword" class="form-control" placeholder="Search..." 
								style="width: 400px; border-radius: 10px 10px 10px 10px; border:0.5px solid;">
								&nbsp;&nbsp;&nbsp;
								<span class="input-group-btn">
									<button class="btn btn-default" id="searchbtn" type="submit" style="height: 52px; width: 75px;
									border-radius: 10px 10px 10px 10px; background-color: black; color:white; border: 0.5px solid;">
										search
									</button>
								</span>
							</div>
					</form>
				</div>
				<hr>
			<br>
			<section class="ftco-section contact-section">
		 <div class="container">
	      <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-4">
                    <div class="single-team">
                        <div class="team-photo">
                            <a href="resultsaju"><img src="resources/img/default.png" alt=""></a>
                        </div>
                        <h6>이름</h6>
                        <h4>홍길동</h4>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                    <div class="single-team">
                        <div class="team-photo">
                            <a href="resultsajutwo"><img src="resources/img/default.png" alt=""></a>
                        </div>
                        <h6>이름</h6>
                        <h4>홍길동</h4>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-4">
                    <div class="single-team">
                        <div class="team-photo">
                            <a href="resultsajuthree"><img src="resources/img/default.png" alt=""></a>
                        </div>
                        <h6>이름</h6>
                        <h4>홍길동</h4>
                    </div>
                </div>
            </div>
            </div>
	    </section>
	    <section>
	    	<div>
	    		<br>
	    		<br>
	    		<br>
	    		<br>
	    		<br>
	    	</div>
	    </section>
<%@ include file="footer.jsp" %>