<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

.settingspan {
	font-size: 15px;
}

.box {
	padding: 60px 0px;
}

.box-part {
	background: #FFF;
	border-radius: 0;
	padding: 60px 10px;
	margin: 30px 0px;
}

.text {
	margin: 20px 0px;
}

.fa {
	color: #4183D7;
}
</style>
<script>

</script>
<div id="colorlib-main">
	<section class="ftco-section ftco-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-8 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index">Home</a></span> <span>Setting</span>
					</p>
					<h1 class="bread">Setting</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- �������-->
	<div class="box">
		<div class="container">
			<div class="row">

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

					<div class="box-part text-center">

						<img src="images/person.png">
						

						<div class="title">
						<br>
							<h4>ȸ����������</h4>
						</div>

						<div class="text">
							<span class="settingspan">
								ȸ������ �⺻������ �����Ҽ��ֽ��ϴ�.</span>
						</div>

						<a href="userInfoChange">Learn More</a>

					</div>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

					<div class="box-part text-center">

						<img src="images/password.png">

						<div class="title">
							<br>
							<h4>��й�ȣ����</h4>
						</div>

						<div class="text">
							<span>ȸ������ ��й�ȣ�� �����Ҽ��ֽ��ϴ�.</span>
						</div>

						<a href="pwdChange">Learn More</a>

					</div>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

					<div class="box-part text-center">

						<img src="images/delete.png">

						<div class="title">
						<br>
							<h4>ȸ��Ż��</h4>
						</div>

						<div class="text">
							<span>ȸ������ ������ Ż���� �� �ֽ��ϴ�.</span>
						</div>

						<a href="deletepage">Learn More</a>

					</div>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

					<div class="box-part text-center">

						<img src="images/alarm.png">

						<div class="title">
						<br>
							<h4>�˸�����</h4>
						</div>

						<div class="text">
							<span>ȸ������ ���ƿ� �� ä�� �˸������ on, off �� �� �ֽ��ϴ�.</span>
						</div>

						<a href="#">Learn More</a>

					</div>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

					<div class="box-part text-center">

						<img src="images/spam.png">

						<div class="title">
						<br>
							<h4>���ܰ���</h4>
						</div>

						<div class="text">
							<span>ȸ���Բ��� �ٸ� ȸ���� �����ϰų� ���������� �� �� �ֽ��ϴ�.</span>
						</div>

						<a onclick="blocklist()" data-target="#modalall" data-toggle="modal" style="cursor: pointer;">Learn More</a>

					</div>
				</div>

				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

					<div class="box-part text-center">

						<img src="images/likeall.png">

						<div class="title">
						<br>
							<h4>��ƺ���</h4>
						</div>

						<div class="text">
							<span>ȸ���Բ��� �ȷο� �� ������ ȸ������ �ȷο����� ��ƺ��� �� �� �ֽ��ϴ�. </span>
						</div>

						<a href="#">Learn More</a>

					</div>
				</div>

			</div>
		</div>
	</div>
	
	<!-- Modal -->
	<div class="modal fade" id="modalall" tabindex="-1" role="dialog">
	  <div class="modal-dialog modal-dialog-scrollable modal-sm" role="document" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
	    <div class="modal-content">
	    </div>
	  </div>
	</div>

	<!--  ������� -->
	<%@ include file="footer.jsp"%>
	
	<script>
	function blocklist() {
		var url = 'blockmodal';
		
 		$('#modalall .modal-content').load(url);			
  		$('#modalall').modal('show');
	}
	</script>
	
	<script>
		$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();   
		});
	</script>