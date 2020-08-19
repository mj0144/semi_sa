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
            <span class="login100-form-title p-b-49"> ȸ������ ���� </span>             

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
            onclick="document.getElementById('file').click()">�����߰�</div>      
            <button type="button" class="btn btn-outline-dark"
                                                id="imgchk">���Ȯ��</button>
                                                <br><label id="imglabel"></label>
      </div>
      <!-- Select Basic -->
      <div class="form-group">
        <label class="col-md-4" for="selectbasic">�̸�</label>
        <div class="col-md-4">
          <input placeholder="�̸�" type="text"
            required="required" name="name" id="name" onchange="namechange()"
            value=${vo.NAME }><label id="namelabel"></label>
        </div>
      </div>
      
      <!-- Select Basic -->
      <div class="form-group">
        <label class="col-md-4" for="selectbasic">*����</label>
        <div class="col-md-4">
          <input placeholder="����" type="text"
            name="nickname" id="nickname" value="${vo.NICKNAME }"
            onchange="nickchange()"> <p id="nicklabel" style='color:white'>�ߺ�Ȯ���� ���ּ���</p>
        </div>
        <div class="col-md-4">
           <button type="button" class="btn btn-primary" id="nickchk">�ߺ�Ȯ��</button>
        </div>
      </div>
      
      <!-- Select Basic -->
      <div class="form-group">
        <label class="col-md-4 " for="selectbasic">*�̸���</label>
        <div class="col-md-4">
          <input placeholder="�̸���" type="email"
                                       name="email" id="email" value="${vo.EMAIL }"
                                       onchange="emailchange()"> <p id="emaillabel" style='color:white'>�ߺ�Ȯ���� ���ּ���</p>
        </div>
        <div class="col-md-4">
        <button type="button" class="btn btn-primary" id="emailchk">�ߺ�Ȯ��</button>
        </div>
      </div>
      
      <!-- Select Basic -->
      <div class="form-group">
        <label class="col-md-4 " for="selectbasic">*����</label>
        <div class="col-md-4">
          <c:choose>
            <c:when test="${vo.SEX eq 'm'}">
               <input  type="radio" name="sex" value="m" checked>
                  <label>����</label>
                     &nbsp;&nbsp;&nbsp;
                     <input type="radio" name="sex" value="f">
                  <label>����</label>
            </c:when>
            <c:otherwise>
               <input type="radio" name="sex" value="m">
               <label>����</label>
                  <input type="radio" name="sex" value="f"checked>
               <label>����</label>
            </c:otherwise>
         </c:choose>
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-md-4 " for="radios">*��/����</label>
        <div class="col-md-12" style="width:200px"> 
           <input type="radio" name="calendar" value="solar" checked> 
            <label>���</label> 
