<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
<head>
	<title>SIGNIN V4</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1 shrink-to-fit=no">
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
		
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
		<!-------    font awesome online plug --------------->
 		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54 borderrr">
				<form class="login100-form validate-form ">
					<span class="login100-form-title p-b-49">
						Signin
					</span>
					
					<table><tbody>
					
					<tr><th>*���̵�</th>
						<td><p>
						<input class="w3-input" placeholder="���̵�" type="text">
						</p></td><td><button type="button" class="btn btn-warning">�ߺ�Ȯ��</button></td></tr>
						<tr><th>*��й�ȣ</th>
						<td><p><input class="w3-input" placeholder="��й�ȣ" type="password"></p></td></tr>
						
						<tr><th>*��й�ȣ Ȯ��</th>
						<td><p><input class="w3-input" placeholder="��й�ȣȮ��" type="password"></p></td></tr>
						
						<tr><th>*�̸�</th>
						<td><p><input class="w3-input" placeholder="�̸�" type="text"></p></td></tr>
						
						<tr><th>����</th>
						<td><p><input class="w3-input" placeholder="����" type="text"></p></td></tr>
						
						
						<tr><th>*����</th>
						<td><p><input class="w3-radio" type="radio" name="gender" value="male" checked>
						<label>����</label>
						<input class="w3-radio" type="radio" name="gender" value="female">
						<label>����</label></p></td></tr>
						
						<tr><th>*��/����</th>
						<td><p><input class="w3-radio" type="radio" name="calendar" value="solar" checked>
						<label>���</label>
						<input class="w3-radio" type="radio" name="calendar" value=lunar>
						<label>����</label></p></td></tr>
						
						
						
						<tr><th>*�������</th>
						<td><div class="row">
					  <div class="col-4">
						<select class="w3-select" name="option">
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
						<select class="w3-select" name="option">
								<option value="" disabled selected>��</option>
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
							<select class="w3-select" name="option">
								<option value="" disabled selected>��</option>
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
									<option value=24>24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
							</select> 
					  </div>
					</div></td></tr>
						
						
						<tr><th>�¾��</th>
						<td><div class="row"><div class="col-4">
                                <select name="HH" class="w3-select">
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
                                                                    </select></div>
                               <div class="col-4"> <select name="MI" class="w3-select">
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
                                                                    </select></div>
                            </div></td></tr>
						
						
						</tbody></table>
						<br>
						<p style="text-align:right;color: red;">*�� �ʼ��׸��Դϴ�.</p>
						<br><br>

					
					
				
					
					
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<input type="button" value="JOIN" style="float: left; background-color: white; cursor: pointer;"
								 onclick="location='login.jsp'">
							<input type="button" value="CANCLE" style="float: right; background-color: white; cursor: pointer;"
								 onclick="location='login.jsp'">
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

</body>
</html>