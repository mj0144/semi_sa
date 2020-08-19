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
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

</head>
<body>
   <div class="limiter">
      <div class="container-login100">
         <div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54 borderrr">
            <span class="login100-form-title p-b-49"> 회원정보 수정 </span>             

             <div class="profile_base" style="width: 400px; text-align: center;">
               
                  <img class="profile_base" style="width: 120px;"
                     id="profileimg" name="profileimg" src="resources/upload/${sessionScope.user_img }">
                
            </div> 
            <br>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

   <form class="form-horizontal" method="post"
               enctype="multipart/form-data" action="userInfoChange" id="form" style="width:480px">
      <fieldset>
      
      
      <!-- Form Name -->
      <div class="form-group" style="text-align: center; width:400px;">
         <input type="file" id="file" name="file" style="display:none;" accept=".jpg,.jpeg,.png,.gif,.PNG">
         <div id="file_upload" style=""class="btn btn-outline-dark " 
            onclick="document.getElementById('file').click()">사진추가</div>      
      </div>
      <!-- Select Basic -->
      <div class="form-group">
        <label class="col-md-4" for="selectbasic">이름</label>
        <div class="col-md-4">
          <input placeholder="이름" type="text"
            required="required" name="name" id="name" onchange="namechange()"
            value=${vo.NAME }><label id="namelabel"></label>
        </div>
      </div>
      
      <!-- Select Basic -->
      <div class="form-group">
        <label class="col-md-4" for="selectbasic">*별명</label>
        <div class="col-md-4">
          <input placeholder="별명" type="text"
            name="nickname" id="nickname" value="${vo.NICKNAME }"
            onchange="nickchange()"> <p id="nicklabel" style='color:white'>중복확인을 해주세요</p>
        </div>
        <div class="col-md-4">
           <button type="button" class="btn btn-primary" id="nickchk">중복확인</button>
        </div>
      </div>
      
      <!-- Select Basic -->
      <div class="form-group">
        <label class="col-md-4 " for="selectbasic">*이메일</label>
        <div class="col-md-4">
          <input placeholder="이메일" type="email"
                                       name="email" id="email" value="${vo.EMAIL }"
                                       onchange="emailchange()"> <p id="emaillabel" style='color:white'>중복확인을 해주세요</p>
        </div>
        <div class="col-md-4">
        <button type="button" class="btn btn-primary" id="emailchk">중복확인</button>
        </div>
      </div>
      
      <!-- Select Basic -->
      <div class="form-group">
        <label class="col-md-4 " for="selectbasic">*성별</label>
        <div class="col-md-4">
          <c:choose>
            <c:when test="${vo.SEX eq 'm'}">
               <input  type="radio" name="sex" value="m" checked>
                  <label>남자</label>
                     &nbsp;&nbsp;&nbsp;
                     <input type="radio" name="sex" value="f">
                  <label>여자</label>
            </c:when>
            <c:otherwise>
               <input type="radio" name="sex" value="m">
               <label>남자</label>
                  <input type="radio" name="sex" value="f"checked>
               <label>여자</label>
            </c:otherwise>
         </c:choose>
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-md-4 " for="radios">*양/음력</label>
        <div class="col-md-12" style="width:200px"> 
           <input type="radio" name="calendar" value="solar" checked> 
            <label>양력</label> 
