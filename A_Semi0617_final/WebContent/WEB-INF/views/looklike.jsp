<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="header.jsp" %>
<%@include file="side.jsp" %>
      <div id="colorlib-main">
         <section class="ftco-section" style="background-image: url(resources/img/headerimg.png); height:5em">
      <div class="container">
         <div class="row no-gutters slider-text justify-content-center align-items-center">
            <div class="col-md-12 ftco-animate text-center">
               <h1 class="bread" style="color:white;"><b>연예인 닮은 꼴 찾기</b></h1>
            </div>
         </div>
      </div>
   </section>
   <div >
      <h1 style="text-align: center;"><br><b>나랑 닮은 연예인은?</b></h1>
   </div>
   <section class="ftco-section contact-section">
       <div class="container" style="margin-left: 230px;">
         <div class="row">
                  <div class=".col-xs-6 .col-sm-4">
                        <div>
                            <img id="profileimg" style="height:300px; width:200px;" src="resources/upload/${mylist.USER_IMG}">
                        </div>
                        <br>
                        <h4>나의 프로필 사진</h4>
                        <h6 style="color: orange;">*프로필 수정시 결과는 바뀝니다.*</h6>
                </div>
               
                
                   <div class=".col-xs-6 .col-sm-4">
                    <div>
                        <img style="height:150px; width:400px;" src="resources/img/icon/here.png">
                </div>
                <div>
                 <div><h1 style="text-align: center;"><b> ${mylist.PERCENT}%</b></h1>
                 <h3  style="text-align: center;">닮았습니다</h3></div>
                 </div>
                 </div>
                 <div class=".col-xs-6 .col-sm-4">
                    <div>
                        <div>
                            <img style="height:300px; width:200px;" src="resources/upload/IMAG01_1.jpg">
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

  //이미지 미리보기.
      $("#file").change(function() {
         console.log("files[0] : " + this.files[0]);
         console.log("files : " + this.files);
         if (this.files && this.files[0]) {
            var reader = new FileReader;
            reader.onload = function(data) {
               $("#profileimg").attr("src", data.target.result).width(250);
            }
            reader.readAsDataURL(this.files[0]);
         }
      });
 
 function submitchange() {
			$('#form').submit();
		
}


   </script>
<%@ include file="footer.jsp" %>