<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="resources/css/viewsaju3.css">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<%@include file="header.jsp" %>
<%@include file="side.jsp" %>
		<div id="colorlib-main">
			<section class="ftco-section ftco-bread">
				<div class="container">
					<div class="row no-gutters slider-text justify-content-center align-items-center">
	          <div class="col-md-8 ftco-animate">
	            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>���ֺ���</span></p>
	            <h1 class="bread">���ֺ���</h1>
	          </div>
	        </div>
				</div>
			</section>
			<section class="ftco-section contact-section">
		 <div class="container">
	      <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-4">
                    <div class="single-team">
                        <div class="team-photo">
                            <img src="resources/img/sajutest3.jpg" alt="">
                        </div>
                        <h6>���ַ� ���� ����</h6>
                        <h4>���� � ���� �����ϱ�?</h4>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-8" style="text-align: center;">
                    <div class="single-team">
                        <div class="explain">
                        <h5>� �˻��ϱ��?</h5>
                        <h4>������ ������ �� �� �ִ� ����� ���� ���ڸ� ������� �˷��帳�ϴ�. �����̶�� ����. ������ � ����� ������ �� �� ������ Ȯ���غ�����.
                        </h4>
                        </div>
                    </div>
                     <br>
                     <button class="btn btn-warning" id="viewhelp">�������</button>
                </div>
            </div>
            </div>
	    </section>
	    	    <script>
$(function() {
	$('#viewhelp').click(function() {
// 		var ilju_sky_num = '2';
// 		var ilju_land_num = '10';
		location='resultsaju3';
	})
})
</script>
<%@ include file="footer.jsp" %>