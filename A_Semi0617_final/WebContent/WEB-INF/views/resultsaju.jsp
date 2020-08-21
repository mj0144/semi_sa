<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/css/viewsaju3.css">

<%@include file="header.jsp" %>
<%@include file="side.jsp" %>
		<div id="colorlib-main">
			<section class="ftco-section" style="background-image: url(resources/img/headerimg.png); height:5em">
		<div class="container">
			<div class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-12 ftco-animate text-center">
					<h1 class="bread" style="color:white;"><b>���� ����</b></h1>
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
                            <img src="resources/img/sajutest1.jpg" alt="">
                        </div>
                        <h6>���ַ� ���� ����</h6>
                        <h4>���� � ���� �����ϱ�?</h4>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-8" style="text-align: center;">
                    <div class="single-team">
                        <div class="explain">
                        <h5>� �˻��ϱ��?</h5>
                        <h4><br> ���ָ� ������� <br>���� � <b>���� �������� �˷��帳�ϴ�.</b> <br><br>�˰��� ���� �м�����<br><b>���� � ������ ������</b> <br><br>������ �� ���� ���� ���� �������� <br>�˷������.
                        </h4><br>
                     <br><button class="btn btn-warning" id="viewilju">�������</button>
                        </div>
                    </div>
                    <br>
                </div>
            </div>
            </div>
            
	    </section>
	    
	    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	    
	    
<script>
$(function() {
	$('#viewilju').click(function() {
// 		var ilju_sky_num = '2';
// 		var ilju_land_num = '10';
		location='resultsaju1';
	})
})
</script>
<%@ include file="footer.jsp" %>