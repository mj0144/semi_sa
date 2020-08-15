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
<div class="messaging">
  <input type="hidden" value='${sessionid}' id="sessionuserid">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>Recent</h4>
            </div>
            <div class="srch_bar">
              <div class="stylish-input-group">
                <input type="text" class="search-bar"  placeholder="Search" >
                <span class="input-group-addon">
                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
                </span> </div>
            </div>
          </div>
          <div class="inbox_chat">
            <div class="chat_list active_chat">
              <div class="chat_people">
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="chat_ib">
                  <h5>Sunil Rajput <span class="chat_date">Dec 25</span></h5>
                  <p>ㅇㅇ</p>
                </div>
              </div>
            </div>
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
          <div class="msg_history" id="msg_history">
            <div class="incoming_msg">
              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> 
              </div>
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p>상대가보낸거</p>
                  <span class="time_date_left"> 11:01 AM    |    June 9</span></div>
              </div>
            </div>
            <div class="outgoing_msg">
              <div class="sent_msg">
                <p>내가보낸거</p>
                <span class="time_date_right"> 11:01 AM    |    June 9</span> </div>
            </div>
          </div>
          <div class="type_msg">
            <div class="input_msg_write">
              <input type="text" id="ChatText" class="write_msg" onkeyup="enterkey()"/>
              <button class="msg_send_btn" type="button" id="chatsend"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
            </div>
          </div>
        </div>
      </div>
      <p class="text-center top_spac"> Design by <a target="_blank" href="#">Sunil Rajput</a></p>
      
    </div></div>
	</section>
<%@ include file="footer.jsp" %>

<script>
	$(document).ready(function() {
		$("#chatsend").click(function() {
			sendMessage();
		});
	});
	var sock = new SockJS('<c:url value="/echo"/>');
	//메세지가 나한테 전달됫을때 실행되는 함수
	sock.onmessage = onMessage;
	//연결을 해제할때 실행
	sock.onclose = onClose;
	//소켓 연결됫을때 실행됨
	sock.onopen = function () {
		console.log("소켓연결성공");
	}

	//메시지 전송
	function sendMessage(){
		sock.send($("#ChatText").val());
		$('#ChatText').val('')
	}
	//서버로부터 메세지를 받음
	function onMessage(evt) {
		var data = evt.data;
		var message = data.split('|');
		var sender = message[0]; //보내는사람의 세션
		var content = message[1]; //메세지내용
		var sessionid = $('#sessionuserid').val();
		if(sessionid == sender){
			var printHTML = "<div class='outgoing_msg'>";
			printHTML += "<div class='sent_msg'>";
			printHTML += "<p>"+content+"</p>";
			printHTML += "<span class='time_date_right'> 11:01 AM    |    June 9</span> </div>";
			printHTML += "</div>";
			$('#msg_history').append(printHTML);
			if(content==="" || content === null){
				console.log("테스트입니다.")
				sender = "";
				return sock.onclose;
				if(sender === ""){
					return false
				}
			}
		}else{
			var printHTML = '<div class="incoming_msg">';
			printHTML += '<div class="incoming_msg_img">';
			printHTML += '<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">';
			printHTML += '</div>';
			printHTML += '<div class="received_msg">';
			printHTML += '<div class="received_withd_msg">';
			printHTML += '<p>'+content+'</p>';
			printHTML += '<span class="time_date_left">시간';
			printHTML += '</span></div>';
			printHTML += '</div>';
			printHTML += '</div>';
			$('#msg_history').append(printHTML);
			if(content==="" || content === null){
				console.log("테스트입니다.")
				sender = "";
				return sock.onclose;
				if(sender === ""){
					return false
				}
			}
		}
	}
	//서버로부터 연결이 끊음
	function onClose(evt){
		alert("채팅서버에 문제가 발생했습니다. 다시 접속해주세요.");
		console.log("소켓끊김");
	}
	//엔터키로 인한 입력처리
  	function enterkey() {
        if (window.event.keyCode == 13) {
        	sendMessage();
        }
    }
</script>
