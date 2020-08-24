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
						<b>������ ���� �� ã��</b>
					</h1>
				</div>
			</div>
		</div>
	</section>
	<br>
	<p style="color: orange; text-align: center;">*�̻��� �� �������� �̸���
		�����ּ���*</p>
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
										<h5>�󸶳� ��������?</h5>
									</div>
								</div>
							</div>
							<!-- ��õ�� �� -->
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
							<!-- ��õ�� �� �� -->
							<!-- ��õ�� ���� �� ��ư(���ƿ�, �����ʺ���, ä���ϱ�, ����ϱ�) -->
							<div class="col-xs-4 col-sm-4 col-md-4"
								style="text-align: center; float: left">
								<div class="single-team">
									<div style="height: 430px; padding-top: 10%;">
										<h3>${lovelist.nickname }</h3>
										<!-- Ȱ���� -->
										<img style="height: 30px;" src="images/offline_big.png"
											id="indicator" class="indicator">

										<p>${lovelist.birth }</p>
										<br>
										<h5>${lovelist.user_intro}</h5>

										<!-- ��ư ���� -->
										<div style="position: fixed; bottom: 25px;">

											<!-- ��� �߰� ���� -->
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
														data-placement="top" title="��õ ���� ���" />
												</c:when>
												<c:otherwise>
													<img id="${lovelist.user_num}" class="blockox"
														style="width: 15%; cursor: pointer;"
														src="resources/img/btn/dislike.png" data-toggle="tooltip"
														data-placement="top" title="��õ���� ����" />
												</c:otherwise>
											</c:choose>
											<!-- ��� �߰� ���� �� -->

											<!-- ������ �̵� ���� -->
											<img src="resources/img/btn/profile.png"
												style="width: 15%; cursor: pointer;" onclick="profile()"
												data-toggle="tooltip" data-placement="top" title="�� ������ ����">
											<!-- ������ �̵� �� -->

											<img src="resources/img/btn/chat.png"
												style="width: 15%; cursor: pointer;" onclick="chatting()"
												data-toggle="tooltip" data-placement="top" title="ä���ϱ�">

											<!-- ���ƿ� ��ư ���� -->
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
														data-placement="top" title="���ƿ� ���" />
												</c:when>
												<c:otherwise>
													<img id="${lovelist.user_num}" class="heart"
														style="width: 15%; cursor: pointer;"
														src="resources/img/btn/heartoff.png" data-toggle="tooltip"
														data-placement="top" title="���ƿ�" />
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
				<!-- ���� ������ �� ���� ������ �� -->
			</div>
		</div>
	</section>


	<form action="friend" method="post" id="profile">
		<input type="hidden" name="user_num" id="user_num"
			value="${lovelist.user_num}">
	</form>


	<script>
      //��Ʈ ������ ��, ��Ʈ on/off ��� ��ȭ      
      $(document)
            .on(
                  'click',
                  '.heart',
                  function(event) {
                     
                     
                     var like = 'false';
                     var user_num = ${sessionScope.user_num};

                     if ($(this).attr("src") === "resources/img/btn/hearton.png") {

                        $(this).attr("src",
                              "resources/img/btn/heartoff.png"); //��Ʈ ����
                        $(this).attr('data-original-title', '���ƿ�')
                              .tooltip('show');
                        like = 'false';

                     } else if ($(this).attr("src") === "resources/img/btn/heartoff.png") {

                        $(this).attr("src",
                              "resources/img/btn/hearton.png"); //��Ʈ ä��
                        $(this).attr('data-original-title', '���ƿ� ���')
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

      //���ƿ� ���� �� �޾ƿͼ� ����   
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

         var blockon = "resources/img/btn/dislike.png"; //��� �ϱ�
         var blockoff = "resources/img/btn/like.png"; //��� ����

         var user_num = ${sessionScope.user_num};

         if ($(this).attr("src") === blockon) {
            $(this).attr("src", "resources/img/btn/like.png"); //������
            $(this).attr('data-original-title', '��õ ���� ���').tooltip('show')
            block = 'true';
         } else if ($(this).attr("src") === blockoff) {
            $(this).attr("src", "resources/img/btn/dislike.png"); //���
            $(this).attr('data-original-title', '��õ���� ����').tooltip('show')
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
      //�� �����ʷ� �̵� �� �Ķ���Ͱ� controller�� �ѱ�
      function profile() {
         $("#profile").submit();
      };

      //ä��.
      function chatting() {
    	  var responeUser = $("#user_num").val(); //�޴���
			var link = "mypage"
			var param = new Object();
			var requestUser = ${sessionScope.user_num}; //��������
			var nickname = $("#nickname").val();
			console.log(nickname);
			param.notifyLink = link;
			param.notifycontent = nickname+"���� ȸ���Կ��� ä���� ��û�Ͽ����ϴ�.";
			param.notifyuser  = responeUser; //�޴���
			param.notifyusernum = requestUser; //��������
			var paramJson = JSON.stringify(param);
			$.ajax({
				type : "POST",
				url : "notifyin",
				contentType: "application/json; charset=utf-8",
				dataType : "json",
				data : paramJson,
				success :  function(res){
					if(res.result == "success"){
						var notifyparam = 'ä��|'+link+"|"+nickname;
						notifyon(notifyparam);
					}else{
						alert("�˶��� �����µ��� ajax ������ �߻��Ͽ����ϴ�.");
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
					alert("���濡�� ä�ý�û�Ͽ����ϴ�. ���� ������ ä�ù��� �����˴ϴ�.");
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
      //tooltip ��� ����
      $(document).ready(function() {
         $('[data-toggle="tooltip"]').tooltip();
      });
   </script>


	<%@ include file="footer.jsp"%>