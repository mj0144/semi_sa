<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="header.jsp" %>
<%@include file="side.jsp" %>
      <div id="colorlib-main">
         <section class="ftco-section" style="background-image: url(resources/img/headerimg.png); height:5em">
      <div class="container">
         <div class="row no-gutters slider-text justify-content-center align-items-center">
            <div class="col-md-12 ftco-animate text-center">
               <h1 class="bread" style="color:white;"><b>������ ���� �� ã��</b></h1>
            </div>
         </div>
      </div>
   </section>
   <div >
      <h1 style="text-align: center;"><br><b>���� ���� ��������?</b></h1>
   </div>
   <section class="ftco-section contact-section">
       <div class="container">
         <div class="row">
                  <div class=".col-xs-6 .col-sm-4">
                        <div>
                            <img id="profileimg" style="height:350px; width:250px;" src="resources/upload/${sessionScope.user_img}">
                        </div>
                        <div  style="text-align: center;">
                        <%-- <h4>${mylist.NICKNAME} ��</h4>  --%>
                        <!-- <input type="file" id="files" name="files" multiple="multiple"></div><br>
                       <input style="margin: 0 auto;" width="250" type="button" id="changebtn" name="changebtn" value="value"
                        onclick="changep()"> -->
                <form method="post" id="form" action="changeP" name="changeP" enctype="multipart/form-data">
                <div>
         			<input type="file" id="file" name="file" style="display:none;" accept=".jpg,.jpeg,.png,.gif,.PNG">
         			<div id="file_upload" style=""class="btn btn-outline-dark " 
           			 onclick="document.getElementById('file').click()">��������</div>      
    			  </div>
                
                
 				<!--  <input type="file" id="file" name="file" accept=".jpg,.jpeg,.png,.gif,.PNG"/>
  				<br><input type="submit" value="���� �����ϱ�" style="width: 200px;"> -->
  				 <button class="btn btn-primary" type="button" id="send" style="text-align: center;" onclick="submitchange()">���� ������ ã��!</button>
				</form></div>
                </div>
               
                
                   <div class=".col-xs-6 .col-sm-4">
                    <div>
                        <img style="height:300px; width:400px;" src="resources/img/icon/here.png">
                </div>
                <div>
                 <div><h1 style="text-align: center;"><b> ${mylist.PERCENT}%</b></h1>
                 <h3  style="text-align: center;">��ҽ��ϴ�</h3></div>
                 </div>
                 </div>
                 <div class=".col-xs-6 .col-sm-4">
                    <div>
                        <div>
                            <img style="height:400px; width:300px;" src="resources/img/default.png">
                        </div>
                        <div>
                        <br>
                        <h4 style="text-align: center;"> ${mylist.LOOKLIKE}</h4>
                       
                    </div>
                    </div>
                </div>
                </div>
                </div>
            
       </section>
   <script>
 //�̹��� �̸�����.

 
 function submitchange() {
			$('#form').submit();
		
}


   </script>
<%@ include file="footer.jsp" %>