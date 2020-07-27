<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<%@include file="header.jsp" %>
<%@include file="side.jsp" %>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="resources/css/payment/pay_productList.css"></script>
<!------ Include the above in your HEAD tag ---------->

 
	 <div id="colorlib-main">
	 <section class="ftco-section ftco-bread">
				<div class="container">
					<div class="row no-gutters slider-text justify-content-center align-items-center">
	          <div class="col-md-8 ftco-animate">
	            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>결제상품</span></p>
	            <h1 class="bread">결제상품</h1>
	          </div>
	        </div>
				</div>
			</section>
	 
      <div class="container cta-100 ">
        <div class="container">
          <div class="row blog">
            <div class="col-md-12">
              <div id="blogCarousel" class="carousel slide container-blog" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#blogCarousel" data-slide-to="0" class="active"></li>
                  <li data-target="#blogCarousel" data-slide-to="1"></li>
                </ol>
                <!-- Carousel items -->
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <div class="row">
                      <div class="col-md-4" >
                        <div class="item-box-blog">
                          <div class="item-box-blog-image">
                            <!--Date-->
                            <div class="item-box-blog-date bg-blue-ui white">  </div>
                            <!--Image-->
                            <figure> <img alt="" src="resources/img/payment/product1.png"> </figure>
                          </div>
                          <div class="item-box-blog-body">
                            <!--Heading-->
                            <div class="item-box-blog-heading">
                              <a href="pay_productcart?product_num=1" tabindex="0">
                                <h5>인연보기 5회권</h5>
                              </a>
                            </div>
                            <!--Data-->
                            <div class="item-box-blog-data" style="padding: px 15px;">
                              <p><strong>설명 준비중입니다</strong></p>
                            </div>
                            <!--Text-->
                            <div class="item-box-blog-text">
								<p>가격  : 1,000</p>
                            </div>
                            <div class="mt"> <a href="pay_productcart?product_num=1" tabindex="0" class="btn bg-blue-ui white read">구매하기</a> </div>
                            <br><br><br><br><br><br><br><br><br>
                            
                            <!--Read More Button-->
                          </div>
                        </div>
                      </div>
                      <div class="col-md-4" >
                        <div class="item-box-blog">
                          <div class="item-box-blog-image">
                            <!--Date-->
                            <div class="item-box-blog-date bg-blue-ui white"> </div>
                            <!--Image-->
                            <figure> <img alt="" src="resources/img/payment/product2.png"> </figure>
                          </div>
                          <div class="item-box-blog-body">
                            <!--Heading-->
                            <div class="item-box-blog-heading">
                              <a href="pay_productcart?product_num=2" tabindex="0">
                                <h5>채팅 3회권</h5>
                              </a>
                            </div>
                            <!--Data-->
                            <div class="item-box-blog-data" style="padding: px 15px;">
                              <p><i class="fa fa-user-o"></i><i class="fa fa-comments-o"></i><strong>설명 준비중입니다</strong> </p>
                            </div>
                            <!--Text-->
                            <div class="item-box-blog-text">
								<p>가격  : 2,000</p>
                            </div>
                            <div class="mt"> <a href="pay_productcart?product_num=2" tabindex="0" class="btn bg-blue-ui white read">구매하기</a> </div>
                            <!--Read More Button-->
                          </div>
                        </div>
                      </div>
                      <div class="col-md-4" >
                        <div class="item-box-blog">
                          <div class="item-box-blog-image">
                            <!--Date-->
                            <div class="item-box-blog-date bg-blue-ui white">  </div>
                            <!--Image-->
                            <figure> <img alt="" src="resources/img/payment/product3.png"> </figure>
                          </div>
                          <div class="item-box-blog-body">
                            <!--Heading-->
                            <div class="item-box-blog-heading">
                              <a href="pay_productcart?product_num=3" tabindex="0">
                                <h5>패키지</h5>
                              </a>
                            </div>
                            <!--Data-->
                            <div class="item-box-blog-data" style="padding: px 15px;">
                              <p><strong>설명 준비중입니다</strong></p>
                            </div>
                            <!--Text-->
                            <div class="item-box-blog-text">
								<p> 가격  : 10,000</p>
                            </div>
                            <div class="mt"> <a href="pay_productcart?product_num=3" tabindex="0" class="btn bg-blue-ui white read">구매하기</a> </div>
                            <!--Read More Button-->
                          </div>
                        </div>
                      </div>
                    </div>
                    <!--.row-->
                  </div>
                  
                <!--.carousel-inner-->
              </div>
              <!--.Carousel-->
            </div>
          </div>
        </div>
     </div>
     </div>
 
     
   

<%@ include file="footer.jsp" %>