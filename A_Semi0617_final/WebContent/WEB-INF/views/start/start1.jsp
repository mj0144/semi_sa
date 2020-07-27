<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
   <title>Login</title>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <!--===============================================================================================-->   
   <link rel="icon" type="image/png" href="resources/images/icons/favicon.ico"/>
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
<link rel="icon" href="images/person_1.png" type="images/water.png" />
   <link href="resources/css/util.css" rel="stylesheet">
   <link href="resources/css/main.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!--===============================================================================================-->
<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;800&family=Noto+Serif+KR:wght@200;900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Serif+KR:wght@200;900&display=swap" rel="stylesheet">
<!-- Date Picker -->
<link rel="stylesheet" href="css/w3.css">
<!--- This is the local w3css extended --->



<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

<link rel="stylesheet" href="css/jquery-ui.css">
<style>
.jumbotron {
  color: #FBEFFB;
  background-color: #F7F8E0;
}
 body {
    margin-top:30px;
}
.stepwizard-step p {
    margin-top: 0px;
    color:#666;
}
.stepwizard-row {
    display: table-row;
}
.stepwizard {
    display: table;
    width: 100%;
    position: relative;
}
.stepwizard-step button[disabled] {
    /*opacity: 1 !important;
    filter: alpha(opacity=100) !important;*/
}
.stepwizard .btn.disabled, .stepwizard .btn[disabled], .stepwizard fieldset[disabled] .btn {
    opacity:1 !important;
    color:#bbb;
}
.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content:" ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-index: 0;
}
.stepwizard-step {
    display: table-cell;
    text-align: center;
    position: relative;
}
.btn-circle {
    width: 30px;
    height: 30px;
    text-align: center;
    padding: 6px 0;
    font-size: 12px;
    line-height: 1.428571429;
    border-radius: 15px;
}
#mbtihover:hover{   <----   'menubar'안에 있는 div들에게 마우스를 올리면

background:#555; color:#ff00ff;  <----   배경색이 #555색상으로 변하고 글자색상이 #fff색상으로 변해요!

   }
   body {
    margin: 0;
    padding: 0;
	}

</style>

</head>


