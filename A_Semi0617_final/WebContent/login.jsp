<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Login V4</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="resources/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link href="resources/css/util.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">
<!--===============================================================================================-->
<!-- <script type="text/javascript">
window.onload = function(){
   location = "login";
}
</script> -->

</head>
<body>
	<div class="limiterw">
		<div class="container-login100">
			<div class="col-md-6 banner-sec">
				<div id="carouselExampleIndicators" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="carousel-item active">
							<img class="d-block img-fluid" src="images/start.jpg" alt="First slide">
							<div class="carousel-caption d-none d-md-block">
								<div class="banner-text">
									<h2></h2>
									<p></p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="images/start2.jpg" alt="First slide">
							<div class="carousel-caption d-none d-md-block">
								<div class="banner-text">
									<h2></h2>
									<p></p>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block img-fluid" src="images/start3.jpg" alt="First slide">
							<div class="carousel-caption d-none d-md-block">
								<div class="banner-text">
									<h2></h2>
									<p></p>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form method="post" action="logindo"
					class="login100-form validate-form">
					<span class="login100-form-title p-b-49"> Login </span>

					<div class="wrap-input100 validate-input m-b-23"
						data-validate="Username is reauired">
						<span class="label-input100">아이디</span> <input class="input100"
							type="text" id="user_id" name="user_id"
							placeholder="Type your username"> <span
							class="focus-input100" data-symbol="&#xf206;"></span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Password is required">
						<span class="label-input100">비밀번호</span> <input class="input100"
							type="password" id="pwd" name="pwd"
							placeholder="Type your password"> <span
							class="focus-input100" data-symbol="&#xf190;"></span>
					</div>
					<br>
					<c:if test="${msg == 'failure' }">
						<div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
					</c:if>
					<c:if test="${msg == 'logout' }">
						<div style="color: red;">로그아웃되었습니다.</div>
					</c:if>

					<div class="container-login100-form-btn text-center">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="submit" class="btn btn-outline-info">로그인
							</button>
						</div>
					</div>
				</form>
				<br>
				<div class="container-login100-form-btn text-center">
					<div class="wrap-login100-form-btn">
						<div class="login100-form-bgbtn"></div>
						<button class="btn btn-outline-info" onclick="location='signin'">
							회원가입</button>
					</div>
				</div>

				<div class="text-right p-t-8 p-b-31">
					<a href="findidform"> Forgot ID? </a> <br> <a
						href="findpwdform"> Forgot password? </a>
				</div>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>

	<!--===============================================================================================-->
	<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="resources/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="resources/js/main.js"></script>

</body>
</html>