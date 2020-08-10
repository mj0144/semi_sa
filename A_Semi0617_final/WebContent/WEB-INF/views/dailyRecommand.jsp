<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/css/viewsaju3.css">
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>
<c:set var="tf" value="true"/>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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



<style>
.progress{
    width: 150px;
    height: 150px;
    line-height: 150px;
    background: none;
    margin: 0 auto;
    box-shadow: none;
    position: relative;
}
.progress:after{
    content: "";
    width: 100%;
    height: 100%;
    border-radius: 50%;
    border: 12px solid #fff;
    position: absolute;
    top: 0;
    left: 0;
}
.progress > span{
    width: 50%;
    height: 100%;
    overflow: hidden;
    position: absolute;
    top: 0;
    z-index: 1;
}
.progress .progress-left{
    left: 0;
}
.progress .progress-bar{
    width: 100%;
    height: 100%;
    background: none;
    border-width: 12px;
    border-style: solid;
    position: absolute;
    top: 0;
}
.progress .progress-left .progress-bar{
    left: 100%;
    border-top-right-radius: 80px;
    border-bottom-right-radius: 80px;
    border-left: 0;
    -webkit-transform-origin: center left;
    transform-origin: center left;
}
.progress .progress-right{
    right: 0;
}
.progress .progress-right .progress-bar{
    left: -100%;
    border-top-left-radius: 80px;
    border-bottom-left-radius: 80px;
    border-right: 0;
    -webkit-transform-origin: center right;
    transform-origin: center right;
    animation: loading-1 1.8s linear forwards;
}
.progress .progress-value{
    width: 90%;
    height: 90%;
    border-radius: 50%;
    background: #44484b;
    font-size: 40px;
    color: #fff;
    line-height: 135px;
    text-align: center;
    position: absolute;
    top: 5%;
    left: 5%;
}
.progress.blue .progress-bar{
    border-color: #049dff;
}
.progress.blue .progress-left .progress-bar{
    animation: loading-2 1.5s linear forwards 1.8s;
}
.progress.yellow .progress-bar{
    border-color: #fdba04;
}
.progress.yellow .progress-left .progress-bar{
    animation: loading-3 1s linear forwards 1.8s;
}
.progress.pink .progress-bar{
    border-color: #ed687c;
}
.progress.pink .progress-left .progress-bar{
    animation: loading-4 0.4s linear forwards 1.8s;
}
.progress.green .progress-bar{
    border-color: #1abc9c;
}
.progress.green .progress-left .progress-bar{
    animation: loading-5 1.2s linear forwards 1.8s;
}
@keyframes loading-1{
    0%{
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg);
    }
    100%{
        -webkit-transform: rotate(180deg);
        transform: rotate(180deg);
    }
}
@keyframes loading-2{
    0%{
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg);
    }
    100%{
        -webkit-transform: rotate(144deg);
        transform: rotate(144deg);
    }
}
@keyframes loading-3{
    0%{
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg);
    }
    100%{
        -webkit-transform: rotate(90deg);
        transform: rotate(90deg);
    }
}
@keyframes loading-4{
    0%{
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg);
    }
    100%{
        -webkit-transform: rotate(36deg);
        transform: rotate(36deg);
    }
}
@keyframes loading-5{
    0%{
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg);
    }
    100%{
        -webkit-transform: rotate(126deg);
        transform: rotate(126deg);
    }
}
@media only screen and (max-width: 990px){
    .progress{ margin-bottom: 20px; }
}
</style>

<div id="colorlib-main">
	<section class="ftco-section ftco-bread">
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-8 ftco-animate">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="index">Home</a></span> <span>�ο���õ</span>
					</p>
					<h1 class="bread">������ �ο� ��õ�ޱ�</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section contact-section">	
		<div class="container no-gutters">
			<div class="row ">
				<div class="col-xs-12 col-sm-6 col-md-3">
		        	<div class="single-team">
		            	<div class="team-photo">
								<!--���⿡ ��Ʈ ����˴ϴ� -->
               				<img src="resources/img/sajutest1.jpg" alt="" style="width:100px">
              				 </div>
             			  
           			</div>
   				</div>
  				<div class="col-xs-12 col-sm-6 col-md-9" style="text-align: center;">
               		<div class="single-team">
                   		<div class="explain">
                   			<h3> OOO�԰� 90�� �̻��� �ο��� OO% �ֽ��ϴ�.
                   			</h3><br>
							<button type="button" class="btn btn-outline-info float-right"
								data-toggle="modal" data-target="#myModal">
								���� �ٲٱ�
							</button>
                   		</div>
               		</div>
                	<br>
           		</div>
			</div>
  		</div>
  		<div class="container no-gutters">
			<div class="row ">
				
  				<div class="col-xs-12 col-sm-6 col-md-12" style="text-align: center;">
               		<div class="single-team">
                   		<div class="explain">
                   			<div class="col-xs-4 col-sm-4 col-md-4" style="text-align: center; float: left">
				               	<div class="single-team">
                   					<div style="height:400px">
									        <div class="col-md-12 col-sm-12" style="margin-top:10%">
									            <div class="progress blue">
									                <span class="progress-left">
									                    <span class="progress-bar"></span>
									                </span>
									                <span class="progress-right">
									                    <span class="progress-bar"></span>
									                </span>
									                <div class="progress-value">90��</div>
									            </div>
									        </div>
									        <div>
									        <div class="team-photo">
												<div class="col-md-6 text-center" style="float:left;">
													<img class="img-fluid center-block" src="resources/img/ilju_animal/27.png" alt="iljuanimal" style="margin-left:20%; width:80%">
													<h4 style="font-color:green;"> ��������</h4>
												</div>
												<div class="col-md-6 text-center" style="float:left;">
													<img class="img-fluid center-block" src="resources/img/mbti_img/10.png" alt="mbti_img" style="width:70%;">
												</div>
											  </div>
									        </div>
										<div>
										
										<button type="button" class="btn btn-outline-info float-left"
											data-toggle="modal" data-target="#myModal">
											���� ������
										</button>
										<button type="button" class="btn btn-outline-info float-right"
											data-toggle="modal" data-target="#myModal">
											MBTI ������
										</button>
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
			                   			<div style="padding-bottom:0.5em">
				                   			<button type="button" class="btn btn-outline-info"
												data-toggle="modal" data-target="#myModal" style=" display:inline-block;">
												���ƿ�
											</button>
				                   			<button type="button" class="btn btn-outline-info"
												data-toggle="modal" data-target="#myModal" style=" display:inline-block ">
												��ȭ��û�ϱ�
											</button>
											<button type="button" class="btn btn-outline-info"
												data-toggle="modal" data-target="#myModal" style=" display:inline-block ">
												������ ��������
											</button>
			                   			</div>
				               		</div>
				           		</div>
			           		</div>
                   			<br>
                   		</div>
               		</div>
                	<br>
           		</div>
                <div class="col-xs-12 col-sm-12 col-md-12">
					<button type="button" class="btn btn-outline-info float-left" data-toggle="modal" data-target="#myModal">
					���� ��� ����
					</button>
					<button type="button" class="btn btn-outline-info float-right" data-toggle="modal" data-target="#myModal">
					���� ��� ��õ
					</button>
				</div>
			</div>
  		</div>			
	</section>
	<script>
	</script>

<%@ include file="footer.jsp"%>