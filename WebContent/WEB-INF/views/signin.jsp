<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
<head>
<title>SIGNIN V4</title>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1 shrink-to-fit=no">
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
										<input class="w3-radio" type="radio" name="sex" value="m"
											checked> <label>남자</label> <input class="w3-radio"
											type="radio" name="sex" value="f"> <label>여자</label>
									</p></td>
							</tr>

							<tr>
								<th>*양/음력</th>
								<td><p>
										<input class="w3-radio" type="radio" name="calendar"
											value="solar" checked> <label>양력</label> <input
											class="w3-radio" type="radio" name="calendar" value=lunar>
										<label>음력</label>
									</p></td>
							</tr>



							<tr>
								<th>*생년월일</th>
								<td><div class="row">
										<div class="col-4">
											<select class="w3-select" name="info_year"
												required="required">
												<option value="" disabled selected>년도</option>
												<option value="1990">1990</option>
												<option value="1991">1991</option>
												<option value="1992">1992</option>
												<option value="1993">1993</option>
												<option value="1994">1994</option>
												<option value="1995">1995</option>
												<option value="1996">1996</option>
												<option value="1997">1997</option>
												<option value="1998">1998</option>
												<option value="1999">1999</option>
												<option value="2000">2000</option>
												<option value="2001">2001</option>

											</select>
										</div>
										<div class="col-4">
											<select class="w3-select" name="info_mon" id="info_mon">
												<option value="" disabled selected id="month">월</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
											</select>
										</div>
										<div class="col-4">


											<tr>
												<td><input name="fromDt" type="text" id="fromDt"
													size="8" maxlength="8" value=""></td>
												
											</tr>

											<select class="w3-select" name="info_day" id="info_day"
												onclick="cal()">
												<option value="" disabled selected>일</option>

												<!-- <option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
												<option value="13">13</option>
												<option value="14">14</option>
												<option value="15">15</option>
												<option value="16">16</option>
												<option value="17">17</option>
												<option value="18">18</option>
												<option value="19">19</option>
												<option value="20">20</option>
												<option value="21">21</option>
												<option value="22">22</option>
												<option value="23">23</option>
												<option value="24">24</option>
												<option value="25">25</option>
												<option value="26">26</option>
												<option value="27">27</option>
												<option value="28">28</option>
												<option value="29">29</option>
												<option value="30">30</option>
											<option value="31" >31</option> -->
											</select>
										</div>
									</div></td>
							</tr>


							<tr>
								<th>태어난시</th>
								<td><div class="row">
										<div class="col-4">
											<select name="info_hh" class="w3-select">
												<option value="00">0시</option>
												<option value="01">1시</option>
												<option value="02">2시</option>
												<option value="03">3시</option>
												<option value="04">4시</option>
												<option value="05">5시</option>
												<option value="06">6시</option>
												<option value="07">7시</option>
												<option value="08">8시</option>
												<option value="09">9시</option>
												<option value="10">10시</option>
												<option value="11">11시</option>
												<option value="12">12시</option>
												<option value="13">13시</option>
												<option value="14">14시</option>
												<option value="15">15시</option>
												<option value="16">16시</option>
												<option value="17">17시</option>
												<option value="18">18시</option>
												<option value="19">19시</option>
												<option value="20">20시</option>
												<option value="21">21시</option>
												<option value="22">22시</option>
												<option value="23">23시</option>
											</select>
										</div>
										<div class="col-4">
											<select name="info_mm" class="w3-select">
												<option value="00">0분</option>
												<option value="01">1분</option>
												<option value="02">2분</option>
												<option value="03">3분</option>
												<option value="04">4분</option>
												<option value="05">5분</option>
												<option value="06">6분</option>
												<option value="07">7분</option>
												<option value="08">8분</option>
												<option value="09">9분</option>
												<option value="10">10분</option>
												<option value="11">11분</option>
												<option value="12">12분</option>
												<option value="13">13분</option>
												<option value="14">14분</option>
												<option value="15">15분</option>
												<option value="16">16분</option>
												<option value="17">17분</option>
												<option value="18">18분</option>
												<option value="19">19분</option>
												<option value="20">20분</option>
												<option value="21">21분</option>
												<option value="22">22분</option>
												<option value="23">23분</option>
												<option value="24">24분</option>
												<option value="25">25분</option>
												<option value="26">26분</option>
												<option value="27">27분</option>
												<option value="28">28분</option>
												<option value="29">29분</option>
												<option value="30">30분</option>
												<option value="31">31분</option>
												<option value="32">32분</option>
												<option value="33">33분</option>
												<option value="34">34분</option>
												<option value="35">35분</option>
												<option value="36">36분</option>
												<option value="37">37분</option>
												<option value="38">38분</option>
												<option value="39">39분</option>
												<option value="40">40분</option>
												<option value="41">41분</option>
												<option value="42">42분</option>
												<option value="43">43분</option>
												<option value="44">44분</option>
												<option value="45">45분</option>
												<option value="46">46분</option>
												<option value="47">47분</option>
												<option value="48">48분</option>
												<option value="49">49분</option>
												<option value="50">50분</option>
												<option value="51">51분</option>
												<option value="52">52분</option>
												<option value="53">53분</option>
												<option value="54">54분</option>
												<option value="55">55분</option>
												<option value="56">56분</option>
												<option value="57">57분</option>
												<option value="58">58분</option>
												<option value="59">59분</option>
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
							<button class="login100-form-btn" type="submit" id="submit">
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
	<link
		href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
		rel="stylesheet" type="text/css" />
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
								dateFormat : 'yymmdd', //형식(20120303)
								autoSize : false, //오토리사이즈(body등 상위태그의 설정에 따른다)
								changeMonth : true, //월변경가능
								changeYear : true, //년변경가능
								showMonthAfterYear : true, //년 뒤에 월 표시
								buttonImageOnly : true, //이미지표시
								buttonText : '달력선택', //버튼 텍스트 표시
								buttonImage : 'images/cal.jpg', //이미지주소
								showOn : "both", //엘리먼트와 이미지 동시 사용(both,button)
								yearRange : '1990:2020' //1990년부터 2020년까지
							};
							$("#fromDt").datepicker(clareCalendar);
							$("#toDt").datepicker(clareCalendar);
							$("img.ui-datepicker-trigger")
									.attr("style",
											"margin-left:5px; vertical-align:middle; cursor:pointer;"); //이미지버튼 style적용
							$("#ui-datepicker-div").hide(); //자동으로 생성되는 div객체 숨김 
						});

		/* 		function cal(){
		 console.log($('#info_day option:selected').val());
		 var day = $('#info_mon option:selected').val();
		 switch (day) {
		 case 1:
		 case 3:
		 case 5:
		 case 7:
		 case 8:
		 case 10:
		 case 12:
		 document.getElementById("demo").innerHTML
		 break;

		 case 4:
		 case 6:
		 case 9:
		 case 11:
		
		 break;
		 }	
		 // 1 3 5 7 8
		 //* 10 12 -> 31일 // 4 6 9 11 -> 30일.
		 }  */
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

		$('#pwd').blur(function() {

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
					} else if (data === 0) {
						alert("사용가능한 아이디입니다.");
					}
				},
				error : function() {
					console.log("ajax error");
				}
			})

		})

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
					} else if (data === 0) {
						alert("사용가능한 별명입니다.");
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