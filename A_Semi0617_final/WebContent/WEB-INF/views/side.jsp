<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
<aside id="colorlib-aside" role="complementary"
   class="js-fullheight text-center">
   <h1 id="colorlib-logo">
      <a href="mypage"><span class="img"
         style="background-image: url(resources/upload/${sessionScope.user_img});"></span>${sessionScope.name }</a>
   </h1>
   <nav id="colorlib-main-menu" role="navigation">
      <ul style="line-height: 2;">
         <li class="colorlib-active"><a href="index">Home</a></li>
         <li><a href="viewsaju">���ֺ���</a></li>
         <li><a href="feed">�ǵ�</a></li>
         <li><a href="listWhole">�ο�ã��</a></li>
         <li><a href="mypage">����������</a></li>
         <li><a href="pay">������ǰ</a></li>
         <li><a href="qnapage">Q&A</a></li>
         <a href="setting"><img src="images/setting.png"></a>
         <br>
         <br>
         <br>
         <br>
         <li><a href="logoutdo">�α׾ƿ�</a></li>
      </ul>
      <h3>
         <img src="images/heart.png">
      </h3>
   </nav>
</aside>
<!-- END COLORLIB-ASIDE -->