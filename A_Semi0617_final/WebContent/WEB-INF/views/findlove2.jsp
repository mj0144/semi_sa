<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/css/viewsaju3.css">
<link rel="stylesheet" href="resources/css/checkbox.css">
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
<c:set var="tf" value="true" />
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>


<div id="colorlib-main">
	<section class="ftco-section"
		style="background-image: url(resources/img/headerimg.png); height: 5em">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-12 ftco-animate text-center">
					<h1 class="bread" style="color: white;">
						<b>연예인 닮은 꼴 찾기</b>
					</h1>
				</div>
			</div>
		</div>
	</section>
	<br>
	<p style="color: orange; text-align: center;">*이상형 인 연예인의 이름을
		적어주세요*</p>
	<div class="col-sm-12 pull-center well" style="margin-left: 400px;">
		<form class="form-inline" action="lovesearch" method="post">

			<div class="input-group custom-search-form">

				<input type="text" name="looklike" class="form-control"
					placeholder="Search..."
					style="width: 400px; border-radius: 10px 10px 10px 10px; border: 0.5px solid;">
				&nbsp;&nbsp;&nbsp; <span class="input-group-btn">
					<button class="btn btn-default" id="searchbtn" type="submit"
						style="height: 52px; width: 75px; border-radius: 10px 10px 10px 10px; background-color: black; color: white; border: 0.5px solid;">
						search</button>
				</span>
			</div>
		</form>
	</div>
	<hr>
	<section class="ftco-section contact-section">
		<div class="container ">
			<div class="row ">
				<div class="col-xs-12 col-sm-6 col-md-12"
					style="text-align: center;">
					<div class="single-team"></div>

					<br>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">

				<div class="col-xs-12 col-sm-6 col-md-12"
					style="text-align: center;">
					<div class="" style="border: 1px solid #D8D8D8; height: 435px">
						<div class="explain">
							<div class="col-xs-4 col-sm-4 col-md-4"
								style="text-align: center; float: left">
								<div class="single-team">
									<div style="height: 430px">
										<br> <br> <br> <br>
										<div id="chart1" style="height: 180px;"></div>
										<br>
										<h5>얼마나 닮았을까요?</h5>
									</div>
								</div>
							</div>
							<!-- 추천인 얼굴 -->
							<div class="col-xs-4 col-sm-4 col-md-4"
								style="text-align: center; float: left">
								<div class="single-team">
									<div style="height: 430px">
										<img class="center-block"
											src="resources/upload/${lovelist.user_img }"
											alt="profile_photo" style="height: 100%; width: 100%">
									</div>
								</div>
							</div>
							<!-- 추천인 얼굴 끝 -->
							<!-- 추천인 정보 및 버튼(좋아요, 프로필보기, 채팅하기, 블락하기) -->
							<div class="col-xs-4 col-sm-4 col-md-4"
								style="text-align: center; float: left">
								<div class="single-team">
									<div style="height: 430px; padding-top: 10%;">
										<h3>${lovelist.nickname }</h3>
										<!-- 활동중 -->
										<img style="height: 30px;" src="images/offline_big.png"
											id="indicator" class="indicator">

										<p>${lovelist.birth }</p>
										<br>
										<h5>${lovelist.user_intro}</h5>

										<!-- 버튼 구현 -->
										<div style="position: fixed; bottom: 25px;">

											<!-- 블락 추가 구현 -->
											<c:set var="blockox" value="false" />
											<c:forEach var="g" items="${blist }">
												<c:choose>
													<c:when test="${g == lovelist.user_num}">
														<c:set var="blockox" value="true" />
													</c:when>
												</c:choose>
											</c:forEach>

											<c:choose>
												<c:when test="${blockox == 'true'}">
													<img id="${lovelist.user_num}" class="blockox"
														style="width: 15%; cursor: pointer;"
														src="resources/img/btn/like.png" data-toggle="tooltip"
														data-placement="top" title="추천 제외 취소" />
												</c:when>
												<c:otherwise>
													<img id="${lovelist.user_num}" class="blockox"
														style="width: 15%; cursor: pointer;"
														src="resources/img/btn/dislike.png" data-toggle="tooltip"
														data-placement="top" title="추천에서 제외" />
												</c:otherwise>
											</c:choose>
											<!-- 블락 추가 구현 끝 -->

											<!-- 프로필 이동 구현 -->
											<img src="resources/img/btn/profile.png"
												style="width: 15%; cursor: pointer;" onclick="profile()"
												data-toggle="tooltip" data-placement="top" title="상세 프로필 보기">
											<!-- 프로필 이동 끝 -->

											<img src="resources/img/btn/chat.png"
												style="width: 15%; cursor: pointer;" onclick="chatting()"
												data-toggle="tooltip" data-placement="top" title="채팅하기">

											<!-- 좋아요 버튼 구현 -->
											<c:set var="hearton" value="false" />
											<c:forEach var="g" items="${heart }">
												<c:choose>
													<c:when test="${g.liked_user == lovelist.user_num}">
														<c:set var="hearton" value="true" />
													</c:when>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${hearton == 'true'}">
													<img id="${lovelist.user_num}" class="heart"
														style="width: 15%; cursor: pointer;"
														src="resources/img/btn/hearton.png" data-toggle="tooltip"
														data-placement="top" title="좋아요 취소" />
												</c:when>
												<c:otherwise>
													<img id="${lovelist.user_num}" class="heart"
														style="width: 15%; cursor: pointer;"
														src="resources/img/btn/heartoff.png" data-toggle="tooltip"
														data-placement="top" title="좋아요" />
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
				<!--             <div class="col-xs-4 col-sm-4 col-md-12" style="text-align: center;"> -->
				<%--                <c:if test="${num != 1 }"> --%>
				<!--                   <img src="resources/img/btn/back.png" -->
				<!--                      style="width: 5em; float: left; cursor: pointer;" -->
				<!--                      onclick="prevProfile()"> -->
				<%--                </c:if> --%>
				<!--                <img src="resources/img/btn/forword.png" -->
				<!--                   style="width: 5em; float: right; cursor: pointer;" -->
				<!--                   onclick="nextProfile()"> -->
				<!--             </div> -->
				<!-- 이전 페이지 및 다음 페이지 끝 -->
			</div>
		</div>
	</section>


	<form action="friend" method="post" id="profile">
		<input type="hidden" name="user_num" id="user_num"
			value="${lovelist.user_num}">
	</form>


	<script>
      //하트 눌렀을 때, 하트 on/off 모양 변화      
      $(document)
            .on(
                  'click',
                  '.heart',
                  function(event) {
                     
                     
                     var like = 'false';
                     var user_num = ${sessionScope.user_num};

                     if ($(this).attr("src") === "resources/img/btn/hearton.png") {

                        $(this).attr("src",
                              "resources/img/btn/heartoff.png"); //하트 버림
                        $(this).attr('data-original-title', '좋아요')
                              .tooltip('show');
                        like = 'false';

                     } else if ($(this).attr("src") === "resources/img/btn/heartoff.png") {

                        $(this).attr("src",
                              "resources/img/btn/hearton.png"); //하트 채움
                        $(this).attr('data-original-title', '좋아요 취소')
                              .tooltip('show')
                        like = 'true';
                     }
                     var param = {
                        "like" : like,
                        "liked_user" : $(this).attr("id"),
                        "user_num" : user_num
                     };

                     ajax(param);

                  });

      //좋아요 유무 값 받아와서 띄우기   
      function ajax(param) {
         $.ajax({
            url : "likeox",
            type : "post",
            data : param,
            success : function(data) {

            },
            error : function() {

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
            block = 'true';
         } else if ($(this).attr("src") === blockoff) {
            $(this).attr("src", "resources/img/btn/dislike.png"); //블락
            $(this).attr('data-original-title', '추천에서 제외').tooltip('show')
            block = 'false';
         }
         var pm = {
            "block" : block,
            "blocked_user" : $('#user_num').val()
         };

         blocked(pm);

      });

      function blocked(pm) {

         $.ajax({
            url : "blockox",
            type : "post",
            data : pm,
            success : function(data) {
            },
            error : function(request, error) {
               console.log("code:" + request.status + "\n" + "message:"
                     + request.responsetext + "\n" + "error:" + error);
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
      function chatting() {
    	  var responeUser = $("#user_num").val(); //받는자
			var link = "mypage"
			var param = new Object();
			var requestUser = ${sessionScope.user_num}; //보내는자
			var nickname = $("#nickname").val();
			console.log(nickname);
			param.notifyLink = link;
			param.notifycontent = nickname+"님이 회원님에게 채팅을 요청하였습니다.";
			param.notifyuser  = responeUser; //받는자
			param.notifyusernum = requestUser; //보내는자
			var paramJson = JSON.stringify(param);
			$.ajax({
				type : "POST",
				url : "notifyin",
				contentType: "application/json; charset=utf-8",
				dataType : "json",
				data : paramJson,
				success :  function(res){
					if(res.result == "success"){
						var notifyparam = '채팅|'+link+"|"+nickname;
						notifyon(notifyparam);
					}else{
						alert("알람을 보내는도중 ajax 문제가 발생하였습니다.");
					}
				},
				error:function(request,status,error){
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});
			var user1 = ${sessionScope.user_num};
			$.ajax({
				type : "POST",
				url : "chRequest",
				data : "user1="+user1,
	            beforeSend : function(request){
	                request.setRequestHeader("chRequest", "chRequest");
	            },
				success : function(res){
					alert("상대방에게 채팅신청하였습니다. 상대방 수락시 채팅방이 개설됩니다.");
					//document.location.href = document.location.href;
				},
				error : function(request,status,error){
					console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
					alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
				}
			});
      }
   </script>

	<script>
   var chart = c3.generate({
      bindto: '#chart1',
       data: {
           columns: [
               ['data', ${percent}]
           ],
           type: 'gauge',
           onclick: function (d, i) { console.log("onclick", d, i); },
           onmouseover: function (d, i) { console.log("onmouseover", d, i); },
           onmouseout: function (d, i) { console.log("onmouseout", d, i); }
       },
       gauge: {
//           label: {
//               format: function(value, ratio) {
//                   return value;
//               },
//               show: false // to turn off the min/max labels.
//           },
//       min: 0, // 0 is default, //can handle negative min e.g. vacuum / voltage / current flow / rate of change
//       max: 100, // 100 is default
//       units: ' %',
//       width: 39 // for adjusting arc thickness
       },
       color: {
           pattern: ['#FF0000', '#F97600', '#F6C600', '#60B044'], // the three color levels for the percentage values.
           threshold: {
//               unit: 'value', // percentage is default
//               max: 200, // 100 is default
               values: [30, 60, 90, 100]
           }
       },
       size: {
           height: 160
       }
   });
   </script>

	<script>
      //tooltip 기능 구현
      $(document).ready(function() {
         $('[data-toggle="tooltip"]').tooltip();
      });
   </script>


	<%@ include file="footer.jsp"%>