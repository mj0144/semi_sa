<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
<head>
<title>회원탈퇴</title>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1 shrink-to-fit=no">
<link href="css/jquery-ui.css" type="text/css" rel="stylesheet">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
	<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	

<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="resources/images/icons/favicon.ico" />
<!--===============================================================================================-->
<!-- <link rel="stylesheet" type="text/css"
	href="resources/vendor/bootstrap/css/bootstrap.min.css"> -->
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
<script src="js/jq.js"></script>
<!---- for moving objects make this first always after boootstrap.css ----->

<link rel="stylesheet" href="css/bootstrap.css">
<!---- Bootstrap.min link local project skeleton ----->

<link rel="stylesheet" href="css/w3.css">
<!--- This is the local w3css extended --->

<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/style.css">
<!---- my own link local for customizing ----->

<script src="js/bootstrap.min.js"></script>
<!---- Bootstrap js link local for well and modal + panels ----->

<link rel="icon" href="images/a.png" type="images/water.png" />
<!---- Icon link local ----->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<!-------    font awesome online plug --------------->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">

</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54 borderrr">
				<span class="login100-form-title p-b-49"> 회원탈퇴 </span> 				

				 <div class="profile_base" style="width: 90px; margin: 0 auto;">
					
						<img class="profile_base" style="width: 90px; margin: 0 auto;"
							id="profileimg" name="profileimg" src="resources/upload/${sessionScope.user_img }">
				 	
				</div> 
				<br>
				<form class="login100-form validate-form text-center" method="post"
					enctype="multipart/form-data" action="deleteconfirm" id="form">
						
					<table>
						<tbody>
							<tr>
								<th>ID</th>
								<td><p style="margin: 0;">
										<input class="w3-input" type="text"
											readonly="readonly" name="user_id" id="id"
											value=${vo.user_id }><label id="idlabel"></label>
									</p></td>
							</tr>
							<tr>
								<th>*PW</th>
								<td><p style="margin: 0;">
										<input class="w3-input" type="text"
											required="required" name="pwd" id="pwd" value=""
											><label id="pwdlabel"></label>
									</p></td>
							</tr>
							<br>
							<br>
							<tr>
								<th>*탈퇴사유</th>
								<td><p style="margin: 0;">
								<textarea rows="3" class="w3-input" required="required" name="reason" inputmode="text" id="reason"></textarea>
										<label id="reasonlabel"></label>
									</p></td>
							</tr>
						</tbody>
					</table>
					<br>
					<p style="text-align: right; color: red;">*는 필수항목입니다.</p>
					<br> <br>


					<div class="container-login100-form-btn text-center">
						<div class="wrap-login100-form-btn text-center">
							<div class="login100-form-bgbtn"></div>
							<button class="btn btn-outline-dark" type="button" id="userdel">
								회원탈퇴 확인</button>
							 &nbsp;
							<button class="btn btn-outline-danger" onclick="location.href='setting'">Cancel</button>
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


	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>



	
	<script>
		
	$('#userdel').on('click', function() {
		var pwd = ${vo.pwd }
		console.log("val() : " + $('#pwd').val());
		console.log("pwd : " + pwd)
		
		
 		if ($('#pwd').val() == pwd) {
			
 			$('#form').submit();
 			//$('#textarea').val();
 		} else{
 			document.getElementById("idlabel").innerHTML = "<p style='color:red'>비밀번호가 다릅니다.</p>";
 		}

	
	});
	
	
		
	</script>



</body>
</html>
