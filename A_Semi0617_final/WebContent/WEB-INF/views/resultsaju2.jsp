<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="resources/css/viewsaju3.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(function() {
		$('#sajuone').click(function() {
			location = 'resultsaju';
		})
	})
	$(function() {
		$('#sajuthree').click(function() {
			location = 'resultsajuthree';
		})
	})
	$(document).on('click', '#person', function(event) {
		$(this).children('#send_num').submit();
	});
</script>
<script>
	$(document).ready(function() {
		var result_img = '${ilju.result_img}'
		$.ajax({
			url : "http://192.168.0.9:8000/dpl/result2?result_img="+result_img,
			success : function(data) {
				data = data.replace(/&#x27;/gi, '"').replace(/&#x27;/gi, '"')
				data = JSON.parse(data)
				iljuBasic = $("#iljuResult").text().split(" ")
				result = ''
				console.log(data[0]['�����'])
				console.log(data[0][Object.keys(data[0])[0]])

				for (var i = 0; i < iljuBasic.length; i++) {
					if (data[0][Object.keys(data[0])[i]] == 1) {
						result += '<a1>' + iljuBasic[i] + '&nbsp;'+ '</a1>'
					}else {
						result += '<b1>' + iljuBasic[i] + '&nbsp;'+ '</b1>'
					}
				}

				$("#iljuResult").html(result)
			},
			error : function(request, error) {
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
	<section class="ftco-section"
		style="background-image: url(resources/img/headerimg.png); height: 5em">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-12 ftco-animate text-center">
					<h1 class="bread" style="color: white;">
						<b>���� �������� �ο���?</b>
					</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section contact-section">
		<div class="container">
			<div class="row">
				<div class="col-md-6 text-center">
					<h3>
						<strong>${name}���� õ��������!</strong>
					</h3>
					<div class="single-team">
						<div class="team-photo"
							style="display: table; margin-left: auto; margin-right: auto; display: inline-block;">
							<div
								style="background-image: url('resources/img/iljusky/${minus.ilju_sky_num}.JPG'); width:480px; height:370px; background-size: contain;">
								<div style="float: left;">

									<img src="resources/img/ilju_animal/${ilju.result_img}.png"
										alt="iljuanimal"
										style="margin-top: 80px; width: 180px; margin-left: 10%">

								</div>
								<div style="float: left;">
									<div style="margin-top: 80px; width: 220px; margin-left: 20px">
										<h5>���� �߸´� �ο���</h5>
										<br>
										<h4>${ilju.result_keyword}</h4>
										<br>
										<h5>${ilju.result_animal}</h5>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="single-team">
						<div class="explain">
							<h3>${ilju.result_animal}�Դϴ�</h3>
							<p class="card-text">${ilju.result_animal}��(��)${ilju.ilju}����
								�Դϴ�.</p>
							<p class="card-text" id="iljuResult">${ilju.result_basic}</p>

							<h5>������ �� ���� �߸´� ���ֵ����� ���� ���</h5>
							<p class="card-text">${ilju.result_influ}</p>

							<div id="result"></div>

						</div>


					</div>
				</div>

				<div class="col-md-4 col-md-offset-4 text-center">
					<h3>
						<strong><a href="listSome?code=1">�ٸ� �׽�Ʈ</a></strong>
					</h3>
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
								<img id="sajuone" src="resources/img/sajutest1.jpg"
									alt="iljuanimal" style="margin-top: 10px;" class="col-md-12">
							</div>
							<div class="blog-entry ftco-animate d-md-flex">
								<img id="sajuthree" src="resources/img/sajutest3.jpg"
									alt="iljuanimal" style="margin-top: 10px;" class="col-md-12">
							</div>
							<div>
								<p class="mb-2"></p>
								<div class="meta-wrap">
									<p class="meta"></p>
								</div>
								<p class="mb-4"></p>
								<br>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<%@ include file="footer.jsp"%>