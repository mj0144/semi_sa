<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="resources/css/viewsaju3.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
<div id="colorlib-main">
	<section class="ftco-section"
		style="background-image: url(resources/img/headerimg.png); height: 5em">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-12 ftco-animate text-center">
					<h1 class="bread" style="color: white;">
						<b>연예인 닮은 꼴 찾기</b>
					</h1>
				</div>
			</div>
		</div>
	</section>
	 
	<div class="col-md-6 pull-center well" style="margin-left: 300px; margin-top: 100px;">
	<div style="margin-bottom: 100px; margin-left: 100px;">
	<h2><br><b>이상형 인 연예인의 이름을
		적어주세요</b></h2>
		<form id="love" class="form-inline" action="lovesearch" method="post">

			<div class="input-group custom-search-form">

				<input type="text" name="looklike" class="form-control" id="lookinsert"
					placeholder="Search..."
					style="width: 400px; border-radius: 10px 10px 10px 10px; border: 0.5px solid;">
				&nbsp;&nbsp;&nbsp; <span class="input-group-btn">
				
					<button class="btn btn-default" id="searchbtn" type="button"
						style="height: 52px; width: 75px; border-radius: 10px 10px 10px 10px; background-color: black; color: white; border: 0.5px solid;">
						search</button>
				</span>
			</div>
		</form>
	</div>
	<hr>
	<br>
	<div>
		<div style="height: 100px; text-align: center;">
			  <h2 style="text-align: center;"><br><b>나랑 닮은 연예인 보러가기</b></h2>
			<button class="btn btn-default" id="searchbtn" type="button" onclick="location.href='looklike'"
						style="height: 80px; width: 300px; border-radius: 10px 10px 10px 10px; background-color: black; color: white;">
						Go!</button>
		</div>
	</div>	
	<br>
	<br>
	<br>
	<br>

	<script>
	function submitContents() {

		var elClickedObj = $("#love");
		var ir1 = $("#lookinsert").val();
		
		console.log('content : ' + ir1)
		
		if ((ir1.indexOf(" ") != -1) || ir1 == "" || ir1 == " " || ir1 == '&nbsp;' || ir1 == '<p>&nbsp;</p>') {
			alert("이상형 연예인을 입력하세요.");
			return;
		}

		try {
			elClickedObj.submit();
		} catch (e) {
		}
	}

	$('#searchbtn').click(function() {
		submitContents();
	});
	

	</script>
	<%@ include file="footer.jsp"%>