<body>
   <div style="background-image: url('resources/img/start/couple2.gif'); background-size: 100% 100%; overflow: hidden; margin_top:0%" >
   <div class="limiterw">
  
      <div class="container-login100">
      
         <div class="col-md-5 banner-sec wrap-login100" style="background-color: rgba( 255, 255, 255, 0.95 );">
         	<br><br><br>
           	<div class="wrapper">
			      <div class="slidelist">
			         <div class="container text-center">
			         	
					    <div class="stepwizard">
					        <div class="stepwizard-row setup-panel">
					            <div class="stepwizard-step col-xs-3"> 
					                <a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
					            </div>
					            <div class="stepwizard-step col-xs-3"> 
					                <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
					            </div>
					            <div class="stepwizard-step col-xs-3"> 
					                <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
					            </div>
					            <div class="stepwizard-step col-xs-3"> 
					                <a href="#step-4" type="button" class="btn btn-default btn-circle" disabled="disabled">4</a>
					            </div>
					             <div class="stepwizard-step col-xs-3"> 
					                <a href="#step-5" type="button" class="btn btn-default btn-circle" disabled="disabled">5</a>
					            </div>
					            <div class="stepwizard-step col-xs-3"> 
					                <a href="#step-6" type="button" class="btn btn-default btn-circle" disabled="disabled">6</a>
					            </div>
					        </div>
					    </div>
    
				    
				   <form class="login100-form validate-form" method="post"	action="join" id="info_form">
				        <div class="panel panel-primary setup-content text-center" id="step-1">
				        <div class="jumbotron well">
							<h1 class="login100-form-title p-b-49 text-center" style="color: black;">처음 방문하셨나요?</h1>
							<h4 class="text-center" style="color: black;">MBTI와 생일 등 간단한 정보를 입력하시면 <br>인연을 추천해드려요</h4>
						</div>
				            <div class="panel-heading">
				           		 <span class="login100-form-title p-b-30"> 태어난 날을 입력해보세요. </span>
				                 <label>태어난 시간을 모를 경우 00시 00분 체크</label>
				            </div>
				            <div class="panel-body text-center">
				                <table style="margin : auto; text-align: center;">
					                <tbody>
						                <tr>
										<th><br>생년월일</th>
											<c:set var="birth" value="${vo.getBirth()}"/>
										<td>&nbsp;<br>
										<input name="birth" type="text"
											style="text-decoration: none; width: 100px" id=form_dt
											size="5" value=""></td>
									</tr>
									<tr>
										<td><br></td>
									</tr>
										<tr>
										<th>태어난 시간 </th>
										<td><div class="row">
												<div class="col-4">
													<select name="info_hh" class="w3-select">
														<c:forEach begin="0" step="1" end="23" var="i">
															<option value="${i }">${i }시</option>
														</c:forEach>
		
													</select>
												</div>
												<div class="col-4">
													<select name="info_mm" class="w3-select">
														<c:forEach begin="0" step="1" end="59" var="i">
															<option value="${i }" style='width:20px;'>${i }분</option>
														</c:forEach>
		
													</select>
												</div>
											</div></td>
										</tr>
					                </tbody>
				                </table>
				                <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
				                <br><br><br>
				            </div>
				        </div>
				        
				        <div class="panel panel-primary setup-content" id="step-2">
				            <div class="panel-heading">
				            <span class="login100-form-title p-b-49"> MBTI를 입력해주세요 </span>
				                
				            </div>
				            <div class="panel-body">
				                <!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="textinput">MBTI 입력</label>  
								  <div class="col-md-2" style="float: none; margin: 0 auto;">
								  <input id="textinput" name="textinput" type="text" placeholder="예)ENTP" class="form-control input-md" required="required">
								  </div>
								</div>
				                <div class="form-group">
				                    <label class="control-label" id="mbtihover">MBTI를 모르십니까?</label>
				                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">MBTI 간단체크하기</button>
				                    <br>
				                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									  <div class="modal-dialog" role="document">
									    <div class="modal-content">
									      <div class="modal-header">
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									        <h4 class="modal-title" id="myModalLabel">MBTI 간단체크하기!</h4>
									      </div>
									      <div class="modal-body">
									         	<img src="resources/img/start/mbtiinfo.jpg" style="width:100%" >
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
									      </div>
									    </div>
									  </div></div>
				                </div>
				                <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
				                <br>
				            </div>
				        </div>
				        
				        <div class="panel panel-primary setup-content" id="step-3">
				            <div class="panel-heading">
				            	<span class="login100-form-title p-b-49">당신의 이상형은? </span>
				            </div>
				            <div class="panel-body">
				                <!-- Select Basic -->
								<div class="form-group" style="float: none; margin: 0 auto;">
								  <label class="col-md-4 control-label" for="selectbasic">체형</label>
									  <div class="col-md-2" style="float: none; margin: 0 auto;">
									    <select id="selectbasic" name="selectbasic" class="form-control">
									      <option value="1">마름</option>
									      <option value="2">보통</option>
									      <option value="3">통통</option>
									    </select>
									  </div>
									</div>
								
								<!-- Select Basic -->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="키">키</label>
								  <div class="col-md-2" style="float: none; margin: 0 auto;">
								    <select id="키" name="키" class="form-control">
								      <option value="140">140</option>
								      <option value="141">141</option>
								      <option value="142">142</option>
								      <option value="143">143</option>
								      <option value="144">144</option>
								      <option value="145">145</option>
								      <option value="146">146</option>
								      <option value="147">147</option>
								      <option value="148">148</option>
								      <option value="149">149</option>
								      <option value="150">150</option>
								      <option value="151">151</option>
								      <option value="152">152</option>
								      <option value="153">153</option>
								      <option value="154">154</option>
								      <option value="155">155</option>
								      <option value="156">156</option>
								      <option value="157">157</option>
								      <option value="158">158</option>
								      <option value="159">159</option>
								      <option value="160">160</option>
								      <option value="161">161</option>
								      <option value="162">162</option>
								      <option value="163">163</option>
								      <option value="164">164</option>
								      <option value="165">165</option>
								      <option value="166">166</option>
								      <option value="167">167</option>
								      <option value="168">168</option>
								      <option value="169">169</option>
								      <option value="170">170</option>
								      <option value="171">171</option>
								      <option value="172">172</option>
								      <option value="173">173</option>
								      <option value="174">174</option>
								      <option value="175">175</option>
								      <option value="176">176</option>
								      <option value="177">177</option>
								      <option value="178">178</option>
								      <option value="179">179</option>
								      <option value="180">180</option>
								      <option value="181">181</option>
								      <option value="182">182</option>
								      <option value="183">183</option>
								      <option value="184">184</option>
								      <option value="185">185</option>
								      <option value="186">186</option>
								      <option value="187">187</option>
								      <option value="188">188</option>
								      <option value="189">189</option>
								      <option value="190">190</option>
								      <option value="191">191</option>
								      <option value="192">192</option>
								      <option value="193">193</option>
								      <option value="194">194</option>
								      <option value="195">195</option>
								      <option value="196">196</option>
								      <option value="197">197</option>
								      <option value="198">198</option>
								      <option value="199">199</option>
								      <option value="200">200</option>
								    </select>
								  </div>
								</div>
								<!-- Select Basic -->
								<div class="form-group" style="float: none; margin: 0 auto;">
								  <label class="col-md-4 control-label" for="selectbasic">나이 차이는 몇 살 까지?</label>
									  <div class="col-md-2" style="float: none; margin: 0 auto;">
									    <select id="selectbasic" name="selectbasic" class="form-control">
									      <option value="0">0</option>
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
									      
									    </select>
									  </div>
									</div>
									
				                <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
				                <br>
				            </div>
				        </div>
				        
				        
				        <div class="panel panel-primary setup-content" id="step-4">
				            <div class="panel-heading">
				            	<span class="login100-form-title p-b-49">나의 정보 </span>
				            </div>
				            <div class="panel-body">
				                <!-- Select Basic -->
								<div class="form-group" style="float: none; margin: 0 auto;">
								  <label class="col-md-4 control-label" for="selectbasic">체형</label>
									  <div class="col-md-2" style="float: none; margin: 0 auto;">
									    <select id="selectbasic" name="selectbasic" class="form-control">
									      <option value="1">마름</option>
									      <option value="2">보통</option>
									      <option value="3">통통</option>
									    </select>
									  </div>
									</div>
								
								<!-- Select Basic -->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="키">키</label>
								  <div class="col-md-2" style="float: none; margin: 0 auto;">
								    <select id="키" name="키" class="form-control">
								      <option value="140">140</option>
								      <option value="141">141</option>
								      <option value="142">142</option>
								      <option value="143">143</option>
								      <option value="144">144</option>
								      <option value="145">145</option>
								      <option value="146">146</option>
								      <option value="147">147</option>
								      <option value="148">148</option>
								      <option value="149">149</option>
								      <option value="150">150</option>
								      <option value="151">151</option>
								      <option value="152">152</option>
								      <option value="153">153</option>
								      <option value="154">154</option>
								      <option value="155">155</option>
								      <option value="156">156</option>
								      <option value="157">157</option>
								      <option value="158">158</option>
								      <option value="159">159</option>
								      <option value="160">160</option>
								      <option value="161">161</option>
								      <option value="162">162</option>
								      <option value="163">163</option>
								      <option value="164">164</option>
								      <option value="165">165</option>
								      <option value="166">166</option>
								      <option value="167">167</option>
								      <option value="168">168</option>
								      <option value="169">169</option>
								      <option value="170">170</option>
								      <option value="171">171</option>
								      <option value="172">172</option>
								      <option value="173">173</option>
								      <option value="174">174</option>
								      <option value="175">175</option>
								      <option value="176">176</option>
								      <option value="177">177</option>
								      <option value="178">178</option>
								      <option value="179">179</option>
								      <option value="180">180</option>
								      <option value="181">181</option>
								      <option value="182">182</option>
								      <option value="183">183</option>
								      <option value="184">184</option>
								      <option value="185">185</option>
								      <option value="186">186</option>
								      <option value="187">187</option>
								      <option value="188">188</option>
								      <option value="189">189</option>
								      <option value="190">190</option>
								      <option value="191">191</option>
								      <option value="192">192</option>
								      <option value="193">193</option>
								      <option value="194">194</option>
								      <option value="195">195</option>
								      <option value="196">196</option>
								      <option value="197">197</option>
								      <option value="198">198</option>
								      <option value="199">199</option>
								      <option value="200">200</option>
								    </select>
								  </div>
								</div>
				                 <!-- Select Basic -->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="selectbasic">사는 지역</label>
								  <div class="col-md-3" style="float: none; margin: 0 auto;">
								    <select id="selectbasic" name="selectbasic" class="form-control">
								      <option value="1">서울특별시</option>
								      <option value="2">경기도</option>
								      <option value="3">강원도</option>
								      <option value="4">경상남도</option>
								      <option value="5">경상북도</option>
								      <option value="6">충청남도</option>
								      <option value="7">충청북도</option>
								      <option value="8">전라남도</option>
								      <option value="8">전라북도</option>
								      <option value="9">제주도</option>
								      <option value="10">기타</option>
								    </select>
								  </div>
								</div>

				               
				                <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
				                <br>
				            </div>
				        </div>
				        
				        
				       
				        
				        
				        <div class="panel panel-primary setup-content" id="step-5">
				            <div class="panel-heading">
				            	<span class="login100-form-title p-b-49">상세정보 </span>
				                 
				            </div>
				            <div class="panel-body ">
				                <table style="margin : auto; text-align: center;">
				                	<tbody>
				                		<tr>
											<th>아이디</th>
											<td><p>
													<input class="w3-input" placeholder="아이디" type="text"
														required="required" name="user_id" id="user_id"><label id="idlabel"></label>
												</p></td>
											<td><button type="button" class="btn btn-warning"
													id="idchk">중복확인</button></td>
										</tr>
										<tr>
											<th>비밀번호</th>
											<td><p>
													<input class="w3-input" placeholder="비밀번호" type="password"
														required="required" name="pwd" id="pwd">
												</p></td>
										</tr>
			
										<tr>
											<br>
											<th>비밀번호 확인</th>
											<td><p>
													<br> <input class="w3-input" placeholder="비밀번호확인"
														type="password" required="required" id="pwdchk"> <label id="pwdlabel"></label>
												</p></td>
										</tr>
			
										<tr>
											<th>이름</th>
											<td><p>
													<input class="w3-input" placeholder="이름" type="text"
														required="required" name="name" id="name">
												</p></td>
										</tr>
			
										<tr>
											<th>별명</th>
											<td><p>
													<input class="w3-input" placeholder="별명" type="text"
														name="nickname" id="nickname"><label id="nicknamelabel"></label>
												</p></td>
											<td><button type="button" class="btn btn-warning"
													id="nickchk">중복확인</button></td>
										</tr>
										<tr>
											<th>이메일</th>
											<td><p>
													<input class="w3-input" placeholder="이메일" type="email"
														name="email" id="email" onchange="rexEmail()" value=${vo.getEmail() }>											
														 <label id="emaillabel"></label>
														
												</p></td>
											<td><button type="button" class="btn btn-warning"
													id="emailchk">중복확인</button></td>
										</tr>
			
										<tr>
											<th>성별</th>
											<td><p>
													<br>
													<input class="w3-radio" type="radio" name="sex" value="m"
														checked> <label>남자</label> <input class="w3-radio"
														type="radio" name="sex" value="f"> <label>여자</label>
												</p></td>
										</tr>
				                	</tbody>
				                </table>
				                <button class="btn btn-primary nextBtn pull-right" type="button" id="spec_submit">Next</button>
				                <br>
				               </form>
				               
				            </div>
				        </div>
				        
				        <div class="panel panel-primary setup-content" id="step-6">
				            <div class="panel-heading">
				            	<span class="login100-form-title p-b-49">프로필 작성</span>
				            </div>
				            <div class="panel-body">
				              
								<div class="profile_base .img-rounded" style="width: 250px; margin: 0 auto;">
						
									<img class="profile_img .img-rounded" style="width: 250px; margin: 0 auto;margin : auto; text-align: center;" id="profileimg" src="resources/img/iu1.jpg">
					
								</div>
								<br>
					
					<form class="login100-form validate-form" method="post"	enctype="multipart/form-data" action="joinprofile" id="introduce">
						
						
						
								<input type="hidden" name="user_num" value=""/>
					
			
								<div class="text-center">
								<input type="file" id="file" name="file" style="display:none">
									<div class="btn btn-outline-dark" onclick="onclick=document.all.file.click()">사진추가</div>
								</div>
								<br>
								<table style="margin : auto; text-align: center;">
									<tbody>
		
										<tr>
											<td>
												<div class="form-group text-center" >
								                    <label for="message">자기소개</label><br>
								                    <textarea name="user_intro" id="user_intro" cols="40" rows="5" class="form-control" placeholder="자기소개를 입력해주세요"></textarea>
								                  </div>
																			
														</td>
														
													</tr>
												</tbody>
											</table>
									 <br>
									<!-- <p style="text-align: right; color: red;">*는 필수항목입니다.</p> -->
									<br> <br>
							                <div class="container-login100-form-btn text-center">
			              					    <div class="wrap-login100-form-btn">
			                   						  <div class="login100-form-bgbtn"></div>
			                   							  <button class="btn btn-outline-info" id="intro_submit">
			                     							   회원가입완료
			                     						</button>
			                 						 </div>
			             					  </div>
										</form>
					               <br>
				            </div>
				        </div>
				    
				</div>
			         
			  </div>
  		 </div>
           	
           
 		 </div>
 		 
         <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54 ml-4" style="background-color: rgba( 255, 255, 255, 0.95 );" >
            <form method="post" action="logindo" class="login100-form validate-form" id="logindo">
               <span class="login100-form-title p-b-49">
                  Login
               </span>

               <div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
                  <span class="label-input100">아이디</span>
                  <input class="input100" type="text" id="user_id" name="user_id" placeholder="Type your username">
                  <span class="focus-input100" data-symbol="&#xf206;"></span>
               </div>

               <div class="wrap-input100 validate-input" data-validate="Password is required">
                  <span class="label-input100">비밀번호</span>
                  <input class="input100" type="password" id="pwd" name="pwd" placeholder="Type your password">
                  <span class="focus-input100" data-symbol="&#xf190;"></span>
               </div>
               <br>
               <c:if test="${msg == 'failure' }">
                  <div style="color: red;">
             		     아이디 또는 비밀번호가 일치하지 않습니다.
                  </div>
               </c:if>
               <c:if test="${msg == 'logout' }">
                  <div style="color: red;">
                		  로그아웃되었습니다.
                  </div>
               </c:if>
               
                 <div class="container-login100-form-btn text-center">
                  <div class="wrap-login100-form-btn">
                     <div class="login100-form-bgbtn"></div>
                     <button id="login_submit" class="btn btn-outline-info" >
                     		   로그인
                     </button>
                  </div>
               </div>
               </form>
               <br>
              
               
               <div class="text-right p-t-8 p-b-31">
                  <a href="findidform">
                     Forgot ID?
                  </a>
               <br>   <a href="findpwdform">
                     Forgot password?
                  </a>
               </div>
               
             
               
