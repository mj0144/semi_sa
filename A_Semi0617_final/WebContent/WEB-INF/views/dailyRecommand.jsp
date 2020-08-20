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

<!-- 이동현 -->

<div id="colorlib-main">
   <section class="ftco-section" style="background-image: url(resources/img/headerimg.png); height:5em">
      <div class="container">
         <div class="row no-gutters slider-text justify-content-center align-items-center">
            <div class="col-md-12 ftco-animate text-center">
               <h1 class="bread" style="color:white;"><b>오늘의 인연 추천받기</b></h1>
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
                            <h3> ${sessionScope.name }님과 90점 이상인 인연이 ${over90 }% 있습니다.
                            </h3><br>
                     <img src="images/setting.png" id="set" style="cursor: pointer;" data-toggle="tooltip" data-placement="top" title="설정">
                         </div>
                     </div>
                     <!-- 체크박스 -->
               <div class="col-md-12" id="checkset" style="border: 1px solid #240B3B; margin-bottom: 30px; padding: 30px; display:none;">
                  <form action="listchk" class="detailck" method="post">
                  <div class="boxes" style="padding-bottom: 30px;">
                  <!-- 성별 체크 박스 -->
                    <div style="float: left; margin-right: 100px;">성별 </div>
                    <input type="checkbox" id="box-1" class="chk" name="sex" value="m"<c:if test="${set.sex =='m' ||set.sex == null }">checked</c:if>>
                    <label for="box-1">남자</label>
                    
                    <input type="checkbox" id="box-2" class="chk" name="sex" value="f" <c:if test="${set.sex =='f'||set.sex == null}">checked</c:if>>
                    <label for="box-2">여자</label>
                     
                    <input type="checkbox" id="box-3" name="sex" value="a" <c:if test="${set.sex == null}">checked</c:if>>
                    <label for="box-3">전체</label>
                    
                  </div>
                  <hr>
                  <!-- 사주, MBTI 유무 체크박스 -->
                    <div class="boxes2" style="padding-bottom: 30px;">
                       <div style="float: left; margin-right: 100px;">선택 </div>
                       <input type="checkbox" id="box2-1" class="chk2" name="samb" value="saju"<c:if test="${set.samb != 'mbti'}">checked</c:if>>
                       <label for="box2-1">사주</label>
                       
                       <input type="checkbox" id="box2-2" class="chk2" name="samb" value="mbti"<c:if test="${set.samb != 'saju'}">checked</c:if>>
                       <label for="box2-2">MBTI</label>
                        
                       <input type="checkbox" id="box2-3" name="samb" value="all"<c:if test="${set.samb !='saju' && set.samb !='mbti'}">checked</c:if>>
                       <label for="box2-3">사주 + MBTI</label>
                    </div>
                  <div>
                  <c:choose>
                  <c:when test="${num >= paymember }">
                  <input type="button" value="실행" style="float: right;" onclick="nextProfile()">                  
                  </c:when>
                  <c:otherwise>
                  <input type="submit" value="실행" style="float: right;">
                  </c:otherwise>
                  </c:choose>
                  </div>
                  </form>
               </div>
               <!-- 체크박스 끝 -->
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
                                 <!--차트 url   https://www.chartjs.org/docs/latest/charts/radar.html -->
                                </div>
                                <!-- mbti 및 사주 결과 -->
                                <div style="position: fixed; bottom: 25px;">
                                   <div class="team-photo">
                                    <div class="col-md-6 text-center" style="float:left;" data-toggle="tooltip" data-placement="top" title="사주 설명보기">
                                       <img class="img-fluid center-block" src="resources/img/ilju_animal/${ilju.RESULT_IMG }.png" alt="iljuanimal"
                                        style="width:50%; cursor: pointer;" onclick="saju()" data-target="#modalall" data-toggle="modal">
                                       <h5 style=" font-size:1rem"><b> ${ilju.ILJU }일주</b></h5>
                                    </div>
                                    <div class="col-md-6 text-center" style="float:left;" data-toggle="tooltip" data-placement="top" title="mbti 설명보기">
                                       <img class="img-fluid center-block" src="resources/img/mbti_img/${mbti.MBTI_IMG }.png" alt="mbti_img" 
                                       style="width:50%; cursor: pointer;" onclick="mbti()" data-target="#modalall" data-toggle="modal">
                                    </div>
                                   </div>
                                </div>
                                <!-- mbti 및 사주 결과 끝 -->
                                 </div>
                              </div>
                          </div>
                          <!-- 추천인 얼굴 -->
                          <div class="col-xs-4 col-sm-4 col-md-4" style="text-align: center; float: left">
                              <div class="single-team">
                                 <div style="height:430px">
                                  <img class="center-block" src="resources/upload/${profile.USER_IMG }" alt="profile_photo" style="height:100%; width:100%">
                           </div>
                        </div>
                          </div>
                          <!-- 추천인 얼굴 끝 -->
                          
                          
                          <!-- 추천인 정보 및 버튼(좋아요, 프로필보기, 채팅하기, 블락하기) -->
                          <div class="col-xs-4 col-sm-4 col-md-4" style="text-align: center; float: left">
                              <div class="single-team">
                                 <div style="height:430px; padding-top: 10%;">
                                     <h3> ${profile.NICKNAME }</h3>
                                     <!-- 활동중 -->
                                     <img style="height: 30px;;" src="images/offline_big.png" id="indicator" class="indicator">
                                      <p>${profile.BIRTH }</p><br>
                                     <h5> ${profile.USER_INTRO }</h5>
                                     
                                     <!-- 버튼 구현 -->
                                     <div style="position:fixed; bottom: 25px;">

                                 <!-- 블락 추가 구현 -->                                        
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
                                       src="resources/img/btn/like.png" data-toggle="tooltip" data-placement="top" title="추천 제외 취소"/>
                                    </c:when>
                                    <c:otherwise>
                                       <img id="${profile.USER_NUM}" class="blockox" style="width: 15%; cursor:pointer;" 
                                       src="resources/img/btn/dislike.png" data-toggle="tooltip" data-placement="top" title="추천에서 제외"/>                                    
                                    </c:otherwise>
                                 </c:choose>
                                        <!-- 블락 추가 구현 끝 -->
                                        
                                        <!-- 프로필 이동 구현 -->
                                        <img src="resources/img/btn/profile.png" style="width:15%; cursor: pointer;" onclick="profile()"
                                        data-toggle="tooltip" data-placement="top" title="상세 프로필 보기">
                                 <!-- 프로필 이동 끝 -->
                                        
                                        <img src="resources/img/btn/chat.png" style="width:15%; cursor: pointer;" onclick="chatting()"
                                        data-toggle="tooltip" data-placement="top" title="채팅하기">

                                   <!-- 좋아요 버튼 구현 -->
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
                                       src="resources/img/btn/hearton.png" data-toggle="tooltip" data-placement="top" title="좋아요 취소"/>
                                    </c:when>
                                    <c:otherwise>
                                       <img id="${profile.USER_NUM}" class="heart" style="width: 15%; cursor:pointer;" 
                                       src="resources/img/btn/heartoff.png" data-toggle="tooltip" data-placement="top" title="좋아요"/>                                    
                                    </c:otherwise>
                                 </c:choose>
                                 <!-- 좋아요 버튼 끝 -->
                                     </div>
                                     <!-- 버튼 구현 끝 -->
                                 </div>
                             </div>
                          </div>
                          <!-- 추천인 정보 및 버튼 끝 -->
                            <br>
                         </div>
                     </div>
                   <br>
                 </div>
                 <!-- 이전 페이지 및 다음 페이지 -->
                 <div class="col-xs-4 col-sm-4 col-md-12" style="text-align: center;">
                   <c:if test="${num != 1 }">
               <img src="resources/img/btn/back.png" style="width:5em; float: left; cursor: pointer;" onclick="prevProfile()">
                </c:if>
                <img src="resources/img/btn/forword.png" style="width:5em; float: right; cursor: pointer;" onclick="nextProfile()">
             </div>
             <!-- 이전 페이지 및 다음 페이지 끝 -->
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
              <h5 class="modal-title">결제확인</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <p>채팅권이 소진됩니다. 채팅신청을 하시겠습니까?</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="close_pop()">취소</button>
              <button type="button" class="btn btn-primary" id="chatOn">확인</button>
            </div>
          </div>
        </div>
      </div>
   </form>

   <script>
      //    차트
      new Chart(document.getElementById("radar-chart"), {
          type: 'radar',
          data: {
            labels: ["사주", "MBTI", "키", "지역"],
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
              text: '궁합 점수'
            }
          }
      });
   </script>
   
   <script>   
      //하트 눌렀을 때, 하트 on/off 모양 변화      
      $(document).on('click', '.heart', function(event) { 
             var like = 'false';
              var user_num = ${sessionScope.user_num};
               
               if ($(this).attr("src") === "resources/img/btn/hearton.png") {
   
                  $(this).attr("src", "resources/img/btn/heartoff.png"); //하트 버림
                  $(this).attr('data-original-title', '좋아요').tooltip('show');
                  like='false';
                  
                } else if($(this).attr("src") === "resources/img/btn/heartoff.png") {
                
                   $(this).attr("src", "resources/img/btn/hearton.png"); //하트 채움
                   $(this).attr('data-original-title', '좋아요 취소').tooltip('show')
                   like='true';
                }
               var param = {"like" : like, "liked_user" : $(this).attr("id"), "user_num": user_num};
   
               ajax(param);
            
         });
      
       //좋아요 유무 값 받아와서 띄우기   
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
         
         var blockon = "resources/img/btn/dislike.png"; //블락 하기
         var blockoff = "resources/img/btn/like.png"; //블락 해제
         
         var user_num = ${sessionScope.user_num};
         
         if ($(this).attr("src") === blockon) {
               $(this).attr("src", "resources/img/btn/like.png"); //블락취소
               $(this).attr('data-original-title', '추천 제외 취소').tooltip('show')
               block='true';
         } else if($(this).attr("src") === blockoff){
               $(this).attr("src", "resources/img/btn/dislike.png"); //블락
               $(this).attr('data-original-title', '추천에서 제외').tooltip('show')
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
      //상세 프로필로 이동 시 파라미터값 controller로 넘김
      function profile() {
         $("#profile").submit();
      };
      
      //채팅.
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
				//이제 요청 보내기 직전에 사용 되는 함수
/* 				beforeSend : function(xmlHttpRequest){
	                xmlHttpRequest.setRequestHeader("AJAX", "true"); // ajax 호출을  header에 기록
	            }, */
				success : function(res){
					alert("상대방에게 채팅신청하였습니다. 상대방 수락시 채팅방이 개설됩니다.");
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
      // 체크박스 슬라이드 토글
      $(document).on('click', '#set', function(event) {
         $("#checkset").slideToggle(); 
      });
   </script>
   
   <script>
      //체크박스 전체선택 및 전체해제(성별)
      $(document).on('click', '#box-3', function(event) {
      
          if($("#box-3").is(":checked")){
              $(".chk").prop("checked", true);
          }
          else{
              $(".chk").prop("checked", false);
          }
      });
      
      // 체크박스 전체선택 및 전체 해제(선택) -->
      $(document).on('click', '#box2-3', function(event) {
      
          if($("#box2-3").is(":checked")){
              $(".chk2").prop("checked", true);
          }
          else{
              $(".chk2").prop("checked", false);
          }
      });
      
          
      // 한개의 체크박스 선택 해제시 전체선택 체크박스도 해제(성별)
      $(document).on('click', '.chk', function(event) {
          if($("input[class='chk']:checked").length == 2){
              $("#box-3").prop("checked", true);
          }else{
              $("#box-3").prop("checked", false);
          }
      });
      
      // 한개의 체크박스 선택 해제시 전체선택 체크박스도 해제(선택)
      $(document).on('click', '.chk2', function(event) {
          if($("input[class='chk2']:checked").length == 2){
              $("#box2-3").prop("checked", true);
          }else{
              $("#box2-3").prop("checked", false);
          }
      });
      
   </script>
   
   <script>
      //사주 & MBTI 모달구현
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
      //이전페이지 이동
      function prevProfile() {
         $("#prevProfile").submit();
      }
      
      //다음페이지 이동
      function nextProfile() {
         //alert($("#num").val());
         var paymember= ${paymember};
         if ($("#num").val() > paymember) {
            alert("오늘 볼 수 있는 인원을 전부 소진했습니다.");
         }else {
            $("#nextProfile").submit();
         }
         
      }
   </script>
   
   <script>
      //tooltip 기능 구현
      $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();   
      });
   </script>

<%@ include file="footer.jsp"%>