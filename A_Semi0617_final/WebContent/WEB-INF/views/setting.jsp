<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp"%>
<%@include file="side.jsp"%>

<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
   src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.settingspan {
   font-size: 15px;
}

.box {
   padding: 60px 0px;
}

.box-part {
   background: #FFF;
   border-radius: 0;
   padding: 60px 10px;
   margin: 30px 0px;
}

.text {
   margin: 20px 0px;
}

.fa {
   color: #4183D7;
}
</style>
	<!-- �������� modal -->
	<script>
	function close_pop(flag) {
        $('#modal').hide();
   };
		function paylist(){
			$("#paylist").empty();
			var user_num = ${sessionScope.user_num}
			var list;
			$.ajax({
				//$("#paylist").empty();
				data : {'user_num':user_num},
				url : 'payListModal',
				type: 'GET',
				success : function(data){
					
					console.log('data : ' + data);

					console.log(data.product_num)
					
					
					for (var i=0;i<data.length;i++) {
						console.log(data[i].product_name);
						console.log(data[i]);
						$("#paylist").append('<tr>')
					    $("#paylist").append('<td  style="border-bottom: 1px solid #ddd;">'+data[i].product_name+'</td>'); 
						/* $("#paylist").append('<td style="border-bottom: 1px solid #ddd;">'+data[i].merchant_uid+'</td>');  */
						$("#paylist").append('<td style="border-bottom: 1px solid #ddd;">'+data[i].paid_amount+'</td>'); 
						$("#paylist").append('<td style="border-bottom: 1px solid #ddd;">'+data[i].paid_date+'</td>'); 
						$("#paylist").append('<td style="border-bottom: 1px solid #ddd;">'+data[i].paid_count+'</td>'); 
						$("#paylist").append('</tr>')
 					}
					
					
		       
					$('#modal').show();
					
					
				},
				error : function(request,status,error){
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);


				}
				
			})
		}
		
		
		
		
	</script>
	
<div id="colorlib-main">
<section class="ftco-section" style="background-image: url(resources/img/headerimg.png); height:5em">
      <div class="container">
         <div class="row no-gutters slider-text justify-content-center align-items-center">
            <div class="col-md-12 ftco-animate text-center">
               <h1 class="bread" style="color:white;"><b>Setting</b></h1>
            </div>
         </div>
      </div>
   </section>
   <!-- �������-->
   <div class="box">
      <div class="container">
         <div class="row">

            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

               <div class="box-part text-center">

                  <img src="images/person.png">
                  

                  <div class="title">
                  <br>
                     <h4>ȸ����������</h4>
                  </div>

                  <div class="text">
                     <span class="settingspan">
                        ȸ������ �⺻������ �����Ҽ��ֽ��ϴ�.</span>
                  </div>

                  <a href="userInfoChange">Learn More</a>

               </div>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

               <div class="box-part text-center">

                  <img src="images/password.png">

                  <div class="title">
                     <br>
                     <h4>��й�ȣ����</h4>
                  </div>

                  <div class="text">
                     <span>ȸ������ ��й�ȣ�� �����Ҽ��ֽ��ϴ�.</span>
                  </div>

                  <a href="pwdChange">Learn More</a>

               </div>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

               <div class="box-part text-center">

                  <img src="images/delete.png">

                  <div class="title">
                  <br>
                     <h4>ȸ��Ż��</h4>
                  </div>

                  <div class="text">
                     <span>ȸ������ ������ Ż���� �� �ֽ��ϴ�.</span>
                  </div>

                  <a href="deletepage">Learn More</a>

               </div>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

					<div class="box-part text-center">

						<img src="images/alarm.png">

						<div class="title">
						<br>
							<h4>�������� ����</h4>
						</div>

						<div class="text">
							<span>���� ���������� Ȯ���� �� �ֽ��ϴ�.</span>
						</div>

						<a href="#" onclick="paylist()">Learn More</a>

					</div>
				</div>

            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

               <div class="box-part text-center">

                  <img src="images/spam.png">

                  <div class="title">
                  <br>
                     <h4>���ܰ���</h4>
                  </div>

                  <div class="text">
                     <span>ȸ���Բ��� �ٸ� ȸ���� �����ϰų� ���������� �� �� �ֽ��ϴ�.</span>
                  </div>

                  <a onclick="blocklist()" data-target="#modalall" data-toggle="modal" style="cursor: pointer;">Learn More</a>

               </div>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">

               <div class="box-part text-center">

                  <img src="images/likeall.png">

                  <div class="title">
                  <br>
                     <h4>��ƺ���</h4>
                  </div>

                  <div class="text">
                     <span>ȸ���Բ��� �ȷο� �� ������ ȸ������ �ȷο����� ��ƺ��� �� �� �ֽ��ϴ�. </span>
                  </div>

                  <a onclick="" data-target="#followmodal" data-toggle="modal" style="cursor: pointer;">Learn More</a>

               </div>
            </div>

         </div>
      </div>
   </div>
   
   <!-- ����Ȯ�� modal -->
   <div class="modal" tabindex="-1" role="dialog" id="modal">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		      
		        <h5 class="modal-title">����Ȯ��</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      <br>
				<table style="width: 100%;">
					<thead>
						<tr>
							<th>��ǰ��</th>
							<th>�����ݾ�</th>
							<th>������¥</th>
							<th>��������</th>
						</tr>
					</thead>
					<tbody id="paylist">
					
					</tbody>
				</table>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="close_pop()">Ȯ��</button>
		      </div>
		    </div>
		  </div>
		</div>
   <!-- �̵��� block ��� ����-->
   
   <!-- Modal -->
   <div class="modal fade" id="modalall" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-dialog-scrollable modal-sm" role="document" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
       <div class="modal-content">
       </div>
     </div>
   </div>


