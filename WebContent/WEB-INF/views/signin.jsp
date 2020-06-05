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
								<th>*���̵�</th>
								<td><p>
										<input class="w3-input" placeholder="���̵�" type="text"
											required="required" name="user_id" id="user_id">
									</p></td>
								<td><button type="button" class="btn btn-warning"
										id="idchk">�ߺ�Ȯ��</button></td>
							</tr>
							<tr>
								<th>*��й�ȣ</th>
								<td><p>
										<input class="w3-input" placeholder="��й�ȣ" type="password"
											required="required" name="pwd" id="pwd">
									</p></td>
							</tr>

							<tr>
								<br>
								<th>*��й�ȣ Ȯ��</th>
								<td><p>
										<br> <input class="w3-input" placeholder="��й�ȣȮ��"
											type="password" required="required" id="pwdchk"><label
											id="label" style="font-size: 10px; color: red;"></label>
									</p></td>
							</tr>

							<tr>
								<th>*�̸�</th>
								<td><p>
										<input class="w3-input" placeholder="�̸�" type="text"
											required="required" name="name" id="name">
									</p></td>
							</tr>

							<tr>
								<th>*����</th>
								<td><p>
										<input class="w3-input" placeholder="����" type="text"
											name="nickname" id="nickname">
									</p></td>
								<td><button type="button" class="btn btn-warning"
										id="nickchk">�ߺ�Ȯ��</button></td>
							</tr>


							<tr>
								<th>*����</th>
								<td><p>
										<input class="w3-radio" type="radio" name="sex" value="m"
											checked> <label>����</label> <input class="w3-radio"
											type="radio" name="sex" value="f"> <label>����</label>
									</p></td>
							</tr>

							<tr>
								<th>*��/����</th>
								<td><p>
										<input class="w3-radio" type="radio" name="calendar"
											value="solar" checked> <label>���</label> <input
											class="w3-radio" type="radio" name="calendar" value=lunar>
										<label>����</label>
									</p></td>
							</tr>



							<tr>
								<th>*�������</th>
								<td><div class="row">
										<div class="col-4">
											<select class="w3-select" name="info_year"
												required="required">
												<option value="" disabled selected>�⵵</option>
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
												<option value="" disabled selected id="month">��</option>
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
												<option value="" disabled selected>��</option>

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
								<th>�¾��</th>
								<td><div class="row">
										<div class="col-4">
											<select name="info_hh" class="w3-select">
												<option value="00">0��</option>
												<option value="01">1��</option>
												<option value="02">2��</option>
												<option value="03">3��</option>
												<option value="04">4��</option>
												<option value="05">5��</option>
												<option value="06">6��</option>
												<option value="07">7��</option>
												<option value="08">8��</option>
												<option value="09">9��</option>
												<option value="10">10��</option>
												<option value="11">11��</option>
												<option value="12">12��</option>
												<option value="13">13��</option>
												<option value="14">14��</option>
												<option value="15">15��</option>
												<option value="16">16��</option>
												<option value="17">17��</option>
												<option value="18">18��</option>
												<option value="19">19��</option>
												<option value="20">20��</option>
												<option value="21">21��</option>
												<option value="22">22��</option>
												<option value="23">23��</option>
											</select>
										</div>
										<div class="col-4">
											<select name="info_mm" class="w3-select">
												<option value="00">0��</option>
												<option value="01">1��</option>
												<option value="02">2��</option>
												<option value="03">3��</option>
												<option value="04">4��</option>
												<option value="05">5��</option>
												<option value="06">6��</option>
												<option value="07">7��</option>
												<option value="08">8��</option>
												<option value="09">9��</option>
												<option value="10">10��</option>
												<option value="11">11��</option>
												<option value="12">12��</option>
												<option value="13">13��</option>
												<option value="14">14��</option>
												<option value="15">15��</option>
												<option value="16">16��</option>
												<option value="17">17��</option>
												<option value="18">18��</option>
												<option value="19">19��</option>
												<option value="20">20��</option>
												<option value="21">21��</option>
												<option value="22">22��</option>
												<option value="23">23��</option>
												<option value="24">24��</option>
												<option value="25">25��</option>
												<option value="26">26��</option>
												<option value="27">27��</option>
												<option value="28">28��</option>
												<option value="29">29��</option>
												<option value="30">30��</option>
												<option value="31">31��</option>
												<option value="32">32��</option>
												<option value="33">33��</option>
												<option value="34">34��</option>
												<option value="35">35��</option>
												<option value="36">36��</option>
												<option value="37">37��</option>
												<option value="38">38��</option>
												<option value="39">39��</option>
												<option value="40">40��</option>
												<option value="41">41��</option>
												<option value="42">42��</option>
												<option value="43">43��</option>
												<option value="44">44��</option>
												<option value="45">45��</option>
												<option value="46">46��</option>
												<option value="47">47��</option>
												<option value="48">48��</option>
												<option value="49">49��</option>
												<option value="50">50��</option>
												<option value="51">51��</option>
												<option value="52">52��</option>
												<option value="53">53��</option>
												<option value="54">54��</option>
												<option value="55">55��</option>
												<option value="56">56��</option>
												<option value="57">57��</option>
												<option value="58">58��</option>
												<option value="59">59��</option>
											</select>
										</div>
									</div></td>
							</tr>


						</tbody>
					</table>
					<br>
					<p style="text-align: right; color: red;">*�� �ʼ��׸��Դϴ�.</p>
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
								monthNamesShort : [ '1��', '2��', '3��', '4��',
										'5��', '6��', '7��', '8��', '9��', '10��',
										'11��', '12��' ],
								dayNamesMin : [ '��', '��', 'ȭ', '��', '��', '��',
										'��' ],
								weekHeader : 'Wk',
								dateFormat : 'yymmdd', //����(20120303)
								autoSize : false, //���丮������(body�� �����±��� ������ ������)
								changeMonth : true, //�����氡��
								changeYear : true, //�⺯�氡��
								showMonthAfterYear : true, //�� �ڿ� �� ǥ��
								buttonImageOnly : true, //�̹���ǥ��
								buttonText : '�޷¼���', //��ư �ؽ�Ʈ ǥ��
								buttonImage : 'images/cal.jpg', //�̹����ּ�
								showOn : "both", //������Ʈ�� �̹��� ���� ���(both,button)
								yearRange : '1990:2020' //1990����� 2020�����
							};
							$("#fromDt").datepicker(clareCalendar);
							$("#toDt").datepicker(clareCalendar);
							$("img.ui-datepicker-trigger")
									.attr("style",
											"margin-left:5px; vertical-align:middle; cursor:pointer;"); //�̹�����ư style����
							$("#ui-datepicker-div").hide(); //�ڵ����� �����Ǵ� div��ü ���� 
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
		 //* 10 12 -> 31�� // 4 6 9 11 -> 30��.
		 }  */
	</script>

	<script>
		/*
		 ó���ؾ��Ұ�.
		 1. �ߺ�üũ�� �ߴ���
		 1-1 ������ �װ� ����ߴ���
		 2. ��й�ȣ�� ��й�ȣ Ȯ���� �´���.
		 3. ������ �ߺ�üũ �ߴ���.
		 3-1 ������ �װ� ����ߴ���

		
		
		 */

		//��й�ȣ Ȯ��
		$('#pwdchk').blur(function() {

			if ($('#pwd').val() != $('#pwdchk').val()) {
				if ($('#pwdchk').val() !== '') {
					alert("��й�ȣ�� �ٸ��ϴ�.");
					$('#pwdchk').empty();
					//$('#pwdchk').focus();
					$('#label').val();
					document.getElementById("label").innerHTML = "��й�ȣ�� �ٸ��ϴ�";

				}
			} else {
				if ($('#pwd').val() != '' && $('#pwdchk').val() != '') {
					document.getElementById("label").innerHTML = "��й�ȣ�� �����ϴ�";
				}
			}
		})

		$('#pwd').blur(function() {

			if ($('#pwd').val() != $('#pwdchk').val()) {
				if ($('#pwdchk').val() !== '') {
					alert("��й�ȣ�� �ٸ��ϴ�.");
					$('#pwdchk').empty();
					//$('#pwdchk').focus();
					$('#label').val();
					document.getElementById("label").innerHTML = "��й�ȣ�� �ٸ��ϴ�";

				}
			} else {
				if ($('#pwd').val() != '' && $('#pwdchk').val() != '') {
					document.getElementById("label").innerHTML = "��й�ȣ�� �����ϴ�";
				}
			}
		})

		//���̵� üũ.
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
						alert("���Ұ����� ���̵��Դϴ�.");
					} else if (data === 0) {
						alert("��밡���� ���̵��Դϴ�.");
					}
				},
				error : function() {
					console.log("ajax error");
				}
			})

		})

		////���� üũ
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
						alert("���Ұ����� �����Դϴ�.");
					} else if (data === 0) {
						alert("��밡���� �����Դϴ�.");
					}
				},
				error : function() {
					console.log("ajax error");
				}
			})

		})
		/*���� : https://myjamong.tistory.com/17*/
	</script>



</body>
</html>