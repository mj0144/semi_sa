<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="header.jsp" %>
<%@ include file="side.jsp" %>
<div id="colorlib-main">
	<section class="ftco-section" style="background-image: url(resources/img/headerimg.png); height:5em">
		<div class="container">
			<div class="row no-gutters slider-text justify-content-center align-items-center">
				<div class="col-md-12 ftco-animate text-center">
					<h1 class="bread" style="color:white;"><b>Chat</b></h1>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section-3" style="background-color: #e0e0e0; padding: 100px;">

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="css/chat.css" rel="stylesheet" type="text/css">

<script src = " https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js "></script>

<div class="container">
<h3 class=" text-center">Messaging</h3>
<div class="messaging" id="messaging">
  <input type="hidden" value='${sessionScope.user_num}' id="sessionuserid">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>채팅 목록</h4>
            </div>
          </div>
          <div class="inbox_chat" id="inbox_chat">
          	<!-- 여기서부터 채팅방 친구목록 -->
          	<!--  active_chat 누굴 클릭해서 읽고있는지확인 class에 추가 -->
          	<a href="#" onclick="choiceUser">
            <div class="chat_list">
              <div class="chat_people">
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="chat_ib">
                  <h5>닉네임 <span class="chat_date">시간</span></h5>
                  <p>ㅇㅇ</p>
                </div>
              </div>
            </div>
            </a>
            <!-- 한사람의 유저정보 -->
            <div class="chat_list">
              <div class="chat_people">
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="chat_ib">
                  <h5>Sunil Rajput <span class="chat_date">Dec 25</span></h5>
                  <p>11</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="mesgs">