<!-- �ڼ��� modal -->
   <div class="modal fade" id="followmodal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" role="document" style="max-width: 100%; width: 500px; height:600px; display: table;">
         <div class="modal-content">
            <div class="modal-header">
               <b><h2 class="modal-title" id="myModalLabel"></h2></b>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close" style="float: right;">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <!-- <form method="post" id="checked" action="reportBoard"> -->
               				 <div>
	               				 <div style="width: 50%; float: left;">
	               				 <b>���� ���ƿ��� ����LIST</b><br>
	               				 <hr style="color:black;">
	               				 	 <c:forEach var="f" items="${follower}" varStatus="r">
		                             <input type="hidden" class="user_number" name="user_number" value="${f.LIKER_USER}">  
		                             <div>
		                              <div style="float: left;">
		                               <a href="friend?user_num=${f.LIKER_USER}">
		                              <div style="position: absolute;">
		                              <div style="position: relative;"><img style="width: 10px;" src="images/offline.png" id="indicato${r.count}"></div>
		                              </div>
		                              <img style=" width:50px; height:50px; border-radius:50%;display:block;" src="resources/upload/${f.USER_IMG}"></a> 
		                              </div>
		                              <div style="color: black; font-size: 20px;">&nbsp;${f.NICKNAME}</div><br>
		                              </div>
		                               <hr style="color: gray;">
		                			  </c:forEach>
	               				 </div>
	               				 <div style="width: 50%; float: right;">
	               				 <b>���� ���ƿ��� ����LIST</b><br>
	               				 <hr style="color: black;">
	               				 	 <c:forEach var="f" items="${follow}" varStatus="r">
		                             <input type="hidden" class="user_number2" name="user_number2" value="${f.LIKER_USER}">   
		                             <div>
		                              <div style="float: left;">
		                               <a href="friend?user_num=${f.LIKER_USER}">
		                              <div style="position: absolute;">
		                              <div style="position: relative;"><img style="width: 10px;" src="images/offline.png" id="indicator_rc${r.count}"></div>
		                              </div>
		                              <img style=" width:50px; height:50px; border-radius:50%;display:block;" src="resources/upload/${f.USER_IMG}"></a> 
		                              </div>
		                              <div style="color: black; font-size: 20px;">&nbsp;${f.NICKNAME}</div><br>
		                              </div>
		                               <hr style="color: gray;">
		                 			 </c:forEach>
	               				 </div>
               				 
               				 </div>
               				 
               				 
               				 
               				 
               				 
               				 
               				 
               				 
                            
            </div>
            <div class="modal-footer">
               
            </div>
         </div>
      </div>
   </div>

   <form action="friend" method="post" id="blfriend">
      <input type="hidden" value="0" id="user_num" name="user_num">
   </form>

   <!--  ������� -->
   <%@ include file="footer.jsp"%>
   
   <!-- �̵��� block ��� ����-->
   <script>
   function blocklist() {
      var url = 'blockmodal';
      
       $('#modalall .modal-content').load(url);         
        $('#modalall').modal('show');
   }
   </script>
   
   <script>
      $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();   
      });
   </script>
   <script>
      function sendChildValue(name){
          $("#user_num").attr('value',name);
         alert($("#user_num").attr('value'));
         $("#blfriend").submit();
      }

   </script>
   <!-- block ��� ���� �� -->
   