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
			<li><a href="viewsaju">사주보기</a></li>
			<li><a href="feed">피드</a></li>
			<li class="panel panel-default" id="dropdown">
				<a data-toggle="collapse" href="#dropdown-lvl1">
					<span class="glyphicon glyphicon-user"></span>
					인연찾기 <span class="caret"></span>
				</a> 
			<!-- Dropdown level 1 -->
				<div id="dropdown-lvl1" class="panel-collapse collapse">
					<div class="panel-body">
						<ul class="nav navbar-nav">
							<li style="font-size: 12px; margin-top: 5px; margin-bottom: 1px;"><a href="listSome?code=3">이성</a></li>
							<li style="font-size: 12px; margin-bottom: 1px;"><a href="listFriend?code=3">동성</a></li>
							<li style="font-size: 12px; margin-bottom: 0px;"><a href="listWhole?code=3">전체</a></li>
						</ul>
					</div>
				</div>
			</li>
			<li><a href="mypage">마이페이지</a></li>
			<li><a href="pay">결제상품</a></li>
			<br>
			<br>
			<br>
			<br>
			<li><a href="logoutdo">로그아웃</a></li>
		</ul>
		<h3>
			<img src="images/heart.png">
		</h3>
	</nav>
</aside>
<!-- END COLORLIB-ASIDE -->