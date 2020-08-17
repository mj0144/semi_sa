<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<link rel="stylesheet" href="resources/css/viewsaju3.css">

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
	<br>
	<p style="color: orange; text-align: center;">*이상형 인 연예인의 이름을
		적어주세요*</p>
	<div class="col-sm-12 pull-center well" style="margin-left: 400px;">
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
	<section>
		<div style="height: 500px;">
		
		</div>
	</section>	

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