<%-- 
               <div class="txt1 text-center p-t-54 p-b-20">
                  <span>
                     Or Sign Up Using
                  </span>
               </div>
               
                <div class="flex-c-m">
                  <a href="#" class="login100-social-item bg1">
                     <i class="fa fa-facebook"></i>
                  </a>

                  <a href="${naver_url}" class="login100-social-item bg2">
                     <i class="fa fa-kakaotalk"></i>
                  </a>

                  <a href="${google_url}" class="login100-social-item bg3">
                     <i class="fa fa-google"></i>
                  </a>
               </div>  --%>
            
         </div>
      </div>
   </div>
 </div>
   

   <div id="dropDownSelect1"></div>
   <script>
   $(document).ready(function () {

	    var navListItems = $('div.setup-panel div a'),
	        allWells = $('.setup-content'),
	        allNextBtn = $('.nextBtn');

	    allWells.hide();

	    navListItems.click(function (e) {
	        e.preventDefault();
	        var $target = $($(this).attr('href')),
	            $item = $(this);

	        if (!$item.hasClass('disabled')) {
	            navListItems.removeClass('btn-success').addClass('btn-default');
	            $item.addClass('btn-success');
	            allWells.hide();
	            $target.show();
	            $target.find('input:eq(0)').focus();
	        }
	    });

	    allNextBtn.click(function () {
	        var curStep = $(this).closest(".setup-content"),
	            curStepBtn = curStep.attr("id"),
	            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
	            curInputs = curStep.find("input[type='text'],input[type='url']"),
	            isValid = true;

	        $(".form-group").removeClass("has-error");
	        for (var i = 0; i < curInputs.length; i++) {
	            if (!curInputs[i].validity.valid) {
	                isValid = false;
	                $(curInputs[i]).closest(".form-group").addClass("has-error");
	            }
	        }

	        if (isValid) nextStepWizard.removeAttr('disabled').trigger('click');
	    });

	    $('div.setup-panel div a.btn-success').trigger('click');
	    //데이트피커
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
				
				showOn : "both", //엘리먼트와 이미지 동시 사용(both,button)
				yearRange : '1900:2020', //1990년부터 2020년까지
				showOn: "button", //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시     
			   	buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", //버튼 이미지 경로
				buttonImageOnly: true, //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
				buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트      
			};
		
		
			
			$("#form_dt").datepicker(clareCalendar);												
			$("#ui-datepicker-div").hide(); //자동으로 생성되는 div객체 숨김 
			$("#form_dt" ).datepicker( "getDate" );	//현재 선택되어 있는 날짜 가져오기 (Date 형으로 반환)
	});
	   $('#emailchk').on('click',function() {
			$.ajax({
						url : "emailchk",
						type : "post",
						data : {
							email : $('#email').val()
						},
						success : function(data) {//data==1 : 중복되는 값이 있음. data==0: 중복되는 값이 없음.
							console.log(data);
							if($('#email').val() === ''){ //빈칸일 때.
								emailchk = 'false';
								document.getElementById("emaillabel").innerHTML = "<p style='color:red'>이메일을 입력해주세요</p>";
								return;
							}
							else if (data === 1&& $('#email').val() !== email) {//중복되는 값이 있고, 원래 이메일과 값이 달라졌을 때.												
								emailchk = 'false';
								document.getElementById("emaillabel").innerHTML = "<p style='color:red'>사용불가능한 이메일입니다</p>";
								return;
								
							} else if ($('#email').val() === email) {//값이 중복이 되든 안되든, 원래 이메일과 값이 같을 때.												
								emailchk = 'true';
								document.getElementById("emaillabel").innerHTML = "<p style='color:blue'>사용가능한 이메일입니다.</p>";
								return;
							} else if (data === 0 && $('#email').val() !== email && rexemail==='true') { //중복되는 값이 없고, 원래 이메일값이랑 다르고, 정규식도 만족.
								emailchk = 'true';
								document.getElementById("emaillabel").innerHTML = "<p style='color:blue'>사용가능한 이메일입니다.</p>";
								return;
							} else if (data === 0 && $('#email').val() !== email && rexemail==='false') { //중복되는 값이 없고, 원래 이메일값이랑 다르지만 정규식이 아닐 때.
								emailchk = 'false';
								document.getElementById("emaillabel").innerHTML = "<p style='color:red'>이메일 형식을 맞춰주세요.</p>";
								return;
							} 

						},
						error : function() {
							console.log("ajax error");
						}
					})

		})

