<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/css/viewsaju3.css">
<link rel="stylesheet" href="resources/css/checkbox.css">
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
<c:set var="tf" value="true"/>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<!-- �̵��� -->

<div id="colorlib-main">
   <section class="ftco-section" style="background-image: url(resources/img/headerimg.png); height:5em">
      <div class="container">
         <div class="row no-gutters slider-text justify-content-center align-items-center">
            <div class="col-md-12 ftco-animate text-center">
               <h1 class="bread" style="color:white;"><b>������ �ο� ��õ�ޱ�</b></h1>
            </div>
         </div>
      </div>
   </section>
   <section class="ftco-section contact-section">   
      <div class="container ">
         <div class="row ">
            <div class="col-xs-12 col-sm-6 col-md-12" style="text-align: center;">
                     <div class="single-team">
                         <div class="explain">
                            <h3> ${sessionScope.name }�԰� 90�� �̻��� �ο��� ${over90 }% �ֽ��ϴ�.
                            </h3><br>
                     <img src="images/setting.png" id="set" style="cursor: pointer;" data-toggle="tooltip" data-placement="top" title="����">
                         </div>
                     </div>
                     <!-- üũ�ڽ� -->
               <div class="col-md-12" id="checkset" style="border: 1px solid #240B3B; margin-bottom: 30px; padding: 30px; display:none;">
                  <form action="listchk" class="detailck" method="post">
                  <div class="boxes" style="padding-bottom: 30px;">
                  <!-- ���� üũ �ڽ� -->
                    <div style="float: left; margin-right: 100px;">���� </div>
                    <input type="checkbox" id="box-1" class="chk" name="sex" value="m"<c:if test="${set.sex =='m' ||set.sex == null }">checked</c:if>>
                    <label for="box-1">����</label>
                    
                    <input type="checkbox" id="box-2" class="chk" name="sex" value="f" <c:if test="${set.sex =='f'||set.sex == null}">checked</c:if>>
                    <label for="box-2">����</label>
                     
                    <input type="checkbox" id="box-3" name="sex" value="a" <c:if test="${set.sex == null}">checked</c:if>>
                    <label for="box-3">��ü</label>
                    
                  </div>
                  <hr>
                  <!-- ����, MBTI ���� üũ�ڽ� -->
                    <div class="boxes2" style="padding-bottom: 30px;">
                       <div style="float: left; margin-right: 100px;">���� </div>
                       <input type="checkbox" id="box2-1" class="chk2" name="samb" value="saju"<c:if test="${set.samb != 'mbti'}">checked</c:if>>
                       <label for="box2-1">����</label>
                       
                       <input type="checkbox" id="box2-2" class="chk2" name="samb" value="mbti"<c:if test="${set.samb != 'saju'}">checked</c:if>>
                       <label for="box2-2">MBTI</label>
                        
                       <input type="checkbox" id="box2-3" name="samb" value="all"<c:if test="${set.samb !='saju' && set.samb !='mbti'}">checked</c:if>>
                       <label for="box2-3">���� + MBTI</label>
                    </div>
                  <div>
                  <c:choose>
                  <c:when test="${num >= paymember }">
                  <input type="button" value="����" style="float: right;" onclick="nextProfile()">                  
                  </c:when>
                  <c:otherwise>
                  <input type="submit" value="����" style="float: right;">
                  </c:otherwise>
                  </c:choose>
                  </div>
                  </form>
               </div>
               <!-- üũ�ڽ� �� -->
                   <br>
                 </div>
         </div>
        </div>
        <div class="container">
         <div class="row">
            
              <div class="col-xs-12 col-sm-6 col-md-12" style="text-align: center;">
                     <div class="" style="border:1px solid #D8D8D8; height:435px">
                         <div class="explain">
                            <div class="col-xs-4 col-sm-4 col-md-4" style="text-align: center; float: left">
                              <div class="single-team">
                                  <div style="height:395px">
                                <div class="col-md-12 col-sm-12" style="margin-top:10%; margin-left: 0 auto; margin-right: 0 auto;">
                                   <canvas id="radar-chart" width="800" height="600"></canvas>
                                 <!--��Ʈ url   https://www.chartjs.org/docs/latest/charts/radar.html -->
                                </div>
                                <!-- mbti �� ���� ��� -->
                                <div style="position: fixed; bottom: 25px;">
                                   <div class="team-photo">
                                    <div class="col-md-6 text-center" style="float:left;" data-toggle="tooltip" data-placement="top" title="���� ������">
                                       <img class="img-fluid center-block" src="resources/img/ilju_animal/${ilju.RESULT_IMG }.png" alt="iljuanimal"
                                        style="width:50%; cursor: pointer;" onclick="saju()" data-target="#modalall" data-toggle="modal">
                                       <h5 style=" font-size:1rem"><b> ${ilju.ILJU }����</b></h5>
                                    </div>
                                    <div class="col-md-6 text-center" style="float:left;" data-toggle="tooltip" data-placement="top" title="mbti ������">
                                       <img class="img-fluid center-block" src="resources/img/mbti_img/${mbti.MBTI_IMG }.png" alt="mbti_img" 
                                       style="width:50%; cursor: pointer;" onclick="mbti()" data-target="#modalall" data-toggle="modal">
                                    </div>
                                   </div>
                                </div>
                                <!-- mbti �� ���� ��� �� -->
                                 </div>
                              </div>
                          </div>
                          <!-- ��õ�� �� -->
                          <div class="col-xs-4 col-sm-4 col-md-4" style="text-align: center; float: left">
                              <div class="single-team">
                                 <div style="height:430px">
                                  <img class="center-block" src="resources/upload/${profile.USER_IMG }" alt="profile_photo" style="height:100%; width:100%">
                           </div>
                        </div>
                          </div>
                          <!-- ��õ�� �� �� -->
                          
                          
                          <!-- ��õ�� ���� �� ��ư(���ƿ�, �����ʺ���, ä���ϱ�, ����ϱ�) -->
                          <div class="col-xs-4 col-sm-4 col-md-4" style="text-align: center; float: left">
                              <div class="single-team">
                                 <div style="height:430px; padding-top: 10%;">
                                     <h3> ${profile.NICKNAME }</h3>
                                     <!-- Ȱ���� -->
                                     <img style="height: 30px;;" src="images/offline_big.png" id="indicator" class="indicator">
                                      <p>${profile.BIRTH }</p><br>
                                     <h5> ${profile.USER_INTRO }</h5>
                                     
                                     <!-- ��ư ���� -->
                                     <div style="position:fixed; bottom: 25px;">

                                 <!-- ��� �߰� ���� -->                                        
                                        <c:set var="blockox" value="false"/>
                                 <c:forEach var="g" items="${set.blist }">
                                    <c:choose>
                                       <c:when test="${g == profile.USER_NUM}">
                                          <c:set var="blockox" value="true"/>
                                       </c:when>                                       
                                    </c:choose>
                                 </c:forEach>
                                        
                                 <c:choose>
                                    <c:when test="${blockox == 'true'}">
                                       <img id="${profile.USER_NUM}" class="blockox" style="width:15%; cursor: pointer;" 
                                       src="resources/img/btn/like.png" data-toggle="tooltip" data-placement="top" title="��õ ���� ���"/>
                                    </c:when>
                                    <c:otherwise>
                                       <img id="${profile.USER_NUM}" class="blockox" style="width: 15%; cursor:pointer;" 
                                       src="resources/img/btn/dislike.png" data-toggle="tooltip" data-placement="top" title="��õ���� ����"/>                                    
                                    </c:otherwise>
                                 </c:choose>
                                        <!-- ��� �߰� ���� �� -->
                                        
                                        <!-- ������ �̵� ���� -->
                                        <img src="resources/img/btn/profile.png" style="width:15%; cursor: pointer;" onclick="profile()"
                                        data-toggle="tooltip" data-placement="top" title="�� ������ ����">
                                 <!-- ������ �̵� �� -->
                                        
                                        <img src="resources/img/btn/chat.png" style="width:15%; cursor: pointer;" onclick="chatting()"
                                        data-toggle="tooltip" data-placement="top" title="ä���ϱ�">

                                   <!-- ���ƿ� ��ư ���� -->
                                   <c:set var="hearton" value="false"/>
                                 <c:forEach var="g" items="${heart }">
                                    <c:choose>
                                       <c:when test="${g.liked_user == profile.USER_NUM}">
                                          <c:set var="hearton" value="true"/>
                                       </c:when>                                       
                                    </c:choose>
                                 </c:forEach>
                                 <c:choose>
                                    <c:when test="${hearton == 'true'}">
                                       <img id="${profile.USER_NUM}" class="heart" style="width: 15%; cursor:pointer;" 
                                       src="resources/img/btn/hearton.png" data-toggle="tooltip" data-placement="top" title="���ƿ� ���"/>
                                    </c:when>
                                    <c:otherwise>
                                       <img id="${profile.USER_NUM}" class="heart" style="width: 15%; cursor:pointer;" 
                                       src="resources/img/btn/heartoff.png" data-toggle="tooltip" data-placement="top" title="���ƿ�"/>                                    
                                    </c:otherwise>
                                 </c:choose>
                                 <!-- ���ƿ� ��ư �� -->
                                     </div>
                                     <!-- ��ư ���� �� -->
                                 </div>
                             </div>
                          </div>
                          <!-- ��õ�� ���� �� ��ư �� -->
                            <br>
                         </div>
                     </div>
                   <br>
                 </div>
                 <!-- ���� ������ �� ���� ������ -->
                 <div class="col-xs-4 col-sm-4 col-md-12" style="text-align: center;">
                   <c:if test="${num != 1 }">
               <img src="resources/img/btn/back.png" style="width:5em; float: left; cursor: pointer;" onclick="prevProfile()">
                </c:if>
                <img src="resources/img/btn/forword.png" style="width:5em; float: right; cursor: pointer;" onclick="nextProfile()">
             </div>
             <!-- ���� ������ �� ���� ������ �� -->
         </div>
        </div>         
   </section>
   

   <form action="friend" method="post" id="profile">
      <input type="hidden" name="user_num" id="user_num" value="${profile.USER_NUM }">
   </form>
   
   <form action="listWhole" method="post" id="prevProfile">
      <input type="hidden" name="num" value="${num -1 }">
      <input type="hidden" name="sex" value="${set.sex }">
      <input type="hidden" name="samb" value="${set.samb }">
   </form>
   
   <form action="listWhole" method="post" id="nextProfile">
      <input type="hidden" id="num" name="num" value="${num +1 }">
      <input type="hidden" name="sex" value="${set.sex }">
      <input type="hidden" name="samb" value="${set.samb }">
   </form>
   
   <!-- Modal -->
   <div class="modal fade" id="modalall" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-dialog-scrollable" role="document" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
       <div class="modal-content">
       </div>
     </div>
   </div>
   
   <form action="chatting" id="chatting">
      <div class="modal" tabindex="-1" role="dialog" id="modal">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">����Ȯ��</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p>ä�ñ��� �����˴ϴ�. ä�ý�û�� �Ͻðڽ��ϱ�?</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="close_pop()">���</button>
              <button type="button" class="btn btn-primary" id="chatOn">Ȯ��</button>
            </div>
          </div>
        </div>
      </div>
   </form>

   <script>
      //    ��Ʈ
      new Chart(document.getElementById("radar-chart"), {
          type: 'radar',
          data: {
            labels: ["����", "MBTI", "Ű", "����"],
            datasets: [
              {
                label: "2050",
                fill: true,
                backgroundColor: "rgba(255,99,132,0.2)",
                borderColor: "rgba(255,99,132,1)",
                pointBorderColor: "#fff",
                pointBackgroundColor: "rgba(255,99,132,1)",
                pointBorderColor: "#fff",
                data: [100,100,90,0]
              }
            ]
          },
          options: {
            title: {
              display: true,
              text: '���� ����'
            }
          }
      });
   </script>
   
   <script>   
      //��Ʈ ������ ��, ��Ʈ on/off ��� ��ȭ      
      $(document).on('click', '.heart', function(event) { 
             var like = 'false';
              var user_num = ${sessionScope.user_num};
               
               if ($(this).attr("src") === "resources/img/btn/hearton.png") {
   
                  $(this).attr("src", "resources/img/btn/heartoff.png"); //��Ʈ ����
                  $(this).attr('data-original-title', '���ƿ�').tooltip('show');
                  like='false';
                  
                } else if($(this).attr("src") === "resources/img/btn/heartoff.png") {
                
                   $(this).attr("src", "resources/img/btn/hearton.png"); //��Ʈ ä��
                   $(this).attr('data-original-title', '���ƿ� ���').tooltip('show')
                   like='true';
                }
               var param = {"like" : like, "liked_user" : $(this).attr("id"), "user_num": user_num};
   
               ajax(param);
            
         });
      
       //���ƿ� ���� �� �޾ƿͼ� ����   
       function ajax(param){
         $.ajax({
               url : "likeox",
               type : "post",
               data : param,
               success : function(data){
                  
               },
               error : function(){
                  
               }
            });
         }
   </script>
   
   <script>
      $(document).on('click', '.blockox', function(event) {
         
         var block = 'false';
         
         var blockon = "resources/img/btn/dislike.png"; //��� �ϱ�
         var blockoff = "resources/img/btn/like.png"; //��� ����
         
         var user_num = ${sessionScope.user_num};
         
         if ($(this).attr("src") === blockon) {
               $(this).attr("src", "resources/img/btn/like.png"); //������
               $(this).attr('data-original-title', '��õ ���� ���').tooltip('show')
               block='true';
         } else if($(this).attr("src") === blockoff){
               $(this).attr("src", "resources/img/btn/dislike.png"); //���
               $(this).attr('data-original-title', '��õ���� ����').tooltip('show')
               block='false';
         }
         
         var pm = {"block" : block, "blocked_user" : $('#user_num').val()};
         
         blocked(pm);
   
      });
      
      function blocked(pm){
               
         $.ajax({
               url : "blockox",
               type : "post",
               data : pm,
               success : function(data){
               },
               error : function(request, error){
                  console.log("code:"+request.status+"\n"+"message:"+request.responsetext+"\n"+"error:"+error);
               }
            });
      }
   </script>
   
   <script>
      //�� �����ʷ� �̵� �� �Ķ���Ͱ� controller�� �ѱ�
      function profile() {
         $("#profile").submit();
      };
      
      //ä��.
      function chatting(){
          $('#modal').show();
      }
      function close_pop(flag) {
            $('#modal').hide();
       };
       $('#chatOn').click(function(){
    	   var user1 = ${sessionScope.user_num};
			$.ajax({
				type : "POST",
				url : "chRequest",
				data : "user1="+user1,
				//���� ��û ������ ������ ��� �Ǵ� �Լ�
/* 				beforeSend : function(xmlHttpRequest){
	                xmlHttpRequest.setRequestHeader("AJAX", "true"); // ajax ȣ����  header�� ���
	            }, */
				success : function(res){
					alert("���濡�� ä�ý�û�Ͽ����ϴ�. ���� ������ ä�ù��� �����˴ϴ�.");
				},
				error : function(request,status,error){
					console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});
          document.location.href = document.location.href;
       })
  
      
   </script>
   
   <script>
      // üũ�ڽ� �����̵� ���
      $(document).on('click', '#set', function(event) {
         $("#checkset").slideToggle(); 
      });
   </script>
   
   <script>
      //üũ�ڽ� ��ü���� �� ��ü����(����)
      $(document).on('click', '#box-3', function(event) {
      
          if($("#box-3").is(":checked")){
              $(".chk").prop("checked", true);
          }
          else{
              $(".chk").prop("checked", false);
          }
      });
      
      // üũ�ڽ� ��ü���� �� ��ü ����(����) -->
      $(document).on('click', '#box2-3', function(event) {
      
          if($("#box2-3").is(":checked")){
              $(".chk2").prop("checked", true);
          }
          else{
              $(".chk2").prop("checked", false);
          }
      });
      
          
      // �Ѱ��� üũ�ڽ� ���� ������ ��ü���� üũ�ڽ��� ����(����)
      $(document).on('click', '.chk', function(event) {
          if($("input[class='chk']:checked").length == 2){
              $("#box-3").prop("checked", true);
          }else{
              $("#box-3").prop("checked", false);
          }
      });
      
      // �Ѱ��� üũ�ڽ� ���� ������ ��ü���� üũ�ڽ��� ����(����)
      $(document).on('click', '.chk2', function(event) {
          if($("input[class='chk2']:checked").length == 2){
              $("#box2-3").prop("checked", true);
          }else{
              $("#box2-3").prop("checked", false);
          }
      });
      
   </script>
   
   <script>
      //���� & MBTI ��ޱ���
      function saju() {
         var url = 'sajumodal?user_num='+$('#user_num').val();
         //alert(url);
         $('#modalall .modal-content').load(url);         
          $('#modalall').modal('show');
      }
      
      function mbti() {
         var url = 'mbtimodal?user_num='+$('#user_num').val();
         $('#modalall .modal-content').load(url);
          $('#modalall').modal('show');
      }
   </script>
   
   <script>
      //���������� �̵�
      function prevProfile() {
         $("#prevProfile").submit();
      }
      
      //���������� �̵�
      function nextProfile() {
         //alert($("#num").val());
         var paymember= ${paymember};
         if ($("#num").val() > paymember) {
            alert("���� �� �� �ִ� �ο��� ���� �����߽��ϴ�.");
         }else {
            $("#nextProfile").submit();
         }
         
      }
   </script>
   
   <script>
      //tooltip ��� ����
      $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();   
      });
   </script>

<%@ include file="footer.jsp"%>