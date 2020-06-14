<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
<head>
<title>SIGNIN V4</title>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1 shrink-to-fit=no">
<link href="css/jquery-ui.css" type="text/css" rel="stylesheet">


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
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="resources/css/util.css">
<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<!--===============================================================================================-->
<!---- for moving objects make this first always after boootstrap.css ----->

<!---- Bootstrap.min link local project skeleton ----->


<link rel="stylesheet" href="css/animate.css">


<script src="js/bootstrap.min.js"></script>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

</head>
<style>


textarea{
 width:380px; 
  height:500px;      
  resize:none;/*크기 고정*/
   
</style>

<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54 borderrr">
			
			
			
	
					
					<span class="login100-form-title p-b-49"> Profile </span>
					<div class="profile_base" style="width: 90px; margin: 0 auto;">
						<button class="profile_click"
							style="border: white; width: 90px; margin: 0 auto;">

							<img class="profile_img" style="width: 90px; margin: 0 auto;"
								id="profileimg" src="resources/img/iu1.jpg">
						</button>
					</div>
					<br>
					
					<form class="login100-form validate-form" method="post"
					enctype="multipart/form-data" action="joinprofile" id="form">
						
						
						
						<input type="hidden" name="user_num" value="${user_num}"/>
					
			
					<div class="text-center">
						<input type="file" id="file" name="file" style="display:none">
						<div class="btn btn-outline-dark" onclick="onclick=document.all.file.click()">사진추가</div>
						</div>
						<br>
						<table>
							<tbody>

								<tr>
									<td>
										<div class="form-group">
						                    <label for="message">자기소개</label><br>
						                    <textarea name="user_intro" id="user_intro" cols="40" rows="15" class="form-control">자기소개를 입력해주세요</textarea>
						                  </div>
														
									</td>
									
								</tr>
							</tbody>
						</table>
						 <br>
						<!-- <p style="text-align: right; color: red;">*는 필수항목입니다.</p> -->
						<br> <br>


						<div class="container-login100-form-btn"
							style="text-align: center;">
							<div class="wrap-login100-form-btn" style="text-align: center;">
								<div class="login100-form-bgbtn" style="text-align: center;"></div>
								<button class="login100-form-btn" style="text-align: center;"
									type="submit">등록</button>
								<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
								<button class="login100-form-btn" onclick="location='login'"
									style="text-align: center;">Cancel</button>
							</div>
						</div>

					</form>
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


<script>
		$("#file").change(function() {
			if (this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					$("#profileimg").attr("src", data.target.result).width(70);
				}
				reader.readAsDataURL(this.files[0]);
			}
		});
		//https://kuzuro.blogspot.com/2018/10/11.html
	</script>



</body>
</html>