</script>
<script>
		
							
			

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
		$('#pwdchk').change(function() {

			if ($('#pwd').val() != $('#pwdchk').val()) {
				if ($('#pwdchk').val() !== '') {
					$('#pwdchk').empty();
					document.getElementById("pwdlabel").innerHTML = "<p style='color:red'>비밀번호가 다릅니다</p>";

				}
			} else {
				if ($('#pwd').val() != '' && $('#pwdchk').val() != '') {
					document.getElementById("pwdlabel").innerHTML ="<p style='color:blue'>비밀번호가 같습니다</p>";
				}
			}
		})

		
		$('#pwd').change(function() {

			if ($('#pwd').val() != $('#pwdchk').val()) {
				if ($('#pwdchk').val() !== '') {
					alert("비밀번호가 다릅니다.");
					$('#pwd').empty();
					
					document.getElementById("pwdlabel").innerHTML = "<p style='color:red'>비밀번호가 다릅니다</p>";
					

				}
			} else {
				if ($('#pwd').val() != '' && $('#pwdchk').val() != '') {

					document.getElementById("pwdlabel").innerHTML = "<p style='color:blue'>비밀번호가 같습니다</p>";
					
				}
			}
		})


		
		
		$('#user_id').change(function(){
			document.getElementById("idlabel").innerHTML = "";
			if($('#user_id').val() === ''){ //값이 달라졌는데 빈칸이면
				document.getElementById("idlabel").innerHTML = "<p style='color:red'>아이디를 입력해주세요.</p>";
				idchk = 'false';
			}
			idchk='false';	//아이디 부분의 값이 바뀌면 false로 변경.
		});
				
		$('#nickname').change(function(){
			document.getElementById("nicknamelabel").innerHTML = "";
			if($('#nickname').val() === ''){ //값이 달라졌는데 빈칸이면
				document.getElementById("nicknamelabel").innerHTML = "<p style='color:red'>별명을 입력해주세요.</p>";
				nickchk = 'false';
			}
			nickchk='false';	//아이디 부분의 값이 바뀌면 false로 변경.
		});
		$('#email').change(function(){
			document.getElementById("emaillabel").innerHTML = "";
			if($('#email').val() === ''){ //값이 달라졌는데 빈칸이면
				document.getElementById("emaillabel").innerHTML = "<p style='color:red'>이메일을 입력해주세요.</p>";
				emailchk = 'false';
			}
			emailchk='false';	//아이디 부분의 값이 바뀌면 false로 변경.
		});
		
		var idchk='false';
		var nickchk='false';
		var emailchk='false';
		var rexemail='false';


		//아이디 체크.
		$('#idchk').on('click', function() {

			$.ajax({
				url : "idchk",
				type : "post",
				data : {
					id : $('#user_id').val()
				},
				success : function(data) {
					if($('#user_id').val() === ''){//빈칸
						idchk = 'false';
						document.getElementById("idlabel").innerHTML = "<p style='color:red'>아이디를 입력해주세요</p>";
						return;

					}
					if (data === 1) {
						
						idchk='false';
						document.getElementById("idlabel").innerHTML = "<p style='color:red'>사용불가능한 아이디입니다</p>";

					} else if (data === 0 && $('user_id').val() !== '') {
						
						idchk='true';
						document.getElementById("idlabel").innerHTML = "<p style='color:blue'>사용가능한 아이디입니다.</p>";
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
					if($('#nickname').val() === ''){ //빈칸일 때.
						nickchk = 'false';
						document.getElementById("nicknamelabel").innerHTML = "<p style='color:red'>별명을 입력해주세요</p>";
						return;
					}
					else if (data === 1) {
						
						nickchk='false';
						document.getElementById("nicknamelabel").innerHTML = "<p style='color:red'>사용불가능한 별명입니다.</p>";

						//$('#send').attr('disabled', 'disabled');
					} else if (data === 0) {
						nickchk='true';
						document.getElementById("nicknamelabel").innerHTML = "<p style='color:blue'>사용가능한 별명입니다.</p>";
					}
				},
				error : function() {
					console.log("ajax error");
				}
			})

		})
		/*참고 : https://myjamong.tistory.com/17*/
		
		////이메일 체크
		$('#emailchk').on('click', function() {

			$.ajax({
				url : "emailchk",
				type : "post",
				data : {
					email : $('#email').val()
				},
				success : function(data) {
					console.log(data);
					if($('#email').val() === ''){ //빈칸일 때.
						emailchk = 'false';
						document.getElementById("emaillabel").innerHTML = "<p style='color:red'>이메일을 입력해주세요</p>";
						return;

					}
					if (data === 1) {	//중복된 값이 있을 때.
						emailchk='false';
						document.getElementById("emaillabel").innerHTML = "<p style='color:red'>사용불가능한 이메일입니다.</p>";
						return;

					} else if (data === 0 &&  rexemail==='true') {	//중복된 값이 없고, 정규식만족
						emailchk='true';
						document.getElementById("emaillabel").innerHTML = "<p style='color:blue'>사용가능한 이메일입니다.</p>";
						return;

					}else if (data === 0 && rexemail==='false') { //중복되는 값이 없지만, 정규식이 맞지 않을 때.
						emailchk = 'false';
						document.getElementById("emaillabel").innerHTML = "<p style='color:red'>이메일 형식을 맞춰주세요.</p>";
						return;

					} 

				},
				error : function() {
					console.log("ajax error");
				}
			})

		})
		
		function datechk(){
			
		}
		
		
		
		//step1~7 전송
		//전송할 때, 중복체크 여부 확인
		$('#spec_submit').on('click', function(){
			if(nickchk==='true' && idchk==='true' && rexemail==='true' && emailchk==='true' && $("#form_dt" ).datepicker( "getDate" )!==null){				
				$('#info_form').submit();
				alert('마지막 단계입니다.')
			}else if(idchk==='false'){
				alert("아이디 중복체크를 해주세요");
			}else if(nickchk==='false'){
				alert("별명 중복체크를 해주세요");
			}else if(emailchk==='false'){
				alert('이메일 중복체크를 해주세요');
			}else if(rexemail==='false'){
				alert('이메일 형식을 확인해주세요');
			}else if($("#form_dt" ).datepicker( "getDate" )===null){
				alert("날짜를 입력해주세요");
			}
		})
		//step7 전송
		$('#intro_submit').on('click', function(){
			alert('회원가입을 축하합니다. 로그인해주세요.')
			$('#introduce').submit();
		})
		
		
		//로그인
		$('#login_submit').on('click', function(){
			alert('로그인')
			$('#logindo').submit();
		})
		
		var rexemail='false';

		function rexEmail(){
			  var email = $("#email").val();
			
			  var rex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			  // 이메일 정규식
			
				if(rex.test(email)){
				  rexemail='true';
			    console.log("가능: " + rexemail);

			  }
			  else {
				  rexemail='false';
			   
			    console.log("오류: " + rexemail);
			  }
		}
		
		//파일
		$("#file").change(function() {
			if (this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					$("#profileimg").attr("src", data.target.result).width(250);
				}
				reader.readAsDataURL(this.files[0]);
			}
		});
		//https://kuzuro.blogspot.com/2018/10/11.html
	
		

		
	</script>







	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>


   
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