&nbsp;&nbsp;&nbsp;

         <input type="radio" name="calendar" value="lunar">
            <label>음력</label>
         </div>
      </div>
      
      <!-- Select Basic -->
      <div class="form-group">
        <label class="col-md-4 " for="selectbasic">*생년월일</label>
        <div class="col-md-4">
          <c:set var="date" value="${vo.BIRTH }"/>
            &nbsp;<input name="birth" type="text"
               style="text-decoration: none; width: 100px" id="form_dt" size="5" value="">
        </div>
      </div>
      
      <div class="form-group">
       <label class="col-md-4 " for="radios">태어난시</label>
           <div class="col-md-4"> 
             <select name="birth_hh">
               <c:forEach begin="0" step="1" end="23" var="i">
                  <option value="${i }">${i }시</option>
               </c:forEach>
         
            </select>
            <select name="birth_mm" id="birth_mm">
               <c:forEach begin="0" step="1" end="59" var="i">
                  <option value="${i }">${i}분</option>
               </c:forEach>      
            </select>
         </div>
      </div>
      
      
      
      <div class="form-group">
       <label class="col-md-4 " for="radios">MBTI</label>
       
       <div class="col-md-4" style="float: none; margin: 0 auto;">
         <select id="user_mbti" name="user_mbti" class="w3-select">
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
      
      
      
      
      <!-- Select Basic -->
      <div class="form-group">
        <label class="col-md-4 " for="selectbasic">나의 키</label>
        <div class="col-md-4">
          <select id="user_height" name="user_height" class="w3-select" style="width:100px; height:30px">
                                    <c:forEach begin="140" step="1" end="200" var="i">
                                       <option value="${i }">${i }</option>
                                    </c:forEach>
                                                
                                 </select>
        </div>
      </div>
      
      <!-- Select Basic -->
      <div class="form-group">
        <label class="col-md-4 " for="selectbasic">사는지역</label>
        <div class="col-md-4">
          <select id="user_loc" name="user_loc" class="w3-select" style="width:100px; height:30px">
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
      <!-- Select Basic -->
      <div class="form-group">
        <label class="col-md-4 " for="selectbasic">나의 몸무게</label>
        <div class="col-md-4">
          <select id="user_body" name="user_body" class="w3-select" style="width:100px; height:30px">
             <c:forEach begin="30" step="1" end="150" var="i">
               <option value="${i }">${i }</option>
            </c:forEach>  
         </select>
        </div>
      </div>
      <!-- Select Basic -->
      <div class="form-group">
        <label class="col-md-4 " for="selectbasic">이상형 키</label>
        <div class="col-md-4">
          <select id="ideal_height" name="idealvo.ideal_height" class="w3-select" style="width:100px; height:30px">
            <c:forEach begin="140" step="1" end="200" var="i">
               <option value="${i }">${i }</option>
            </c:forEach>                                                
         </select>
        </div>
      </div>
      <!-- Select Basic -->
      <div class="form-group">
        <label class="col-md-4 " for="selectbasic">이상형 몸무게</label>
        <div class="col-md-4">
          <select id="ideal_body" name="idealvo.ideal_body"
         class="w3-select" style="width:100px; height:30px">
             <c:forEach begin="30" step="1" end="150" var="i">
               <option value="${i }">${i }</option>
            </c:forEach>    
         </select>
        </div>
      </div>
      <!-- Select Basic -->
      <div class="form-group">
        <label class="col-md-4 " for="selectbasic">이상형 나이</label>
        <div class="col-md-4">
          <select id="ideal_age" name="idealvo.ideal_age">
            <c:forEach begin="10" step="1" end="100" var="i">
               <option value="${i }">${i }</option>
            </c:forEach>
         </select>
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-md-4 " for="selectbasic">자기소개</label>
        <div class="col-md-4">


            <textarea name="user_intro" id="user_intro" cols="50"
            rows="10" class="form-control" placeholder="자기소개를 입력해주세요">${vo.USER_INFO }</textarea>
         </div>
      </div>
      <input type="hidden" name="idealvo.user_num" value="${sessionScope.user_num }"/>
      
      
      
      <!-- Button -->
      <div class="form-group">
        <div class="col-md-4">
          <button class="btn btn-primary" type
          ="button" id="send" style="text-align: center">수정</button>

          <button class="btn btn-primary" onclick="location.href='mypage'" style="text-align: center">Cancel</button>
        </div>
        
      </div>
      
      </fieldset>
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
$(function(){
   /*기본값 설정*/
   var birth_mm = ${vo.BIRTH_MM}
   var birth_hh = ${vo.BIRTH_HH}
   var user_height = ${vo.USER_HEIGHT}
   var user_loc = '${vo.USER_LOC}'
   var user_body = '${vo.USER_BODY}'
   var ideal_height= ${vo.IDEAL_HEIGHT}
   var ideal_body= '${vo.IDEAL_BODY}'
   var ideal_age = ${vo.IDEAL_AGE}
   var user_mbti= '${vo.USER_MBTI}'
   
   $('#birth_mm option').eq(birth_mm).attr('selected', 'selected');
   
   $('#birth_hh option').eq(birth_hh).attr('selected', 'selected');
   
   $('#user_height option').val(user_height).attr('selected', 'selected');
   $('#user_loc option').val(user_loc).attr('selected', 'selected');
   $('#user_body option').val(user_body).attr('selected', 'selected');
   $('#ideal_height option').val(ideal_height).attr('selected', 'selected');
   $('#ideal_body option').val(ideal_body).attr('selected', 'selected');
   $('#ideal_age option').val(ideal_age).attr('selected', 'selected');
   $('#user_mbti option').val(user_mbti).attr('selected', 'selected');
   
   
   
   
})
   
   
</script>

   <script>
      $(document)
            .ready(
                  function() {
                     var date =new Date('${date} 0:0:0');
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
                        showOn: "button", //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시     
                         buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif", //버튼 이미지 경로
                        buttonImageOnly: true, //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                        buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트      

                     };

                     $("#form_dt").datepicker(clareCalendar);
                     //$("#toDt").datepicker(clareCalendar);
                     $("#form_dt").datepicker('setDate', date);

                     $("#ui-datepicker-div").hide(); //자동으로 생성되는 div객체 숨김 
                     $("#form_dt").datepicker("getDate"); //현재 선택되어 있는 날짜 가져오기 (Date 형으로 반환)

                  });
   </script>
   <script>
   //이미지 미리보기.
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
       처리해야할것.
       1. 중복체크를 했는지
       1-1 했으면 그게 통과했는지
       2. 비밀번호와 비밀번호 확인이 맞는지.
       3. 별명이 중복체크 했는지.
       3-1 했으면 그게 통과했는지      
       */
      var nickchk = 'true';
      var idchk='true';
      var emailchk = 'true';
      var namechk = 'true';
      var nickname = $('#nickname').val(); //별명 원래 값.
      var email = $('#email').val(); //이메일 원래 값.
      var rexemail='true';


      //값이 달라졌을 때, 중복체크하게. && 값이 없을때.
      //별명
      function nickchange() {
         $('#nicklabel').attr('style', 'color:white')

         if ($('#nickname').val() === nickname) {
            nickchk = 'true';
         } else if($('#nickname').val() !== nickname || $('#nickname').val() === ''){ //값이 달라졌는데 빈칸이면
            
            $('#nicklabel').attr('style', 'color:red')
            nickchk = 'false';
         }

      }
      //이메일
      function emailchange() {

         $('#emaillabel').attr('style', 'color:white')
         if ($('#email').val() === email) {
            console.log("값");
            emailchk = 'true';
         } else if($('#email').val() !== email && $('#email').val() === ''){
            $('#emaillabel').attr('style', 'color:red')
            emailchk = 'false';
         }
         rexEmail(); //정규식 체크.

      }
      //이름
      function namechange(){
         $('#namelabel').attr('style', 'color:white')
         if($('#name').val() === ''){
            namechk='false';
            $('#namelabel').attr('style', 'color:red')
         }
      }
      
      
      

      ////별명 체크
      $('#nickchk').on('click',function() {
               $.ajax({
                              url : "nickchk",
                              type : "post",
                              data : {
                                 nickname : $('#nickname').val()
                              },
                              success : function(data) {   //data==1 : 중복되는 값이 있음. data==0: 중복되는 값이 없음.
                                 console.log(data);
                                  if($('#nickname').val() === ''){ //빈칸일 때.
                                     nickchk = 'false';
                                    document.getElementById("nicklabel").innerHTML = "<p style='color:red'>별명을 입력해주세요</p>";
                                    return;
                                 } 
                                  else if (data === 1 && $('#nickname').val() !== nickname) { //중복되는 값이 있고, 원래 별명과 값이 달라졌을 때.
                                    nickchk = 'false';
                                    document
                                          .getElementById("nicklabel").innerHTML = "<p style='color:red'>사용불가능한 별명입니다.</p>";

                                 } else if ($('#nickname').val() === nickname) {//값이 중복이 되든 안되든, 원래 별명과 값이 같을 때.
                                    nickchk = 'true';
                                    document
                                          .getElementById("nicklabel").innerHTML = "<p style='color:blue'>사용가능한 별명입니다.</p>";
                                 } else if (data === 0 && $('#nickname').val() !== nickname) { //중복되는 값이 없고, 원래 별명값이랑 다를 때.
                                    nickchk = 'true';
                                    document
                                          .getElementById("nicklabel").innerHTML = "<p style='color:blue'>사용가능한 별명입니다.</p>";
                                 }
                              },
                              error : function() {
                                 console.log("ajax error");
                              }
                           })

                  })

      /*참고 : https://myjamong.tistory.com/17*/

      //이메일 중복체크
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

      $('#send').on('click', function() {
         if (nickchk==='true' && idchk==='true' && rexemail==='true' && namechk==='true') {   //모든 체크가 완료시 submit;         
            $('#form').submit();
         } else if (emailchk === 'false') {
            alert("이메일 중복체크를 해주세요");
            return;
         } else if (nickchk === 'false') {
            alert("별명 중복체크를 해주세요");
            return;
            
         }else if(rexemail==='false'){
            alert('이메일 형식을 확인해주세요');
            return;
            
         }else if(namechk==='false'){
            alert('이름을 입력해주세요');
            return;
            
         }
         
      })
      
      
      
      //이메일 정규식.
      function rexEmail(){
         console.log("정규식 시작")
      
           var email = $("#email").val();
         
           var rex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
           // 이메일 정규식
         
         if(rex.test(email)){
              rexemail='true';
              
           }else {
            rexemail='false';
            document.getElementById("emaillabel").innerHTML = "<p style='color:red'>이메일 형식을 맞춰주세요.</p>";
                 
          }
      }
   
      
      
   </script>



</body>
</html>