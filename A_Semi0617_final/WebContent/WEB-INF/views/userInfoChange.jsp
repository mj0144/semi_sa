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
				<span class="login100-form-title p-b-49"> ȸ������ ���� </span> 				

				 <div class="profile_base" style="width: 90px; margin: 0 auto;">
					
						<img class="profile_base" style="width: 90px; margin: 0 auto;"
							id="profileimg" name="profileimg" src="resources/upload/${sessionScope.user_img }">
				 	
				</div> 
				<br>
				<form class="login100-form validate-form text-center" method="post"
					enctype="multipart/form-data" action="infochange" id="form">
						
					<input type="file" id="file" name="file" style="display:none" accept=".jpg,.jpeg,.png,.gif,.PNG">
						<div id="file_upload" class="btn btn-outline-dark " onclick="document.getElementById('file').click()">�����߰�</div>					
					<br>




					<table>
						<tbody>
							<tr>
								<th>*�̸�</th>
								<td><p style="margin: 0;">
										<input class="w3-input" placeholder="�̸�" type="text"
											required="required" name="name" id="name" onchange="namechange()"
											value=${vo.getName() }><label id="namelabel"></label>
									</p></td>
							</tr>

							<tr>
								<th>*����</th>
								<td><p style="margin: 0;">
										<input class="w3-input" placeholder="����" type="text"
											name="nickname" id="nickname" value=${vo.getNickname() }
											onchange="nickchange()"> <p id="nicklabel"></p>
									</p></td>
								<td><button type="button" class="btn btn-outline-warning"
										id="nickchk">�ߺ�Ȯ��</button></td>
							</tr>
							
							<tr>
								<th>*�̸���</th>
								<td>
								<p style="margin: 0;">
										<input class="w3-input" placeholder="�̸���" type="email"
											name="email" id="email" value=${vo.getEmail() }
											onchange="emailchange()"> <label id="emaillabel"></label>

									</p></td>
								<td><button type="button" class="btn btn-outline-warning"
										id="emailchk">�ߺ�Ȯ��</button></td>
										
							</tr>


							<tr>
								<th>*����</th>
								<td><p>


										<c:choose>
											<c:when test="${vo.getSex() eq 'm'.charAt(0)}">
												<input class="w3-radio" type="radio" name="sex" value="m"
													checked>
												<label>����</label>
												<input class="w3-radio" type="radio" name="sex" value="f">
												<label>����</label>
											</c:when>
											<c:otherwise>
												<input class="w3-radio" type="radio" name="sex" value="m">
												<label>����</label>
												<input class="w3-radio" type="radio" name="sex" value="f"
													checked>
												<label>����</label>
											</c:otherwise>
										</c:choose>

									</p></td>
							</tr>



							<tr>
								<th>*��/����</th>
								<td><p>
										<br> <input class="w3-radio" type="radio" name="calendar"
											value="solar" checked> <label>���</label> <input
											class="w3-radio" type="radio" name="calendar" value=lunar>
										<label>����</label>
									</p></td>
							</tr>



							<tr>
								<th><br>*�������</th>

								<c:set var="date" value="${vo.getBirth() }"/>
								<td>&nbsp;<br> <input name="birth" type="text"
									style="text-decoration: none; width: 100px" id="form_dt"
									size="5" value=""></td>
							</tr>

							<tr>
								<td><br></td>
							</tr>
							<tr>
								<th>�¾��</th>
								<td><div class="row">
										<div class="col-4">
											<select name="birth_hh" class="w3-select">
												<c:forEach begin="0" step="1" end="23" var="i">
													<option value="${i }" selected="${vo.getBirth_hh()}">${i }��</option>
												</c:forEach>

											</select>
										</div>
										<div class="col-4" >
											<select name="birth_mm"  class="w3-select">
												<c:forEach begin="0" step="1" end="59" var="i">
													<option value="${i }" selected="${vo.getBirth_mm()}">${i}��</option>
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


					<div class="container-login100-form-btn text-center">
						<div class="wrap-login100-form-btn text-center">
							<div class="login100-form-bgbtn"></div>
							<button class="btn btn-outline-dark" type="button" id="userdel" onclick="location.href='deletepage'">
								ȸ��Ż��</button>
							<button class="btn btn-outline-dark" type="button" id="send">
								����</button> &nbsp;
							<button class="btn btn-outline-danger" onclick="location.href='mypage'">Cancel</button>
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
		$(document)
				.ready(
						function() {
							var date =new Date('${date} 0:0:0');
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
								changeMonth : true, // ���� �ٲܼ� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�
								changeYear : true, // ���� �ٲ� �� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.								
								showOn : "both", //������Ʈ�� �̹��� ���� ���(both,button)
								yearRange : '1900:2020', //1990����� 2020�����
								showOn: "button", //button:��ư�� ǥ���ϰ�,��ư�� �����߸� �޷� ǥ�� ^ both:��ư�� ǥ���ϰ�,��ư�� �����ų� input�� Ŭ���ϸ� �޷� ǥ��     
						    	buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", //��ư �̹��� ���
								buttonImageOnly: true, //�⺻ ��ư�� ȸ�� �κ��� ���ְ�, �̹����� ���̰� ��
								buttonText: "����" //��ư�� ���콺 ���� ���� �� ǥ�õǴ� �ؽ�Ʈ      

							};

							$("#form_dt").datepicker(clareCalendar);
							//$("#toDt").datepicker(clareCalendar);
							$("#form_dt").datepicker('setDate', date);

							$("#ui-datepicker-div").hide(); //�ڵ����� �����Ǵ� div��ü ���� 
							$("#form_dt").datepicker("getDate"); //���� ���õǾ� �ִ� ��¥ �������� (Date ������ ��ȯ)

						});
	</script>
	<script>
	//�̹��� �̸�����.
		$("#file").change(function() {
			console.log("files[0] : " + this.files[0]);
			console.log("files : " + this.files);
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
	<script>
		/*
		 ó���ؾ��Ұ�.
		 1. �ߺ�üũ�� �ߴ���
		 1-1 ������ �װ� ����ߴ���
		 2. ��й�ȣ�� ��й�ȣ Ȯ���� �´���.
		 3. ������ �ߺ�üũ �ߴ���.
		 3-1 ������ �װ� ����ߴ���		
		 */
		var nickchk = 'true';
		var idchk='true';
		var emailchk = 'true';
		var namechk = 'true';
		var nickname = $('#nickname').val(); //���� ���� ��.
		var email = $('#email').val(); //�̸��� ���� ��.
		var rexemail='true';


		//���� �޶����� ��, �ߺ�üũ�ϰ�. && ���� ������.
		//����
		function nickchange() {
			document.getElementById("nicklabel").innerHTML = "";

			if ($('#nickname').val() === nickname) {
				nickchk = 'true';
			} else if($('#nickname').val() !== nickname && $('#nickname').val() === ''){ //���� �޶����µ� ��ĭ�̸�
				document.getElementById("nicklabel").innerHTML = "<p style='color:red'>������ �Է����ּ���.</p>";
				nickchk = 'false';
			}

		}
		//�̸���
		function emailchange() {
			document.getElementById("emaillabel").innerHTML = "";

			if ($('#email').val() === email) {
				console.log("��");
				emailchk = 'true';
			} else if($('#email').val() !== email && $('#email').val() === ''){
				document.getElementById("emaillabel").innerHTML = "<p style='color:red'>�̸����� �Է����ּ���.</p>";
				emailchk = 'false';
			}
			rexEmail(); //���Խ� üũ.

		}
		//�̸�
		function namechange(){
			document.getElementById("namelabel").innerHTML = "";
			if($('#name').val() === ''){
				namechk='false';
				document.getElementById("namelabel").innerHTML = "<p style='color:red'>�̸��� �Է����ּ���.</p>";
			}
		}
		
		
		

		////���� üũ
		$('#nickchk').on('click',function() {
					$.ajax({
										url : "nickchk",
										type : "post",
										data : {
											nickname : $('#nickname').val()
										},
										success : function(data) {	//data==1 : �ߺ��Ǵ� ���� ����. data==0: �ߺ��Ǵ� ���� ����.
											console.log(data);
											 if($('#nickname').val() === ''){ //��ĭ�� ��.
												 nickchk = 'false';
												document.getElementById("nicklabel").innerHTML = "<p style='color:red'>������ �Է����ּ���</p>";
												return;
											} 
											 else if (data === 1 && $('#nickname').val() !== nickname) { //�ߺ��Ǵ� ���� �ְ�, ���� ����� ���� �޶����� ��.
												nickchk = 'false';
												document
														.getElementById("nicklabel").innerHTML = "<p style='color:red'>���Ұ����� �����Դϴ�.</p>";

											} else if ($('#nickname').val() === nickname) {//���� �ߺ��� �ǵ� �ȵǵ�, ���� ����� ���� ���� ��.
												nickchk = 'true';
												document
														.getElementById("nicklabel").innerHTML = "<p style='color:blue'>��밡���� �����Դϴ�.</p>";
											} else if (data === 0 && $('#nickname').val() !== nickname) { //�ߺ��Ǵ� ���� ����, ���� �����̶� �ٸ� ��.
												nickchk = 'true';
												document
														.getElementById("nicklabel").innerHTML = "<p style='color:blue'>��밡���� �����Դϴ�.</p>";
											}
										},
										error : function() {
											console.log("ajax error");
										}
									})

						})

		/*���� : https://myjamong.tistory.com/17*/

		//�̸��� �ߺ�üũ
		$('#emailchk').on('click',function() {
							$.ajax({
										url : "emailchk",
										type : "post",
										data : {
											email : $('#email').val()
										},
										success : function(data) {//data==1 : �ߺ��Ǵ� ���� ����. data==0: �ߺ��Ǵ� ���� ����.
											console.log(data);
											if($('#email').val() === ''){ //��ĭ�� ��.
												emailchk = 'false';
												document.getElementById("emaillabel").innerHTML = "<p style='color:red'>�̸����� �Է����ּ���</p>";
												return;
											}
											else if (data === 1&& $('#email').val() !== email) {//�ߺ��Ǵ� ���� �ְ�, ���� �̸��ϰ� ���� �޶����� ��.												
												emailchk = 'false';
												document.getElementById("emaillabel").innerHTML = "<p style='color:red'>���Ұ����� �̸����Դϴ�</p>";
												return;
												
											} else if ($('#email').val() === email) {//���� �ߺ��� �ǵ� �ȵǵ�, ���� �̸��ϰ� ���� ���� ��.												
												emailchk = 'true';
												document.getElementById("emaillabel").innerHTML = "<p style='color:blue'>��밡���� �̸����Դϴ�.</p>";
												return;
											} else if (data === 0 && $('#email').val() !== email && rexemail==='true') { //�ߺ��Ǵ� ���� ����, ���� �̸��ϰ��̶� �ٸ���, ���Խĵ� ����.
												emailchk = 'true';
												document.getElementById("emaillabel").innerHTML = "<p style='color:blue'>��밡���� �̸����Դϴ�.</p>";
												return;
											} else if (data === 0 && $('#email').val() !== email && rexemail==='false') { //�ߺ��Ǵ� ���� ����, ���� �̸��ϰ��̶� �ٸ����� ���Խ��� �ƴ� ��.
												emailchk = 'false';
												document.getElementById("emaillabel").innerHTML = "<p style='color:red'>�̸��� ������ �����ּ���.</p>";
												return;
											} 

										},
										error : function() {
											console.log("ajax error");
										}
									})

						})

		$('#send').on('click', function() {
			if (nickchk==='true' && idchk==='true' && rexemail==='true' && namechk==='true') {	//��� üũ�� �Ϸ�� submit;			
				$('#form').submit();
			} else if (emailchk === 'false') {
				alert("�̸��� �ߺ�üũ�� ���ּ���");
				return;
			} else if (nickchk === 'false') {
				alert("���� �ߺ�üũ�� ���ּ���");
				return;
				
			}else if(rexemail==='false'){
				alert('�̸��� ������ Ȯ�����ּ���');
				return;
				
			}else if(namechk==='false'){
				alert('�̸��� �Է����ּ���');
				return;
				
			}
			
		})
		
		
		
		//�̸��� ���Խ�.
		function rexEmail(){
			console.log("���Խ� ����")
		
			  var email = $("#email").val();
			
			  var rex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			  // �̸��� ���Խ�
			
			if(rex.test(email)){
				  rexemail='true';
				  
			  }else {
				rexemail='false';
				document.getElementById("emaillabel").innerHTML = "<p style='color:red'>�̸��� ������ �����ּ���.</p>";
					  
			 }
		}
	
		
		
	</script>



</body>
</html>
