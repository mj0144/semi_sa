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
										<br><input class="w3-radio" type="radio" name="sex" value="m"
											checked> <label>����</label> <input class="w3-radio"
											type="radio" name="sex" value="f"> <label>����</label>
									</p></td>
							</tr>

							<tr>
								<th>*��/����</th>
								<td><p>
										<br><input class="w3-radio" type="radio" name="calendar"
											value="solar" checked> <label>���</label> <input
											class="w3-radio" type="radio" name="calendar" value=lunar>
										<label>����</label>
									</p></td>
							</tr>



							<tr>
								<th><br>*�������</th>
							
							
								<td>&nbsp;<br><input name="fromDt" type="text" style="text-decoration: none; width:100px"
									id="fromDt" size="5"value=""></td>
							</tr>
							
							<tr><td><br></td></tr>
							<tr>
								<th>�¾��</th>
								<td><div class="row">
										<div class="col-4">
											<select name="info_hh" class="w3-select">
											<c:forEach begin="0" step="1" end="23" var="i" >
												<option value="${i }">${i }��</option>												
											</c:forEach>
												
											</select>
										</div>
										<div class="col-4">
										<select name="info_mm" class="w3-select">
											<c:forEach begin="0" step="1" end="59" var="i" >
												<option value="${i }">${i }��</option>												
											</c:forEach>
											
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
								monthNamesShort : [ '1��', '2��', '3��', '4��',
										'5��', '6��', '7��', '8��', '9��', '10��',
										'11��', '12��' ],
								dayNamesMin : [ '��', '��', 'ȭ', '��', '��', '��',
										'��' ],
								weekHeader : 'Wk',
								dateFormat : 'yy-mm-dd', //����(20120303)
								autoSize : false, //���丮������(body�� �����±��� ������ ������)
								changeMonth : true, //�����氡��
								changeYear : true, //�⺯�氡��
								showMonthAfterYear : true, //�� �ڿ� �� ǥ��
								changeMonth: true, // ���� �ٲܼ� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�
								changeYear: true, // ���� �ٲ� �� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
								//buttonImageOnly : true, //�̹���ǥ��
								/*  closeText: '�ݱ�',  // �ݱ� ��ư �г� */
								//buttonText : '�޷¼���', //��ư �ؽ�Ʈ ǥ��
 								buttonImage : 'images/calendar3.png', //�̹����ּ� 
 								 //currentText: '����', // ���� �ؽ�Ʈ ����
 							showOn : "both", //������Ʈ�� �̹��� ���� ���(both,button)
								yearRange : '1900:2020' //1990����� 2020�����
							};
						

							$("#fromDt").datepicker(clareCalendar);
							$("#toDt").datepicker(clareCalendar);
							 $("img.ui-datepicker-trigger")
									.attr("style",
											"margin-left:50px; vertical-align:right; cursor:pointer;"); //�̹�����ư style���� 
							$("#ui-datepicker-div").hide(); //�ڵ����� �����Ǵ� div��ü ���� 
							$("#fromDt" ).datepicker( "getDate" );	//���� ���õǾ� �ִ� ��¥ �������� (Date ������ ��ȯ)

						});

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

		var pwdchk='true';
		$('#pwd').blur(function() {

			if ($('#pwd').val() != $('#pwdchk').val()) {
				if ($('#pwdchk').val() !== '') {
					alert("��й�ȣ�� �ٸ��ϴ�.");
					$('#pwdchk').empty();
					//$('#pwdchk').focus();
					$('#label').val();
					$('#send').attr('disabled', 'disabled');
					
					document.getElementById("label").innerHTML = "��й�ȣ�� �ٸ��ϴ�";
					

				}
			} else {
				if ($('#pwd').val() != '' && $('#pwdchk').val() != '') {
					$('#send').removeAttr('disabled');

					document.getElementById("label").innerHTML = "��й�ȣ�� �����ϴ�";
					
				}
			}
		})

		
		var idchk='true';
		
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
						$('#send').attr('disabled', 'disabled');
					} else if (data === 0) {
						alert("��밡���� ���̵��Դϴ�.");
						$('#send').removeAttr('disabled');
					}
				},
				error : function() {
					console.log("ajax error");
				}
			})

		})

		var nickchk='true';
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
						$('#send').attr('disabled', 'disabled');
					} else if (data === 0) {
						alert("��밡���� �����Դϴ�.");
						$('#send').removeAttr('disabled');
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