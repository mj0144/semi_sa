<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
		
	
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

 <!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="resources/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<!--===============================================================================================-->
	<script src="js/jq.js"></script>
		<!---- for moving objects make this first always after boootstrap.css ----->
	
	<link rel="stylesheet" href="css/bootstrap.css">
<!-- 		<Bootstrap.min link local project skeleton> -->
	
		<link rel="stylesheet" href="css/w3.css">
		<!--- This is the local w3css extended --->
		
		<link rel="stylesheet" href="css/animate.css">
		
		<link rel="stylesheet" href="css/style.css">
		<!---- my own link local for customizing ----->
	
		<script src="js/bootstrap.min.js"></script>
		<!---- Bootstrap js link local for well and modal + panels ----->
		
		<link rel="icon" href="images/a.png" type="images/water.png" />
		<!---- Icon link local ----->
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
		<!-------    font awesome online plug --------------->
 		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script src="resources/js/main.js"></script>
<%@ include file="header.jsp" %>
<%@ include file="side.jsp" %>

<script>
	$(document).ready(function(){
		$('#pwchk').click(function() {
		var pwdchk='true';
		var now_pwd = $('#now_pwd').val()
			$.ajax({
				url : "pwdchangechk",
				type : "POST",
				data : {
					"pwd" : now_pwd
				},
				success : function(data) {
					if($('#now_pwd').val() === ''){
						pwdchk = 'true';
						document.getElementById('pwlabel').innerHTML = "<span style='color:tomato'>��й�ȣ�� �Է����ּ���</span>";
					}
					else if (data === 0) {
						pwdchk='false';
						$('.new_pwd').attr('disabled', true);
						$('.new_pwd2').attr('disabled', true);
						document.getElementById('pwlabel').innerHTML = "<span style='color:red'>��й�ȣ�� ��ġ���� �ʽ��ϴ�.</span>";

					} else if (data === 1 && $('#now_pwd').val() !== '') {
						pwdchk='true';
						$('.new_pwd').attr('disabled', false);
						$('.new_pwd2').attr('disabled', false);
						document.getElementById('pwlabel').innerHTML = "<span style='color:blue'>��й�ȣ�� ��ġ�մϴ�.</span>";
					}
				},
				error : function() {
					console.log("ajax error");
				}
			})
		})
	});
	
	//���ο� ��й�ȣ ��ġ Ȯ��
	$(document).ready(function(){
		$('.new_pwd2 , .new_pwd').keyup(function(){
			var pwdchk='true';
			if($('.new_pwd').val() === $('.new_pwd2').val() && $('.new_pwd').val() !== '' && $('.new_pwd2').val() !== ''){
				pwdchk = 'true';
				document.getElementById('n_pwlabel').innerHTML = "<span style='color:blue'>��й�ȣ�� ��ġ�մϴ�.</span>";
			}
			else if ($('.new_pwd').val() !== $('.new_pwd2').val() && $('.new_pwd').val() !== '' && $('.new_pwd2').val() !== '') {
				pwdchk='false';
				document.getElementById('n_pwlabel').innerHTML = "<span style='color:red'>��й�ȣ�� ��ġ���� �ʽ��ϴ�.</span>";
			}
		})
	});

	//submit ����(true,false) ��ũ��Ʈ
		function chksubmit(){
			if($('.new_pwd').val() !== $('.new_pwd2').val()){
				$('.new_pwd').focus();
				$('.new_pwd').select();
				$('.new_pwd2').value='';
				document.getElementById('n_pwlabel').innerHTML = "<span style='color:red'>��й�ȣ�� �Է��ϼ���.</span>";
				return false;
			} 
			else if($('.new_pwd').val() === '' &&  $('.new_pwd2').val() === '') {
				document.getElementById('n_pwlabel').innerHTML = "<span style='color:red'>��й�ȣ�� �Է��ϼ���.</span>";
				return false;
			}
			else{
				return true;
			}	
		};

</script>

<div id="colorlib-main">
	<section class="ftco-section ftco-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-8 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index">Home</a></span> <span>������������</span>
					</p>
					<h1 class="bread">������������</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section-3">


	<!-- ������ڸ� -->

	
	
 
 
	<div class="limiter" style="background: white;">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54 borderrr">
				<form class="login100-form validate-form" action="gologin" method="post" name="pw_form" onsubmit="return chksubmit()">
					<span class="login100-form-title p-b-49">
						��й�ȣ ����
					</span>
					
					               
         			<div class="profile_base" style="width: 90px; margin: 0 auto;" >
            			<button class="profile_click" style="border: white; width: 90px; margin: 0 auto;">
               				<!-- <img class="profile_img" style="width: 90px; margin: 0 auto;"
                  			src="https://instagram.ffjr1-1.fna.fbcdn.net/v/t51.2885-19/44884218_345707102882519_2446069589734326272_n.jpg?_nc_ht=instagram.ffjr1-1.fna.fbcdn.net&amp;_nc_ohc=KvXnK7LFle0AX9uuG_Q&amp;oh=84cb80fc16e8c0818b3f26df725c3095&amp;oe=5EF4088F&amp;ig_cache_key=YW5vbnltb3VzX3Byb2ZpbGVfcGlj.2"> -->
            			</button>
         			</div>
         			<br>
					
					<table><tbody>
						
						<tr>
							<th>*���� ��й�ȣ</th>
							<td>
								<p>
									<input class="w3-input" placeholder="��й�ȣ" type="password" id="now_pwd" name="now_pwd" value="">
									<p id="pwlabel"></p>
								</p>
							</td>
							<td>
								<button type="button" class="btn btn-warning" id="pwchk">Ȯ��</button>
							</td>
						</tr>
						
						
						<tr>
							<th>*�� ��й�ȣ</th>
							<td>
								<p><input class="w3-input new_pwd" placeholder="��й�ȣ"  type="password" name="new_pwd" disabled></p>
							</td>
						</tr>
						
						<tr>
							<th>*��й�ȣ Ȯ��</th>
							<td>
								<p><input class="w3-input new_pwd2" placeholder="��й�ȣ Ȯ��"  type="password" name="pwd" disabled ></p>
									
								<p id="n_pwlabel"></p>
							</td>
						</tr>
						
					</tbody></table>
						<br>
						<p style="text-align:right;color: red;">*�� �ʼ��׸��Դϴ�.</p>
						<br><br>
					
					<div class="container-login100-form-btn" style="text-align: center;">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button id="change_btn" type="submit" class="button white">��й�ȣ ����</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="dropDownSelect1"></div>
		<!-- ������ڸ� -->

	</section>

	<%@ include file="footer.jsp" %>