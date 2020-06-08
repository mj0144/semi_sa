<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
<head>
<title>SIGNIN V4</title>
<meta charset="UTF-8">
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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54 borderrr">
				<form class="login100-form validate-form" method="post"
					action="join">
					<span class="login100-form-title p-b-49"> Signin </span>

					<table>
						<tbody>

							<tr>
								<th>*아이디</th>
								<td><p>
										<input class="w3-input" placeholder="아이디" type="text"
											required="required" name="user_id" id="user_id">
									</p></td>
								<td><button type="button" class="btn btn-warning"
										id="idchk">중복확인</button></td>
							</tr>
							<tr>
								<th>*비밀번호</th>
								<td><p>
										<input class="w3-input" placeholder="비밀번호" type="password"
											required="required" name="pwd" id="pwd">
									</p></td>
							</tr>

							<tr>
								<br>
								<th>*비밀번호 확인</th>
								<td><p>
										<br> <input class="w3-input" placeholder="비밀번호확인"
											type="password" required="required" id="pwdchk"><label
											id="label" style="font-size: 10px; color: red;"></label>
									</p></td>
							</tr>

							<tr>
								<th>*이름</th>
								<td><p>
										<input class="w3-input" placeholder="이름" type="text"
											required="required" name="name" id="name">
									</p></td>
							</tr>

							<tr>
								<th>*별명</th>
								<td><p>
										<input class="w3-input" placeholder="별명" type="text"
											name="nickname" id="nickname">
									</p></td>
								<td><button type="button" class="btn btn-warning"
										id="nickchk">중복확인</button></td>
							</tr>


							<tr>
								<th>*성별</th>
								<td><p>
										<br><input class="w3-radio" type="radio" name="sex" value="m"
											checked> <label>남자</label> <input class="w3-radio"
											type="radio" name="sex" value="f"> <label>여자</label>
									</p></td>
							</tr>

							<tr>
								<th>*양/음력</th>
								<td><p>
										<br><input class="w3-radio" type="radio" name="calendar"
											value="solar" checked> <label>양력</label> <input
											class="w3-radio" type="radio" name="calendar" value=lunar>
										<label>음력</label>
									</p></td>
							</tr>



							<tr>
								<th><br>*생년월일</th>
							
							
								<td>&nbsp;<br><input name="fromDt" type="text" style="text-decoration: none; width:100px"
									id="fromDt" size="5"value=""></td>
							</tr>
							
							<tr><td><br></td></tr>
							<tr>
								<th>태어난시</th>
								<td><div class="row">
										<div class="col-4">
											<select name="info_hh" class="w3-select">
											<c:forEach begin="0" step="1" end="23" var="i" >
												<option value="${i }">${i }시</option>												
											</c:forEach>
												
											</select>
										</div>
										<div class="col-4">
										<select name="info_mm" class="w3-select">
											<c:forEach begin="0" step="1" end="59" var="i" >
												<option value="${i }">${i }분</option>												
											</c:forEach>
											
										</select>
										</div>
									</div></td>
							</tr>


						</tbody>
					</table>
					<br>
					<p style="text-align: right; color: red;">*는 필수항목입니다.</p>
					<br> <br>


					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" type="submit" id="send" disabled="disabled" onclick="alert()">
								JOIN</button>
							<button class="login100-form-btn" onclick="location='chat'"
								style="float: right;">Cancel</button>
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
	<!-- 	<link rel = "stylesheet" href = "ui/jquery.mobile-1.2.0.min.css" />
 -->

	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>


	<script>
		$(document)
				.ready(
						function() {

							var clareCalendar = {
								monthNamesShort : [ '1월', '2월', '3월', '4월',
										'5월', '6월', '7월', '8월', '9월', '10월',
										'11월', '12월' ],
								dayNamesMin : [ '일', '월', '화', '수', '목', '금',
										'토' ],
								weekHeader : 'Wk',
								dateFormat : 'yy-mm-dd', //형식(20120303)
								autoSize : false, //오토리사이즈(body등 상위태그의 설정에 따른다)
								changeMonth : true, //월변경가능
								changeYear : true, //년변경가능
								showMonthAfterYear : true, //년 뒤에 월 표시
								changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다
								changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
								//buttonImageOnly : true, //이미지표시
								/*  closeText: '닫기',  // 닫기 버튼 패널 */
								//buttonText : '달력선택', //버튼 텍스트 표시
 								buttonImage : 'images/calendar3.png', //이미지주소 
 								 //currentText: '오늘', // 오늘 텍스트 변경
 							showOn : "both", //엘리먼트와 이미지 동시 사용(both,button)
								yearRange : '1900:2020' //1990년부터 2020년까지
							};
						

							$("#fromDt").datepicker(clareCalendar);
							$("#toDt").datepicker(clareCalendar);
							 $("img.ui-datepicker-trigger")
									.attr("style",
											"margin-left:50px; vertical-align:right; cursor:pointer;"); //이미지버튼 style적용 
							$("#ui-datepicker-div").hide(); //자동으로 생성되는 div객체 숨김 
							$("#fromDt" ).datepicker( "getDate" );	//현재 선택되어 있는 날짜 가져오기 (Date 형으로 반환)

						});

	</script>

	<script>
		/*
		 처리해야할것.
		 1. 중복체크를 했는지
		 1-1 했으면 그게 통과했는지
		 2. 비밀번호와 비밀번호 확인이 맞는지.
		 3. 별명이 중복체크 했는지.
		 3-1 했으면 그게 통과했는지

		
		
		 */

		//비밀번호 확인
		$('#pwdchk').blur(function() {

			if ($('#pwd').val() != $('#pwdchk').val()) {
				if ($('#pwdchk').val() !== '') {
					alert("비밀번호가 다릅니다.");
					$('#pwdchk').empty();
					//$('#pwdchk').focus();
					$('#label').val();
					document.getElementById("label").innerHTML = "비밀번호가 다릅니다";

				}
			} else {
				if ($('#pwd').val() != '' && $('#pwdchk').val() != '') {
					document.getElementById("label").innerHTML = "비밀번호가 같습니다";
				}
			}
		})

		var pwdchk='true';
		$('#pwd').blur(function() {

			if ($('#pwd').val() != $('#pwdchk').val()) {
				if ($('#pwdchk').val() !== '') {
					alert("비밀번호가 다릅니다.");
					$('#pwdchk').empty();
					//$('#pwdchk').focus();
					$('#label').val();
					$('#send').attr('disabled', 'disabled');
					
					document.getElementById("label").innerHTML = "비밀번호가 다릅니다";
					

				}
			} else {
				if ($('#pwd').val() != '' && $('#pwdchk').val() != '') {
					$('#send').removeAttr('disabled');

					document.getElementById("label").innerHTML = "비밀번호가 같습니다";
					
				}
			}
		})

		
		var idchk='true';
		
		//아이디 체크.
		$('#idchk').on('click', function() {

			$.ajax({
				url : "idchk",
				type : "post",
				data : {
					id : $('#user_id').val()
				},
				success : function(data) {
					console.log(data);

					if (data === 1) {
						alert("사용불가능한 아이디입니다.");
						$('#send').attr('disabled', 'disabled');
					} else if (data === 0) {
						alert("사용가능한 아이디입니다.");
						$('#send').removeAttr('disabled');
					}
				},
				error : function() {
					console.log("ajax error");
				}
			})

		})

		var nickchk='true';
		////별명 체크
		$('#nickchk').on('click', function() {

			$.ajax({
				url : "nickchk",
				type : "post",
				data : {
					nickname : $('#nickname').val()
				},
				success : function(data) {
					console.log(data);

					if (data === 1) {
						alert("사용불가능한 별명입니다.");
						$('#send').attr('disabled', 'disabled');
					} else if (data === 0) {
						alert("사용가능한 별명입니다.");
						$('#send').removeAttr('disabled');
					}
				},
				error : function() {
					console.log("ajax error");
				}
			})

		})
		/*참고 : https://myjamong.tistory.com/17*/
		

		
		
		
       
		
	</script>



</body>
</html>