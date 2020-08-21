<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Login</title>

<script src="resources/js/jquery.form.js"></script>


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
   href="resources/images/icons/favicon.ico" />
<link
   href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
<link rel="icon" href="images/person_1.png" type="images/water.png" />
<link href="resources/css/util.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!--===============================================================================================-->
<!-- 웹폰트 -->
<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;800&family=Noto+Serif+KR:wght@200;900&display=swap"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Noto+Serif+KR:wght@200;900&display=swap"
   rel="stylesheet">
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
   margin-top: 30px;
}

.stepwizard-step p {
   margin-top: 0px;
   color: #666;
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

.stepwizard .btn.disabled, .stepwizard .btn[disabled], .stepwizard fieldset[disabled] .btn
   {
   opacity: 1 !important;
   color: #bbb;
}

.stepwizard-row:before {
   top: 14px;
   bottom: 0;
   position: absolute;
   content: " ";
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

#mbtihover:hover { <---- 'menubar '안에 있는 div들에게 마우스를 올리면 background:#555;
   color: #ff00ff;
   <----
   배경색이
   #555색상으로
   변하고
   글자색상이
   #fff색상으로
   변해요!
}

body {
   margin: 0;
   padding: 0;
}
</style>

</head>


<body>
   <div
      style="background-image: url('resources/img/start/couple2.gif'); background-size: 100% 100%; overflow: hidden; margin_top: 0%">
      <div class="limiterw">

         <div class="container-login100">

            <div class="col-md-5 banner-sec wrap-login100"
               style="background-color: rgba(255, 255, 255, 0.95);">
               <br>
               <br>
               <br>
         <div class="wrapper">
            <div class="slidelist">
               <div class="container text-center">

                     <div class="stepwizard">
                           <div class="stepwizard-row setup-panel">
                              <div class="stepwizard-step col-xs-3">
                                 <a href="#step-1" type="button"
                                    class="btn btn-success btn-circle">1</a>
                              </div>
                              <div class="stepwizard-step col-xs-3">
                                 <a href="#step-2" type="button"
                                    class="btn btn-default btn-circle"  disabled="disabled">2</a>
                              </div>
                              <div class="stepwizard-step col-xs-3">
                                 <a href="#step-3" type="button"
                                    class="btn btn-default btn-circle" disabled="disabled">3</a>
                              </div>
                              <div class="stepwizard-step col-xs-3">
                                 <a href="#step-4" type="button"
                                    class="btn btn-default btn-circle" disabled="disabled">4</a>
                              </div>
                              <div class="stepwizard-step col-xs-3">
                                 <a href="#step-5" type="button"
                                    class="btn btn-default btn-circle" disabled="disabled">5</a>
                              </div>
                              <div class="stepwizard-step col-xs-3">
                                 <a href="#step-6" type="button"
                                    class="btn btn-default btn-circle" disabled="disabled">6</a>
                              </div>
                           </div>
                        </div>


                  <form  method="post" action="joinaction" class="login100-form validate-form" name="joinform" enctype="multipart/form-data" id="joinform">
                  
                           <div class="panel panel-primary setup-content text-center"
                              id="step-1">
                              <div class="jumbotron well" style="text-shadow: -1px 0 white, 0 1px white, 1px 0 white, 0 -1px white; color:white; opacity:0.9; background-image: url('resources/img/start/force.gif');">
	                              
	                                 <h1 class="login100-form-title p-b-49 text-center"
	                                    style="color: #011E52; font-weight: bold">처음 방문하셨나요?</h1>
	                                 <span class="text-center lead" style="color: #011E52; font-weight: bold">
	                                   MBTI와 생일 등 간단한 정보를 입력하시면 <br>인연을 추천해드려요
	                                 </span>
                              </div>
                              <div class="panel-heading">
                                 <span class="login100-form-title p-b-30"> 태어난 날을 입력해보세요. </span> 
                                 <label>태어난 시간을 모를 경우 00시 00분 체크</label>
                              </div>
                              <div class="panel-body text-center">
                                 <table style="margin: auto; text-align: center;">
                                    <tbody>
                                       <tr>
                                          <th> <br><span class="text-center lead" style="font-weight: bold">
	생년월일	                                 </span></th>
                                          <c:set var="birth" value="${vo.getBirth()}" />
                                          <td>&nbsp;<br> <input name="birth" type="text"
                                             style="text-decoration: none; width: 100px" id=form_dt
                                             size="5" value=""></td>
                                       </tr>
                                       <tr>
                                          <td><br></td>
                                       </tr>
                                       <tr>
                                          <th> <span class="text-center lead" style="font-weight: bold">
	                                   태어난 시간
	                                 </span></th>
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
                                                         <option value="${i }" style='width: 20px;'>${i }분</option>
                                                      </c:forEach>

                                                   </select>
                                                </div>
                                             </div></td>
                                       </tr>
                                    </tbody>
                                 </table>
                                 <button class="btn btn-primary nextBtn pull-right"
                                    type="button">Next</button>
                                 <br>
                                 <br>
                                 <br>
                              </div>
                           </div>

                           <div class="panel panel-primary setup-content" id="step-2">
                              <div class="panel-heading">
                                 <span class="login100-form-title p-b-49"> MBTI를 입력해주세요
                                 </span>

                              </div>
                              <div class="panel-body">
                                 <!-- Text input-->
                                 <div class="form-group">
                                    <label class="col-md-4 control-label lead" for="textinput">MBTI
                                       선택</label>
                                    <div class="col-md-2" style="float: none; margin: 0 auto;">
                                       <select id="user_mbti" name="user_mbti"
                                          class="form-control">
                                          <option value="ISTJ">ISTJ</option>
                                          <option value="ISFJ">ISFJ</option>
                                          <option value="INFJ">INFJ</option>
                                          <option value="INTJ">INTJ</option>
                                          <option value="ISTP">ISTP</option>
                                          <option value="ISFP">ISFP</option>
                                          <option value="INFP">INFP</option>
                                          <option value="INTP">INTP</option>
                                          <option value="ESTP">ESTP</option>
                                          <option value="ESFP">ESFP</option>
                                          <option value="ENFP">ENFP</option>
                                          <option value="ENTP">ENTP</option>
                                          <option value="ESTJ">ESTJ</option>
                                          <option value="ESFJ">ESFJ</option>
                                          <option value="ENFJ">ENFJ</option>
                                          <option value="ENTJ">ENTJ</option>
                                       </select>

                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <label class="control-label lead" id="mbtihover">MBTI를
                                       모르십니까?</label>
                                    <button type="button" class="btn btn-primary"
                                       data-toggle="modal" data-target="#myModal">MBTI
                                       간단체크하기</button>
                                    <br>
                                    <div class="modal fade" id="myModal" tabindex="-1"
                                       role="dialog" aria-labelledby="myModalLabel">
                                       <div class="modal-dialog" role="document">
                                          <div class="modal-content">
                                             <div class="modal-header">

                                                <h4 class="modal-title" id="myModalLabel">MBTI
                                                   간단체크하기!</h4>
                                             </div>
                                             <div class="modal-body">
                                                <img src="resources/img/start/mbtiinfo.jpg"
                                                   style="width: 100%">
                                             </div>
                                             <div class="modal-footer">
                                                <button type="button" class="btn btn-default"
                                                   data-dismiss="modal">닫기</button>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <button class="btn btn-primary nextBtn pull-right"
                                    type="button">Next</button>
                                 <br>
                              </div>
                           </div>

                           <div class="panel panel-primary setup-content" id="step-4">
                              <div class="panel-heading">
                                 <span class="login100-form-title p-b-49">당신의 이상형은? </span>
                              </div>
                              <div class="panel-body">
                                 

                                 <!-- Select Basic -->
                                 <div class="form-group">
                                    <span class="text-center lead" style="font-weight: bold">
	                                		  이상형 키
	                                 </span>
                                    <div class="col-md-2" style="float: none; margin: 0 auto;">
                                       <select id="ideal_height" name="ideal_height"
                                          class="form-control">
                                          <c:forEach begin="140" step="1" end="200" var="i">
                                             <option value="${i }">${i }</option>
                                          </c:forEach>
                                          
                                       </select>
                                    </div>
                                 </div>
                                 <!-- Select Basic -->
                                 <div class="form-group" style="float: none; margin: 0 auto;">
                                     <span class="text-center lead" style="font-weight: bold">
	                                		  이상형 몸무게
	                                 </span>
                                    <div class="col-md-2" style="float: none; margin: 0 auto;">
                                       <select id="ideal_body" name="ideal_body"
                                          class="form-control">
                                          <c:forEach begin="30" step="1" end="150" var="i">
                                                <option value="${i }">${i }</option>
                                             </c:forEach> 
                                       </select>
                                    </div>
                                 </div>
                                 <!-- Select Basic -->
                                 <div class="form-group" style="float: none; margin: 0 auto;">
                                    <span class="text-center lead" style="font-weight: bold">
	                                		  나이
	                                 </span>
                                    <div class="col-md-2" style="float: none; margin: 0 auto;">
                                       <select id="ideal_age" name="ideal_age"
                                          class="form-control">
                                          <c:forEach begin="10" step="1" end="100" var="i">
                                                <option value="${i }">${i }</option>
                                             </c:forEach>
                                       </select>
                                    </div>
                                 </div>

                                 <button class="btn btn-primary nextBtn pull-right"
                                    type="button">Next</button>
                                 <br>
                              </div>
                           </div>

                           <div class="panel panel-primary setup-content" id="step-3">
                              <div class="panel-heading">
                                 <span class="login100-form-title p-b-49">나의 정보 </span>
                              </div>
                              <div class="panel-body">
                            

                                 <!-- Select Basic -->
                                 <div class="form-group">
                                     <span class="text-center lead" style="font-weight: bold">
	                                   		나의 키
	                                 </span>
                                    <div class="col-md-2" style="float: none; margin: 0 auto;">
                                       <select id="user_height" name="user_height"
                                          class="form-control">
                                          <c:forEach begin="140" step="1" end="200" var="i">
                                             <option value="${i }">${i }</option>
                                          </c:forEach>
                                          
                                       </select>
                                    </div>
                                 </div>
                                      <!-- Select Basic -->
                                 <div class="form-group" style="float: none; margin: 0 auto;">
                                    <span class="text-center lead" style="font-weight: bold">
	                                   		나의 몸무게
	                                 </span>
                                    <div class="col-md-2" style="float: none; margin: 0 auto;">
                                       <select id="user_body" name="user_body"
                                          class="form-control">
                                          <c:forEach begin="30" step="1" end="150" var="i">
                                                <option value="${i }">${i }</option>
                                             </c:forEach>  
                                       </select>
                                    </div>
                                 </div>
                                 <!-- Select Basic -->
                                 <div class="form-group">
                                    <span class="text-center lead" style="font-weight: bold">
	                                   		<br>내가 사는 지역
	                                 </span>
                                    <div class="col-md-3" style="float: none; margin: 0 auto;">
                                       <select id="user_loc" name="user_loc" class="form-control">
                                          <option value="서울특별시">서울특별시</option>
                                          <option value="경기도">경기도</option>
                                          <option value="강원도">강원도</option>
                                          <option value="경상남도">경상남도</option>
                                          <option value="경상북도">경상북도</option>
                                          <option value="충청남도">충청남도</option>
                                          <option value="충청북도">충청북도</option>
                                          <option value="전라남도">전라남도</option>
                                          <option value="전라북도">전라북도</option>
                                          <option value="제주도">제주도</option>
                                          <option value="기타">기타</option>
                                       </select>
                                    </div>
                                 </div>


                                 <button class="btn btn-primary nextBtn pull-right"
                                    type="button">Next</button>
                                 <br>
                              </div>
                           </div>

                           <div class="panel panel-primary setup-content" id="step-5">
                              <div class="panel-heading">
                                 <span class="login100-form-title p-b-49">상세정보 </span>

                              </div>
                              <div class="panel-body ">
                                 <table style="margin: auto; text-align: center;">
                                    <tbody>
                                       <tr>
                                          <th><span class="text-center lead" style="font-weight: bold">
	                                		  아이디
	                                 </span></th>
                                          <td><p>
                                                <input class="w3-input" placeholder="아이디" type="text"
                                                   required="required" name="user_id" id="join_user_id"><label
                                                   id="idlabel"></label>
                                             </p></td>
                                          <td><button type="button" class="btn btn-warning"
                                                id="idchk">중복확인</button></td>
                                       </tr>
                                       <tr>
                                          <th><span class="text-center lead" style="font-weight: bold">
	                                		  비밀번호
	                                 </span></th>
                                          <td><p>
                                                <input class="w3-input" placeholder="비밀번호"
                                                   type="password" required="required" name="pwd" id="join_pwd">
                                             </p></td>
                                       </tr>

                                       <tr>
                                          
                                          <th><span class="text-center lead" style="font-weight: bold">
	                                		  비밀번호 확인
	                                 </span></th>
                                          <td><p>
                                                <br> <input class="w3-input" placeholder="비밀번호확인"
                                                   type="password" required="required" id="pwdchk">
                                                <label id="pwdlabel"></label>
                                             </p></td>
                                       </tr>

                                       <tr>
                                          <th><span class="text-center lead" style="font-weight: bold">
	                                		  이름
	                                 </span></th>
                                          <td><p>
                                                <input class="w3-input" placeholder="이름" type="text"
                                                   required="required" name="name" id="name">
                                             </p></td>
                                       </tr>

                                       <tr>
                                          <th><span class="text-center lead" style="font-weight: bold">
	                                		닉네임
	                                 </span></th>
                                          <td><p>
                                                <input class="w3-input" placeholder="별명" type="text"
                                                   name="nickname" id="nickname"><label
                                                   id="nicknamelabel"></label>
                                             </p></td>
                                          <td><button type="button" class="btn btn-warning"
                                                id="nickchk">중복확인</button></td>
                                       </tr>
                                       <tr>
                                          <th><span class="text-center lead" style="font-weight: bold">
	                                		  이메일
	                                 </span></th>
                                          <td><p>
                                                <input class="w3-input" placeholder="이메일" type="email"
                                                   name="email" id="email" onchange="rexEmail()"
                                                   value=${vo.getEmail() }> <label id="emaillabel"></label>

                                             </p></td>
                                          <td><button type="button" class="btn btn-warning"
                                                id="emailchk">중복확인</button></td>
                                       </tr>

                                       <tr>
                                          <th><span class="text-center lead" style="font-weight: bold">
	                                		 성별
	                                 </span></th>
                                          <td><p>
                                                <br> <input class="w3-radio" type="radio"
                                                   name="sex" value="m" checked> <label>남자</label>
                                                <input class="w3-radio" type="radio" name="sex"
                                                   value="f"> <label>여자</label>
                                             </p></td>
                                       </tr>
                                    </tbody>
                                 </table>
                                 <button class="btn btn-primary nextBtn pull-right"
                                    type="button"  id="spec_submit">Next</button>
                                 <br>
                  

                     </div>
                  </div>

                           <div class="panel panel-primary setup-content" id="step-6">
                     <div class="panel-heading">
                        <span class="login100-form-title p-b-49">프로필 작성</span>
                     </div>
                     <div class="panel-body">

                        <div class="profile_base .img-rounded"
                           style="width: 250px; margin: 0 auto;">

                           <img class="profile_img .img-rounded"
                              style="width: 250px; margin: 0 auto; margin: auto; text-align: center;"
                              id="profileimg" src="resources/img/default.png">

                        </div>
                        <br>


                        <div class="text-center">
<!--                             <input type="file" id="file" name="file" style="display: none">
                           <div class="btn btn-outline-dark"
                              onclick="fileclick()">사진추가</div> -->
 
					       <div class="form-group" style="text-align: center; width:400px; margin-left: 160px;">
					         <input type="file" id="file" name="file" style="display:none;" accept=".jpg,.jpeg,.png,.gif,.PNG">
					          <div id="file_upload" class="btn btn-outline-dark"
					                              onclick="fileclick()">사진추가</div>     
					            <button type="button" class="btn btn-warning" id="imgchk">사람확인</button>
					                                                <br><label id="imglabel"></label>
					      </div>
 
                        </div> 
                        <br>
                        <table style="margin: auto; text-align: center;">
                           <tbody>

                              <tr>
                                 <td>
                                    <div class="form-group text-center">
                                       <span class="text-center lead" style="font-weight: bold">
	                                		  자기소개
	                                 </span><br>
                                       <textarea name="user_intro" id="user_intro" cols="40"
                                          rows="5" class="form-control" placeholder="자기소개를 입력해주세요"></textarea>
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
                              <button class="btn btn-outline-info" onclick="memberjoin()" id="joinsucess">
                                 회원가입완료</button>
                           </div>
                        </div>
                        <br>
                     </div>

                  </div>
                  </form>
               </div>
            </div>

         </div>


      </div>

      <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54 ml-4"
         style="background-color: rgba(255, 255, 255, 0.95);">
     <form method="post" action="logindo" class="login100-form validate-form" id="logindo">

         <span class="login100-form-title p-b-49"> Login </span>

         <div class="wrap-input100 validate-input m-b-23"
            data-validate="Username is reauired">
            <span class="label-input100">아이디</span> <input class="input100"
               type="text" id="user_id" name="user_id"
               placeholder="Type your username"> <span
               class="focus-input100" data-symbol="&#xf206;"></span>
         </div>

         <div class="wrap-input100 validate-input"
            data-validate="Password is required">
            <span class="label-input100">비밀번호</span> <input class="input100"
               type="password" id="pwd" name="pwd"
               placeholder="Type your password"> <span
               class="focus-input100" data-symbol="&#xf190;"></span>
         </div>
         <br>
         <c:if test="${msg == 'failure' }">
            <div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
         </c:if>
         <c:if test="${msg == 'logout' }">
            <div style="color: red;">로그아웃되었습니다.</div>
         </c:if>

         <div class="container-login100-form-btn text-center">
            <div class="wrap-login100-form-btn">
               <div class="login100-form-bgbtn"></div>
               <button id="login_submit" class="btn btn-outline-info">
                  로그인</button>
            </div>
         </div>
   </form>
         <br>


         <div class="text-right p-t-8 p-b-31">
            <a href="findidform"> Forgot ID? </a> <br> <a
               href="findpwdform"> Forgot password? </a>
         </div>
      </div>
   </div>
   </div>
   </div>


   <div id="dropDownSelect1"></div>
   <script>
   
   
		   var imgchk = 'false';
		   //프로필사진 체크.
		   $('#imgchk').click(function() {
		      //console.log('imgimg클릭되었니?')
		      //var image = $("#file").val();
		      //console.log(image);
		      var formData = new FormData();
		      var inputFile = $("input[name='file']");
		      var files = inputFile[0].files;
		      console.log(files);
		            
		      for (var i = 0; i < files.length; i++) {
		         formData.append("uploadFile", files[i]);
		      }
		      
		       $.ajax({
		         url : "imgchk",
		         processData: false,
		         contentType: false,
		         data: formData,
		         type : "POST",
		         enctype: 'multipart/form-data',
		         success : function(data) {
		            if (data !== 1) {
		               imgchk = 'false';
		               document.getElementById("imglabel").innerHTML = "<p style='color:red'>얼굴사진을 넣어주세요</p>";
		               }else {
		                  imgchk = 'true';
		                  document.getElementById("imglabel").innerHTML = "<p style='color:green'>얼굴사진 입니다.</p>";
		               }   
		            },
		         error : function(request, status, error) {
		            alert("code = " + request.status + " message = "
		                  + request.responseText + " error = " + error); // 실패 시 처리
		            }
		         }) 
		
		      })
      </script>
   
   
   
   
   
   
   
   <script>
      $(function(){
         var msg = '${msg}'
         if(msg !== '' && msg !== 'failure'){
            alert(msg);
         }
         
      })
   </script>
   <script type="text/javascript">
   		function fileclick(){
   			$('#file').click();
   		}
   </script>
   
   <script>
      $(document)
            .ready(
                  function() {

                     var navListItems = $('div.setup-panel div a'), allWells = $('.setup-content'), allNextBtn = $('.nextBtn');

                     allWells.hide();

                     navListItems
                           .click(function(e) {
                              e.preventDefault();
                              var $target = $($(this).attr('href')), $item = $(this);

                              if (!$item.hasClass('disabled')) {
                                 navListItems.removeClass(
                                       'btn-success').addClass(
                                       'btn-default');
                                 $item.addClass('btn-success');
                                 allWells.hide();
                                 $target.show();
                                 $target.find('input:eq(0)').focus();
                              }
                           });

                     allNextBtn
                           .click(function() {
                              var curStep = $(this).closest(
                                    ".setup-content"), curStepBtn = curStep
                                    .attr("id"), nextStepWizard = $(
                                    'div.setup-panel div a[href="#'
                                          + curStepBtn + '"]')
                                    .parent().next().children("a"), curInputs = curStep
                                    .find("input[type='text'],input[type='url']"), isValid = true;

                              $(".form-group").removeClass(
                                    "has-error");
                              for (var i = 0; i < curInputs.length; i++) {
                                 if (!curInputs[i].validity.valid) {
                                    isValid = false;
                                    $(curInputs[i]).closest(
                                          ".form-group")
                                          .addClass("has-error");
                                 }
                              }

                              if (isValid)
                                 nextStepWizard.removeAttr(
                                       'disabled')
                                       .trigger('click');
                           });

                     $('div.setup-panel div a.btn-success').trigger(
                           'click');
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
                        changeMonth : true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다
                        changeYear : true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.

                        showOn : "both", //엘리먼트와 이미지 동시 사용(both,button)
                        yearRange : '1900:2020', //1990년부터 2020년까지
                        showOn : "button", //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시     
                        buttonImage : "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", //버튼 이미지 경로
                        buttonImageOnly : true, //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                        buttonText : "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트      
                     };

                     $("#form_dt").datepicker(clareCalendar);
                     $("#ui-datepicker-div").hide(); //자동으로 생성되는 div객체 숨김 
                     $("#form_dt").datepicker("getDate"); //현재 선택되어 있는 날짜 가져오기 (Date 형으로 반환)
                  });
      $('#emailchk')
            .on(
                  'click',
                  function() {
                     $
                           .ajax({
                              url : "emailchk",
                              type : "post",
                              data : {
                                 email : $('#email').val()
                              },
                              success : function(data) {//data==1 : 중복되는 값이 있음. data==0: 중복되는 값이 없음.
                                 console.log(data);
                                 if ($('#email').val() === '') { //빈칸일 때.
                                    emailchk = 'false';
                                    document
                                          .getElementById("emaillabel").innerHTML = "<p style='color:red'>이메일을 입력해주세요</p>";
                                    return;
                                 } else if (data === 1
                                       && $('#email').val() !== email) {//중복되는 값이 있고, 원래 이메일과 값이 달라졌을 때.                                    
                                    emailchk = 'false';
                                    document
                                          .getElementById("emaillabel").innerHTML = "<p style='color:red'>사용불가능한 이메일입니다</p>";
                                    return;

                                 } else if ($('#email').val() === email) {//값이 중복이 되든 안되든, 원래 이메일과 값이 같을 때.                                    
                                    emailchk = 'true';
                                    document
                                          .getElementById("emaillabel").innerHTML = "<p style='color:blue'>사용가능한 이메일입니다.</p>";
                                    return;
                                 } else if (data === 0
                                       && $('#email').val() !== email
                                       && rexemail === 'true') { //중복되는 값이 없고, 원래 이메일값이랑 다르고, 정규식도 만족.
                                    emailchk = 'true';
                                    document
                                          .getElementById("emaillabel").innerHTML = "<p style='color:blue'>사용가능한 이메일입니다.</p>";
                                    return;
                                 } else if (data === 0
                                       && $('#email').val() !== email
                                       && rexemail === 'false') { //중복되는 값이 없고, 원래 이메일값이랑 다르지만 정규식이 아닐 때.
                                    emailchk = 'false';
                                    document
                                          .getElementById("emaillabel").innerHTML = "<p style='color:red'>이메일 형식을 맞춰주세요.</p>";
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
      /*
       처리해야할것.
       1. 중복체크를 했는지
       1-1 했으면 그게 통과했는지
       2. 비밀번호와 비밀번호 확인이 맞는지.
       3. 별명이 중복체크 했는지.
       3-1 했으면 그게 통과했는지

      
      
       */

      //비밀번호 확인 
      $('#pwdchk')
            .change(
                  function() {

                     if ($('#join_pwd').val() != $('#pwdchk').val()) {
                        if ($('#pwdchk').val() !== '') {
                           $('#pwdchk').empty();
                           document.getElementById("pwdlabel").innerHTML = "<p style='color:red'>비밀번호가 다릅니다</p>";

                        }
                     } else {
                        if ($('#join_pwd').val() != ''
                              && $('#pwdchk').val() != '') {
                           document.getElementById("pwdlabel").innerHTML = "<p style='color:blue'>비밀번호가 같습니다</p>";
                        }
                     }
                  })

      $('#join_pwd')
            .change(
                  function() {

                     if ($('#join_pwd').val() != $('#pwdchk').val()) {
                        if ($('#pwdchk').val() !== '') {
                           alert("비밀번호가 다릅니다.");
                           $('#join_pwd').empty();

                           document.getElementById("pwdlabel").innerHTML = "<p style='color:red'>비밀번호가 다릅니다</p>";

                        }
                     } else {
                        if ($('#join_pwd').val() != ''
                              && $('#pwdchk').val() != '') {

                           document.getElementById("pwdlabel").innerHTML = "<p style='color:blue'>비밀번호가 같습니다</p>";

                        }
                     }
                  })

      $('#join_user_id')
            .change(
                  function() {
                     document.getElementById("idlabel").innerHTML = "";
                     if ($('#join_user_id').val() === '') { //값이 달라졌는데 빈칸이면
                        document.getElementById("idlabel").innerHTML = "<p style='color:red'>아이디를 입력해주세요.</p>";
                        idchk = 'false';
                     }
                     idchk = 'false'; //아이디 부분의 값이 바뀌면 false로 변경.
                  });

      $('#nickname')
            .change(
                  function() {
                     document.getElementById("nicknamelabel").innerHTML = "";
                     if ($('#nickname').val() === '') { //값이 달라졌는데 빈칸이면
                        document.getElementById("nicknamelabel").innerHTML = "<p style='color:red'>별명을 입력해주세요.</p>";
                        nickchk = 'false';
                     }
                     nickchk = 'false'; //아이디 부분의 값이 바뀌면 false로 변경.
                  });
      $('#email')
            .change(
                  function() {
                     document.getElementById("emaillabel").innerHTML = "";
                     if ($('#email').val() === '') { //값이 달라졌는데 빈칸이면
                        document.getElementById("emaillabel").innerHTML = "<p style='color:red'>이메일을 입력해주세요.</p>";
                        emailchk = 'false';
                     }
                     emailchk = 'false'; //아이디 부분의 값이 바뀌면 false로 변경.
                  });

      var idchk = 'false';
      var nickchk = 'false';
      var emailchk = 'false';
      var rexemail = 'false';

      //아이디 체크.
      $('#idchk').click(function() {
               console.log('eeee')
               $.ajax({
                  url : "idchk",
                  type : "post",
                  data : {
                     id : $('#join_user_id').val()
                  },
                  success : function(data) {
                     if ($('#join_user_id').val() === '') {//빈칸
                        idchk = 'false';
                        document.getElementById("idlabel").innerHTML = "<p style='color:red'>아이디를 입력해주세요</p>";
                        return;
                        }
                     if (data === 1) {
                        idchk = 'false';
                        document.getElementById("idlabel").innerHTML = "<p style='color:red'>사용불가능한 아이디입니다</p>";

                                 } else if (data === 0
                                       && $('join_user_id').val() !== '') {

                                    idchk = 'true';
                                    document
                                          .getElementById("idlabel").innerHTML = "<p style='color:blue'>사용가능한 아이디입니다.</p>";
                                 }
                              },
                              error : function() {
                                 console.log("ajax error");
                              }
                           })

                  })

      ////별명 체크
      $('#nickchk')
            .on(
                  'click',
                  function() {

                     $
                           .ajax({
                              url : "nickchk",
                              type : "post",
                              data : {
                                 nickname : $('#nickname').val()
                              },
                              success : function(data) {
                                 console.log(data);
                                 if ($('#nickname').val() === '') { //빈칸일 때.
                                    nickchk = 'false';
                                    document
                                          .getElementById("nicknamelabel").innerHTML = "<p style='color:red'>별명을 입력해주세요</p>";
                                    return;
                                 } else if (data === 1) {

                                    nickchk = 'false';
                                    document
                                          .getElementById("nicknamelabel").innerHTML = "<p style='color:red'>사용불가능한 별명입니다.</p>";

                                    //$('#send').attr('disabled', 'disabled');
                                 } else if (data === 0) {
                                    nickchk = 'true';
                                    document
                                          .getElementById("nicknamelabel").innerHTML = "<p style='color:blue'>사용가능한 별명입니다.</p>";
                                 }
                              },
                              error : function() {
                                 console.log("ajax error");
                              }
                           })

                  })
      /*참고 : https://myjamong.tistory.com/17*/

      ////이메일 체크
      $('#emailchk')
            .on(
                  'click',
                  function() {

                     $
                           .ajax({
                              url : "emailchk",
                              type : "post",
                              data : {
                                 email : $('#email').val()
                              },
                              success : function(data) {
                                 console.log(data);
                                 if ($('#email').val() === '') { //빈칸일 때.
                                    emailchk = 'false';
                                    document
                                          .getElementById("emaillabel").innerHTML = "<p style='color:red'>이메일을 입력해주세요</p>";
                                    return;

                                 }
                                 if (data === 1) { //중복된 값이 있을 때.
                                    emailchk = 'false';
                                    document
                                          .getElementById("emaillabel").innerHTML = "<p style='color:red'>사용불가능한 이메일입니다.</p>";
                                    return;

                                 } else if (data === 0
                                       && rexemail === 'true') { //중복된 값이 없고, 정규식만족
                                    emailchk = 'true';
                                    document
                                          .getElementById("emaillabel").innerHTML = "<p style='color:blue'>사용가능한 이메일입니다.</p>";
                                    return;

                                 } else if (data === 0
                                       && rexemail === 'false') { //중복되는 값이 없지만, 정규식이 맞지 않을 때.
                                    emailchk = 'false';
                                    document
                                          .getElementById("emaillabel").innerHTML = "<p style='color:red'>이메일 형식을 맞춰주세요.</p>";
                                    return;

                                 }

                              },
                              error : function() {
                                 console.log("ajax error");
                              }
                           })

                  })


       //step1~7 전송
      //전송할 때, 중복체크 여부 확인
      function memberjoin(){
          if (idchk === 'false') {
               alert("아이디 중복체크를 해주세요");
            } else if (nickchk === 'false') {
               alert("별명 중복체크를 해주세요");
            } else if (emailchk === 'false') {
               alert('이메일 중복체크를 해주세요');
            } else if (rexemail === 'false') {
               alert('이메일 형식을 확인해주세요');
            } else if ($("#form_dt").datepicker("getDate") === null) {
               alert("날짜를 입력해주세요");
            }else if (imgchk === 'false'){
               alert("프로필사진을 얼굴로 설정해주세요");
            } else if (nickchk === 'true' && idchk === 'true'&& rexemail === 'true' && emailchk === 'true' && imgchk === 'true'
                  && $("#form_dt").datepicker("getDate") !== null) 
            {               
               $('form')[0].submit();
               
            }
      }

      //로그인
      $('#login_submit').on('click', function() {
         $('#logindo').submit();
      })

      var rexemail = 'false';

      function rexEmail() {
         var email = $("#email").val();

         var rex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
         // 이메일 정규식

         if (rex.test(email)) {
            rexemail = 'true';
         } else {
            rexemail = 'false';
         }
      }

      //파일
      $("#file").change(
            function() {
               if (this.files && this.files[0]) {
                  var reader = new FileReader;
                  reader.onload = function(data) {
                     $("#profileimg").attr("src", data.target.result)
                           .width(250);
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
<!--    <script src="resources/vendor/bootstrap/js/popper.js"></script> -->
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