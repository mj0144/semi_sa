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
	<script src="resources/js/main.js"></script>

<div id="colorlib-main">
	<section class="ftco-section ftco-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-8 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index">Home</a></span> <span>개인정보수정</span>
					</p>
					<h1 class="bread">개인정보수정</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section-3">


		<!-- 내용들어갈자리 -->
 
 
	<div class="limiter" style="background: white;">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54 borderrr">
				<form class="login100-form validate-form ">
					<span class="login100-form-title p-b-49">
						회원정보 수정
					</span>
					
					               
         			<div class="profile_base" style="width: 90px; margin: 0 auto;" >
            			<button class="profile_click" style="border: white; width: 90px; margin: 0 auto;">
               				<img class="profile_img" style="width: 90px; margin: 0 auto;"
                  			src="https://instagram.ffjr1-1.fna.fbcdn.net/v/t51.2885-19/44884218_345707102882519_2446069589734326272_n.jpg?_nc_ht=instagram.ffjr1-1.fna.fbcdn.net&amp;_nc_ohc=KvXnK7LFle0AX9uuG_Q&amp;oh=84cb80fc16e8c0818b3f26df725c3095&amp;oe=5EF4088F&amp;ig_cache_key=YW5vbnltb3VzX3Byb2ZpbGVfcGlj.2">
            			</button>
         			</div>
         			<br>
					
					<table><tbody>
					
						<tr><th>*별명</th>
						<td><p>
						<input class="w3-input" placeholder="별명" type="text">
						</p></td><td><button type="button" class="btn btn-warning">중복확인</button></td></tr>
												
						<tr><th>*이름</th>
						<td><p><input class="w3-input" placeholder="이름" type="text"></p></td></tr>
						
						<tr><th>*성별</th>
						<td><p><input class="w3-radio" type="radio" name="gender" value="male" checked>
						<label>남자</label>
						<input class="w3-radio" type="radio" name="gender" value="female">
						<label>여자</label></p></td></tr>
						
						<tr><th>*양/음력</th>
						<td><p><input class="w3-radio" type="radio" name="calendar" value="solar" checked>
						<label>양력</label>
						<input class="w3-radio" type="radio" name="calendar" value=lunar>
						<label>음력</label></p></td></tr>
						
						
						
						<tr><th>*생년월일</th>
						<td><div class="row">
					  <div class="col-4">
						<select class="w3-select" name="option">
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
						<select class="w3-select" name="option">
								<option value="" disabled selected>월</option>
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
								<option value="" disabled selected>일</option>
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
						
						
						<tr><th>태어난시</th>
						<td><div class="row"><div class="col-4">
                                <select name="HH" class="w3-select">
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
                                </select></div>
                            <div class="col-4"> <select name="MI" class="w3-select">
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
                                                                    </select></div>
                            </div></td></tr>
						
						
						</tbody></table>
						<br>
						<p style="text-align:right;color: red;">*는 필수항목입니다.</p>
						<br><br>
						
					
					<div class="container-login100-form-btn" style="text-align: center;">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<a href="#" class="button white">수정</a>
						</div>
					</div>
					</form>
					<br>
					<div class="container-login100-form-btn" style="text-align: center;">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<a href="pwdChange" class="button white">비밀번호 변경</a>
						</div>
					</div>


			</div>
		</div>
	</div>

	<div id="dropDownSelect1"></div>
		<!-- 내용들어갈자리 -->

	</section>