&nbsp;&nbsp;&nbsp;

         <input type="radio" name="calendar" value="lunar">
            <label>����</label>
         </div>
      </div>
      
      <!-- Select Basic -->
      <div class="form-group">
        <label class="col-md-4 " for="selectbasic">*�������</label>
        <div class="col-md-4">
          <c:set var="date" value="${vo.BIRTH }"/>
            &nbsp;<input name="birth" type="text"
               style="text-decoration: none; width: 100px" id="form_dt" size="5" value="">
        </div>
      </div>
      
      <div class="form-group">
       <label class="col-md-4 " for="radios">�¾��</label>
           <div class="col-md-4"> 
             <select name="birth_hh">
               <c:forEach begin="0" step="1" end="23" var="i">
                  <option value="${i }">${i }��</option>
               </c:forEach>
         
            </select>
            <select name="birth_mm" id="birth_mm">
               <c:forEach begin="0" step="1" end="59" var="i">
                  <option value="${i }">${i}��</option>
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
        <label class="col-md-4 " for="selectbasic">���� Ű</label>
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
        <label class="col-md-4 " for="selectbasic">�������</label>
        <div class="col-md-4">
          <select id="user_loc" name="user_loc" class="w3-select" style="width:100px; height:30px">
            <option value="����Ư����">����Ư����</option>
            <option value="��⵵">��⵵</option>
            <option value="������">������</option>
            <option value="��󳲵�">��󳲵�</option>
            <option value="���ϵ�">���ϵ�</option>
            <option value="��û����">��û����</option>
            <option value="��û�ϵ�">��û�ϵ�</option>
            <option value="���󳲵�">���󳲵�</option>
            <option value="����ϵ�">����ϵ�</option>
            <option value="���ֵ�">���ֵ�</option>
            <option value="��Ÿ">��Ÿ</option>
         </select>
        </div>
      </div>
      <!-- Select Basic -->
      <div class="form-group">
        <label class="col-md-4 " for="selectbasic">���� ������</label>
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
        <label class="col-md-4 " for="selectbasic">�̻��� Ű</label>
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
        <label class="col-md-4 " for="selectbasic">�̻��� ������</label>
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
        <label class="col-md-4 " for="selectbasic">�̻��� ����</label>
        <div class="col-md-4">
          <select id="ideal_age" name="idealvo.ideal_age">
            <c:forEach begin="10" step="1" end="100" var="i">
               <option value="${i }">${i }</option>
            </c:forEach>
         </select>
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-md-4 " for="selectbasic">�ڱ�Ұ�</label>
        <div class="col-md-4">


            <textarea name="user_intro" id="user_intro" cols="50"
            rows="10" class="form-control" placeholder="�ڱ�Ұ��� �Է����ּ���">${vo.USER_INFO }</textarea>
         </div>
      </div>
      <input type="hidden" name="idealvo.user_num" value="${sessionScope.user_num }"/>
      
      
      
      <!-- Button -->
      <div class="form-group">
        <div class="col-md-4">
          <button class="btn btn-primary" type
          ="button" id="send" style="text-align: center">����</button>

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
   /*�⺻�� ����*/
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
   
   <!-- ���������� img ��������ƴ��� üũ -->
   
   
   <script>
   
   
   var imgchk = 'false';
   //�����ʻ��� üũ.
   $('#imgchk').click(function() {
      //console.log('imgimgŬ���Ǿ���?')
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
               document.getElementById("imglabel").innerHTML = "<p style='color:red'>�󱼻����� �־��ּ���</p>";
               }else {
                  imgchk = 'true';
                  document.getElementById("imglabel").innerHTML = "<p style='color:green'>�󱼻��� �Դϴ�.</p>";
               }   
            },
         error : function(request, status, error) {
            alert("code = " + request.status + " message = "
                  + request.responseText + " error = " + error); // ���� �� ó��
            }
         }) 

      })
   
   
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
         $('#nicklabel').attr('style', 'color:white')

         if ($('#nickname').val() === nickname) {
            nickchk = 'true';
         } else if($('#nickname').val() !== nickname || $('#nickname').val() === ''){ //���� �޶����µ� ��ĭ�̸�
            
            $('#nicklabel').attr('style', 'color:red')
            nickchk = 'false';
         }

      }
      //�̸���
      function emailchange() {

         $('#emaillabel').attr('style', 'color:white')
         if ($('#email').val() === email) {
            console.log("��");
            emailchk = 'true';
         } else if($('#email').val() !== email && $('#email').val() === ''){
            $('#emaillabel').attr('style', 'color:red')
            emailchk = 'false';
         }
         rexEmail(); //���Խ� üũ.

      }
      //�̸�
      function namechange(){
         $('#namelabel').attr('style', 'color:white')
         if($('#name').val() === ''){
            namechk='false';
            $('#namelabel').attr('style', 'color:red')
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
                              success : function(data) {   //data==1 : �ߺ��Ǵ� ���� ����. data==0: �ߺ��Ǵ� ���� ����.
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
         if (nickchk==='true' && idchk==='true' && rexemail==='true' && namechk==='true' && imgchk === 'true') {   //��� üũ�� �Ϸ�� submit;         
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
            
         }else if(imgchk === 'false'){
             alert("�����ʻ����� �󱼷� �������ּ���");
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