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
<!-- ����Ʈ -->
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
#mbtihover:hover{   <----   'menubar'�ȿ� �ִ� div�鿡�� ���콺�� �ø���

background:#555; color:#ff00ff;  <----   ������ #555�������� ���ϰ� ���ڻ����� #fff�������� ���ؿ�!

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
							<h1 class="login100-form-title p-b-49 text-center" style="color: black;">ó�� �湮�ϼ̳���?</h1>
							<h4 class="text-center" style="color: black;">MBTI�� ���� �� ������ ������ �Է��Ͻø� <br>�ο��� ��õ�ص����</h4>
						</div>
				            <div class="panel-heading">
				           		 <span class="login100-form-title p-b-30"> �¾ ���� �Է��غ�����. </span>
				                 <label>�¾ �ð��� �� ��� 00�� 00�� üũ</label>
				            </div>
				            <div class="panel-body text-center">
				                <table style="margin : auto; text-align: center;">
					                <tbody>
						                <tr>
										<th><br>�������</th>
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
										<th>�¾ �ð� </th>
										<td><div class="row">
												<div class="col-4">
													<select name="info_hh" class="w3-select">
														<c:forEach begin="0" step="1" end="23" var="i">
															<option value="${i }">${i }��</option>
														</c:forEach>
		
													</select>
												</div>
												<div class="col-4">
													<select name="info_mm" class="w3-select">
														<c:forEach begin="0" step="1" end="59" var="i">
															<option value="${i }" style='width:20px;'>${i }��</option>
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
				            <span class="login100-form-title p-b-49"> MBTI�� �Է����ּ��� </span>
				                
				            </div>
				            <div class="panel-body">
				                <!-- Text input-->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="textinput">MBTI �Է�</label>  
								  <div class="col-md-2" style="float: none; margin: 0 auto;">
								  <input id="textinput" name="textinput" type="text" placeholder="��)ENTP" class="form-control input-md" required="required">
								  </div>
								</div>
				                <div class="form-group">
				                    <label class="control-label" id="mbtihover">MBTI�� �𸣽ʴϱ�?</label>
				                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">MBTI ����üũ�ϱ�</button>
				                    <br>
				                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									  <div class="modal-dialog" role="document">
									    <div class="modal-content">
									      <div class="modal-header">
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
									        <h4 class="modal-title" id="myModalLabel">MBTI ����üũ�ϱ�!</h4>
									      </div>
									      <div class="modal-body">
									         	<img src="resources/img/start/mbtiinfo.jpg" style="width:100%" >
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
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
				            	<span class="login100-form-title p-b-49">����� �̻�����? </span>
				            </div>
				            <div class="panel-body">
				                <!-- Select Basic -->
								<div class="form-group" style="float: none; margin: 0 auto;">
								  <label class="col-md-4 control-label" for="selectbasic">ü��</label>
									  <div class="col-md-2" style="float: none; margin: 0 auto;">
									    <select id="selectbasic" name="selectbasic" class="form-control">
									      <option value="1">����</option>
									      <option value="2">����</option>
									      <option value="3">����</option>
									    </select>
									  </div>
									</div>
								
								<!-- Select Basic -->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="Ű">Ű</label>
								  <div class="col-md-2" style="float: none; margin: 0 auto;">
								    <select id="Ű" name="Ű" class="form-control">
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
								  <label class="col-md-4 control-label" for="selectbasic">���� ���̴� �� �� ����?</label>
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
				            	<span class="login100-form-title p-b-49">���� ���� </span>
				            </div>
				            <div class="panel-body">
				                <!-- Select Basic -->
								<div class="form-group" style="float: none; margin: 0 auto;">
								  <label class="col-md-4 control-label" for="selectbasic">ü��</label>
									  <div class="col-md-2" style="float: none; margin: 0 auto;">
									    <select id="selectbasic" name="selectbasic" class="form-control">
									      <option value="1">����</option>
									      <option value="2">����</option>
									      <option value="3">����</option>
									    </select>
									  </div>
									</div>
								
								<!-- Select Basic -->
								<div class="form-group">
								  <label class="col-md-4 control-label" for="Ű">Ű</label>
								  <div class="col-md-2" style="float: none; margin: 0 auto;">
								    <select id="Ű" name="Ű" class="form-control">
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
								  <label class="col-md-4 control-label" for="selectbasic">��� ����</label>
								  <div class="col-md-3" style="float: none; margin: 0 auto;">
								    <select id="selectbasic" name="selectbasic" class="form-control">
								      <option value="1">����Ư����</option>
								      <option value="2">��⵵</option>
								      <option value="3">������</option>
								      <option value="4">��󳲵�</option>
								      <option value="5">���ϵ�</option>
								      <option value="6">��û����</option>
								      <option value="7">��û�ϵ�</option>
								      <option value="8">���󳲵�</option>
								      <option value="8">����ϵ�</option>
								      <option value="9">���ֵ�</option>
								      <option value="10">��Ÿ</option>
								    </select>
								  </div>
								</div>

				               
				                <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
				                <br>
				            </div>
				        </div>
				        
				        
				       
				        
				        
				        <div class="panel panel-primary setup-content" id="step-5">
				            <div class="panel-heading">
				            	<span class="login100-form-title p-b-49">������ </span>
				                 
				            </div>
				            <div class="panel-body ">
				                <table style="margin : auto; text-align: center;">
				                	<tbody>
				                		<tr>
											<th>���̵�</th>
											<td><p>
													<input class="w3-input" placeholder="���̵�" type="text"
														required="required" name="user_id" id="user_id"><label id="idlabel"></label>
												</p></td>
											<td><button type="button" class="btn btn-warning"
													id="idchk">�ߺ�Ȯ��</button></td>
										</tr>
										<tr>
											<th>��й�ȣ</th>
											<td><p>
													<input class="w3-input" placeholder="��й�ȣ" type="password"
														required="required" name="pwd" id="pwd">
												</p></td>
										</tr>
			
										<tr>
											<br>
											<th>��й�ȣ Ȯ��</th>
											<td><p>
													<br> <input class="w3-input" placeholder="��й�ȣȮ��"
														type="password" required="required" id="pwdchk"> <label id="pwdlabel"></label>
												</p></td>
										</tr>
			
										<tr>
											<th>�̸�</th>
											<td><p>
													<input class="w3-input" placeholder="�̸�" type="text"
														required="required" name="name" id="name">
												</p></td>
										</tr>
			
										<tr>
											<th>����</th>
											<td><p>
													<input class="w3-input" placeholder="����" type="text"
														name="nickname" id="nickname"><label id="nicknamelabel"></label>
												</p></td>
											<td><button type="button" class="btn btn-warning"
													id="nickchk">�ߺ�Ȯ��</button></td>
										</tr>
										<tr>
											<th>�̸���</th>
											<td><p>
													<input class="w3-input" placeholder="�̸���" type="email"
														name="email" id="email" onchange="rexEmail()" value=${vo.getEmail() }>											
														 <label id="emaillabel"></label>
														
												</p></td>
											<td><button type="button" class="btn btn-warning"
													id="emailchk">�ߺ�Ȯ��</button></td>
										</tr>
			
										<tr>
											<th>����</th>
											<td><p>
													<br>
													<input class="w3-radio" type="radio" name="sex" value="m"
														checked> <label>����</label> <input class="w3-radio"
														type="radio" name="sex" value="f"> <label>����</label>
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
				            	<span class="login100-form-title p-b-49">������ �ۼ�</span>
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
									<div class="btn btn-outline-dark" onclick="onclick=document.all.file.click()">�����߰�</div>
								</div>
								<br>
								<table style="margin : auto; text-align: center;">
									<tbody>
		
										<tr>
											<td>
												<div class="form-group text-center" >
								                    <label for="message">�ڱ�Ұ�</label><br>
								                    <textarea name="user_intro" id="user_intro" cols="40" rows="5" class="form-control" placeholder="�ڱ�Ұ��� �Է����ּ���"></textarea>
								                  </div>
																			
														</td>
														
													</tr>
												</tbody>
											</table>
									 <br>
									<!-- <p style="text-align: right; color: red;">*�� �ʼ��׸��Դϴ�.</p> -->
									<br> <br>
							                <div class="container-login100-form-btn text-center">
			              					    <div class="wrap-login100-form-btn">
			                   						  <div class="login100-form-bgbtn"></div>
			                   							  <button class="btn btn-outline-info" id="intro_submit">
			                     							   ȸ�����ԿϷ�
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
                  <span class="label-input100">���̵�</span>
                  <input class="input100" type="text" id="user_id" name="user_id" placeholder="Type your username">
                  <span class="focus-input100" data-symbol="&#xf206;"></span>
               </div>

               <div class="wrap-input100 validate-input" data-validate="Password is required">
                  <span class="label-input100">��й�ȣ</span>
                  <input class="input100" type="password" id="pwd" name="pwd" placeholder="Type your password">
                  <span class="focus-input100" data-symbol="&#xf190;"></span>
               </div>
               <br>
               <c:if test="${msg == 'failure' }">
                  <div style="color: red;">
             		     ���̵� �Ǵ� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.
                  </div>
               </c:if>
               <c:if test="${msg == 'logout' }">
                  <div style="color: red;">
                		  �α׾ƿ��Ǿ����ϴ�.
                  </div>
               </c:if>
               
                 <div class="container-login100-form-btn text-center">
                  <div class="wrap-login100-form-btn">
                     <div class="login100-form-bgbtn"></div>
                     <button id="login_submit" class="btn btn-outline-info" >
                     		   �α���
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
	    //����Ʈ��Ŀ
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
				
				showOn : "both", //������Ʈ�� �̹��� ���� ���(both,button)
				yearRange : '1900:2020', //1990����� 2020�����
				showOn: "button", //button:��ư�� ǥ���ϰ�,��ư�� �����߸� �޷� ǥ�� ^ both:��ư�� ǥ���ϰ�,��ư�� �����ų� input�� Ŭ���ϸ� �޷� ǥ��     
			   	buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", //��ư �̹��� ���
				buttonImageOnly: true, //�⺻ ��ư�� ȸ�� �κ��� ���ְ�, �̹����� ���̰� ��
				buttonText: "����" //��ư�� ���콺 ���� ���� �� ǥ�õǴ� �ؽ�Ʈ      
			};
		
		
			
			$("#form_dt").datepicker(clareCalendar);												
			$("#ui-datepicker-div").hide(); //�ڵ����� �����Ǵ� div��ü ���� 
			$("#form_dt" ).datepicker( "getDate" );	//���� ���õǾ� �ִ� ��¥ �������� (Date ������ ��ȯ)
	});
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

