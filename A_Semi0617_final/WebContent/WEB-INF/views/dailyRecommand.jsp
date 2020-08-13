<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/css/viewsaju3.css">
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
<c:set var="tf" value="true"/>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<script>
	<!-- �̹��� ������ �� ���� �����ʷ� �Ѿ --> 
	$(document).on('click', '#person', function(event) {
		$(this).children('#send_num').submit();
	});

</script>

<script>

	<!-- ��Ʈ ������ ��, ��Ʈ on/off ��� ��ȭ -->		
	$(document).on('click', '.img1', function(event) { 
			 var like = 'false';
		     var user_num = ${sessionScope.user_num};
		      
		      if ($(this).attr("src") === "images/hearton.png") {

		    	  $(this).attr("src", "images/heartoff.png"); //��Ʈ ����
		         like='false';
		         
	 			} else if($(this).attr("src") === "images/heartoff.png") {
	 			
	 				$(this).attr("src", "images/hearton.png"); //��Ʈ ä��
	 				like='true';
	 			}
		      var param = {"like" : like, "liked_user" : $(this).attr("id"), "user_num": user_num};
		      console.log(param);

		      ajax(param);
			
		});
	
<!-- ���ƿ� ���� �� �޾ƿͼ� ���� -->	   
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
	<!-- ��� �� �Ķ���Ͱ� controller�� �ѱ� -->
	$(document).on('click', '#block img', function(event) {
		$(this).closest("#block").children('#send_num').submit();
	});

</script>


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
                   			<h3> OOO�԰� 90�� �̻��� �ο��� OO% �ֽ��ϴ�.
                   			</h3><br>
							<img src="images/setting.png">
                   		</div>
               		</div>
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
								        <div class="col-md-12 col-sm-12" style="margin-top:10%">
								        	<canvas id="radar-chart" width="800" height="600"></canvas>
<!-- 							��Ʈ url	        	https://www.chartjs.org/docs/latest/charts/radar.html -->
								        </div>
								        <div>
									        <div class="team-photo">
												<div class="col-md-6 text-center" style="float:left;">
													<img class="img-fluid center-block" src="resources/img/ilju_animal/27.png" alt="iljuanimal" style="width:40%">
													<h4 style=" font-size:1.4rem"><b> ��������</b></h4>
												</div>
												<div class="col-md-6 text-center" style="float:left;">
													<img class="img-fluid center-block" src="resources/img/mbti_img/10.png" alt="mbti_img" style="width:50%;">
												</div>
											  </div>
								        </div>
				               		</div>
			               		</div>
			           		</div>
			           		<div class="col-xs-4 col-sm-4 col-md-4" style="text-align: center; float: left">
			               		<div class="single-team">
			               			<div style="height:430px">
		                   			<img class="center-block" src="resources/img/arin.jpg" alt="profile_photo" style="height:100%; width:100%">
									</div>
								</div>
			           		</div>
			           		<div class="col-xs-4 col-sm-4 col-md-4" style="text-align: center; float: left">
			               		<div class="single-team">
				               		<div style="height:430px">
			                   			<h3> �г���</h3> <p>1999���</p><br>
			                   			<h5> �ڱ�Ұ�</h5>
			                   			<div style="position:fixed; bottom: 10px;">
                				            <img src="resources/img/btn/dislike.png" style="width:15%">
                				            <img src="resources/img/btn/profile.png" style="width:15%">
                				            <img src="resources/img/btn/chat.png" style="width:15%">
			        						<img src="resources/img/btn/heart.png" style="width:15%">
			                   			</div>
				               		</div>
				           		</div>
			           		</div>
                   			<br>
                   		</div>
               		</div>
                	<br>
           		</div>
           		<div class="col-xs-4 col-sm-4 col-md-12" style="text-align: center;">
                
					<img src="resources/img/btn/back.png" style="width:5em; float: left" >
			    	<img src="resources/img/btn/forword.png" style="width:5em; float: right">
		    	</div>
			</div>
  		</div>			
	</section>
	<script>
// 	��Ʈ
	new Chart(document.getElementById("radar-chart"), {
	    type: 'radar',
	    data: {
	      labels: ["����", "MBTI", "Ű", "ü��", "����"],
	      datasets: [
	        {
	          label: "2050",
	          fill: true,
	          backgroundColor: "rgba(255,99,132,0.2)",
	          borderColor: "rgba(255,99,132,1)",
	          pointBorderColor: "#fff",
	          pointBackgroundColor: "rgba(255,99,132,1)",
	          pointBorderColor: "#fff",
	          data: [100,100,90,90,0]
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

<%@ include file="footer.jsp"%>