</script>
<script>
		
							
			

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
		$('#pwdchk').change(function() {

			if ($('#pwd').val() != $('#pwdchk').val()) {
				if ($('#pwdchk').val() !== '') {
					$('#pwdchk').empty();
					document.getElementById("pwdlabel").innerHTML = "<p style='color:red'>��й�ȣ�� �ٸ��ϴ�</p>";

				}
			} else {
				if ($('#pwd').val() != '' && $('#pwdchk').val() != '') {
					document.getElementById("pwdlabel").innerHTML ="<p style='color:blue'>��й�ȣ�� �����ϴ�</p>";
				}
			}
		})

		
		$('#pwd').change(function() {

			if ($('#pwd').val() != $('#pwdchk').val()) {
				if ($('#pwdchk').val() !== '') {
					alert("��й�ȣ�� �ٸ��ϴ�.");
					$('#pwd').empty();
					
					document.getElementById("pwdlabel").innerHTML = "<p style='color:red'>��й�ȣ�� �ٸ��ϴ�</p>";
					

				}
			} else {
				if ($('#pwd').val() != '' && $('#pwdchk').val() != '') {

					document.getElementById("pwdlabel").innerHTML = "<p style='color:blue'>��й�ȣ�� �����ϴ�</p>";
					
				}
			}
		})


		
		
		$('#user_id').change(function(){
			document.getElementById("idlabel").innerHTML = "";
			if($('#user_id').val() === ''){ //���� �޶����µ� ��ĭ�̸�
				document.getElementById("idlabel").innerHTML = "<p style='color:red'>���̵� �Է����ּ���.</p>";
				idchk = 'false';
			}
			idchk='false';	//���̵� �κ��� ���� �ٲ�� false�� ����.
		});
				
		$('#nickname').change(function(){
			document.getElementById("nicknamelabel").innerHTML = "";
			if($('#nickname').val() === ''){ //���� �޶����µ� ��ĭ�̸�
				document.getElementById("nicknamelabel").innerHTML = "<p style='color:red'>������ �Է����ּ���.</p>";
				nickchk = 'false';
			}
			nickchk='false';	//���̵� �κ��� ���� �ٲ�� false�� ����.
		});
		$('#email').change(function(){
			document.getElementById("emaillabel").innerHTML = "";
			if($('#email').val() === ''){ //���� �޶����µ� ��ĭ�̸�
				document.getElementById("emaillabel").innerHTML = "<p style='color:red'>�̸����� �Է����ּ���.</p>";
				emailchk = 'false';
			}
			emailchk='false';	//���̵� �κ��� ���� �ٲ�� false�� ����.
		});
		
		var idchk='false';
		var nickchk='false';
		var emailchk='false';
		var rexemail='false';


		//���̵� üũ.
		$('#idchk').on('click', function() {

			$.ajax({
				url : "idchk",
				type : "post",
				data : {
					id : $('#user_id').val()
				},
				success : function(data) {
					if($('#user_id').val() === ''){//��ĭ
						idchk = 'false';
						document.getElementById("idlabel").innerHTML = "<p style='color:red'>���̵� �Է����ּ���</p>";
						return;

					}
					if (data === 1) {
						
						idchk='false';
						document.getElementById("idlabel").innerHTML = "<p style='color:red'>���Ұ����� ���̵��Դϴ�</p>";

					} else if (data === 0 && $('user_id').val() !== '') {
						
						idchk='true';
						document.getElementById("idlabel").innerHTML = "<p style='color:blue'>��밡���� ���̵��Դϴ�.</p>";
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
					if($('#nickname').val() === ''){ //��ĭ�� ��.
						nickchk = 'false';
						document.getElementById("nicknamelabel").innerHTML = "<p style='color:red'>������ �Է����ּ���</p>";
						return;
					}
					else if (data === 1) {
						
						nickchk='false';
						document.getElementById("nicknamelabel").innerHTML = "<p style='color:red'>���Ұ����� �����Դϴ�.</p>";

						//$('#send').attr('disabled', 'disabled');
					} else if (data === 0) {
						nickchk='true';
						document.getElementById("nicknamelabel").innerHTML = "<p style='color:blue'>��밡���� �����Դϴ�.</p>";
					}
				},
				error : function() {
					console.log("ajax error");
				}
			})

		})
		/*���� : https://myjamong.tistory.com/17*/
		
		////�̸��� üũ
		$('#emailchk').on('click', function() {

			$.ajax({
				url : "emailchk",
				type : "post",
				data : {
					email : $('#email').val()
				},
				success : function(data) {
					console.log(data);
					if($('#email').val() === ''){ //��ĭ�� ��.
						emailchk = 'false';
						document.getElementById("emaillabel").innerHTML = "<p style='color:red'>�̸����� �Է����ּ���</p>";
						return;

					}
					if (data === 1) {	//�ߺ��� ���� ���� ��.
						emailchk='false';
						document.getElementById("emaillabel").innerHTML = "<p style='color:red'>���Ұ����� �̸����Դϴ�.</p>";
						return;

					} else if (data === 0 &&  rexemail==='true') {	//�ߺ��� ���� ����, ���Խĸ���
						emailchk='true';
						document.getElementById("emaillabel").innerHTML = "<p style='color:blue'>��밡���� �̸����Դϴ�.</p>";
						return;

					}else if (data === 0 && rexemail==='false') { //�ߺ��Ǵ� ���� ������, ���Խ��� ���� ���� ��.
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
		
		function datechk(){
			
		}
		
		
		
		//step1~7 ����
		//������ ��, �ߺ�üũ ���� Ȯ��
		$('#spec_submit').on('click', function(){
			if(nickchk==='true' && idchk==='true' && rexemail==='true' && emailchk==='true' && $("#form_dt" ).datepicker( "getDate" )!==null){				
				$('#info_form').submit();
				alert('������ �ܰ��Դϴ�.')
			}else if(idchk==='false'){
				alert("���̵� �ߺ�üũ�� ���ּ���");
			}else if(nickchk==='false'){
				alert("���� �ߺ�üũ�� ���ּ���");
			}else if(emailchk==='false'){
				alert('�̸��� �ߺ�üũ�� ���ּ���');
			}else if(rexemail==='false'){
				alert('�̸��� ������ Ȯ�����ּ���');
			}else if($("#form_dt" ).datepicker( "getDate" )===null){
				alert("��¥�� �Է����ּ���");
			}
		})
		//step7 ����
		$('#intro_submit').on('click', function(){
			alert('ȸ�������� �����մϴ�. �α������ּ���.')
			$('#introduce').submit();
		})
		
		
		//�α���
		$('#login_submit').on('click', function(){
			alert('�α���')
			$('#logindo').submit();
		})
		
		var rexemail='false';

		function rexEmail(){
			  var email = $("#email").val();
			
			  var rex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			  // �̸��� ���Խ�
			
				if(rex.test(email)){
				  rexemail='true';
			    console.log("����: " + rexemail);

			  }
			  else {
				  rexemail='false';
			   
			    console.log("����: " + rexemail);
			  }
		}
		
		//����
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