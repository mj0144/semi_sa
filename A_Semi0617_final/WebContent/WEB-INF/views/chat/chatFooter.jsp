<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
		sock.onerror = function(evt) {
            onError(evt)
        };
		function onError(evt) {
            writeToScreen('ERROR: ' + evt.data);
        }
		var sessionid = $('#sessionuserid').val();
		//메시지 전송
		//메세지 전송 function을 onMessage에 넣어서 ajax 처리하기
		var requestChat;
		var responeChat;
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
				var param = new Object();
				var chatRoom = $("#roomNumber").val();
				if(chatRoom == "" || chatRoom == null){
					chatRoom = " ";
				}
				param.chatroom = chatRoom;
				param.chatcontent = content;
				param.chatuser = sessionid;
				var paramJson = JSON.stringify(param);
				$.ajax({
					type : "POST",
					url : "chatInsert",
					contentType : "application/json; charset=utf-8",
					dataType : "json",
					data : paramJson,
					success : function(res){
						if(res.result == "success"){
							console.log("리퀘스트실행"+res.inTo);
							var printHTML = "<div class='outgoing_msg'>";
							printHTML += "<div class='sent_msg'>";
							printHTML += "<input type='hidden' value="+res.inTo["CHATUSER"]+">"
							printHTML += "<input type='hidden' value="+res.inTo["CHATROOM"]+" id='chatRoom'>";
							printHTML += "<p>"+res.inTo["CHATCONTENT"]+"</p>";
							printHTML += "<span class='time_date_right'>"+res.inTo["CHATDATE"]+"</span> </div>";
							printHTML += "</div>";
							$('#msg_history').append(printHTML);
							var objDiv = document.getElementById("msg_history");
							objDiv.scrollTop = objDiv.scrollHeight;
						}else{
							return;
						}
					},
					error:function(request,status,error){
						alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
					}
				});
			}else{
				var chatRoom = $("#roomNumber").val();
				$.ajax({
					type: "POST",
					url : "responeSelect",
					data : "param="+chatRoom,
					success: function (res) {
						console.log("리스폰실행"+JSON.stringify(res));
						var printHTML = '<div class="incoming_msg">';
						printHTML += '<input type="hidden" value='+res["CHATUSER"]+'>';
						printHTML += '<div class="incoming_msg_img">';
						printHTML += '<a href="mypage"><span class="img"';
					    printHTML += 'style="background-image: url(resources/upload/'+res["USER_IMG"]+'")></span></a>';
						printHTML += '<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">';
						printHTML += '</div>';
						printHTML += '<div class="received_msg">';
						printHTML += '<div class="received_withd_msg">';
						printHTML += '<p>'+res["CHATCONTENT"]+'</p>';
						printHTML += '<span class="time_date_left">'+res["CHATDATE"]+'</span></div>';
						printHTML += '<br>';
						printHTML += '</div>';
						printHTML += '</div>';
						$('#msg_history').append(printHTML);
						var objDiv = document.getElementById("msg_history");
						objDiv.scrollTop = objDiv.scrollHeight;
					},
					error: function(request,status,error){
						alert("code = "+ request.status + " message = " + request.responseText + " error = " + error);
					}
				});
			}
		}
		//서버로부터 연결이 끊음
		function onClose(evt){
			alert("채팅서버에 문제가 발생했습니다. 다시 접속해주세요.");
			console.log(evt);
		}
		//엔터키로 인한 입력처리
		function enterkey() {
	    if (window.event.keyCode == 13) {
	    	sendMessage();
	    	}
		}
		//채팅방 목록
		setTimeout(function roomList() {
			console.log(sessionid);
			$.ajax({
				type : "POST",
				url : "roomList",
				data : "param="+sessionid,
				success : function (res) {
					for (var i = 0; i < res.length; i++) {
						var map = res[i];
						var printHTML = '<a href="chatmessage?room='+map["CHATROOM"]+'">';
						if(res.length == 1){
							printHTML +='<div class="chat_list active_chat">';
						}else{
							printHTML +='<div class="chat_list">';
						}
						printHTML += '<div class="chat_people">';
						printHTML += '<div class="chat_img"> <img src='+map["USER_IMG"]+' alt="sunil"> </div>';
						printHTML += '<div class="chat_ib">';
						printHTML += '<input type="hidden" id="user1" value='+map["USER1"]+'>';
						printHTML += '<h5>'+map["NICKNAME"];
						printHTML += '</div>';
						printHTML += '</div>';
						printHTML += '</div>';
						printHTML += '</a>';
						$("#inbox_chat").append(printHTML);
					}
					var objDiv = document.getElementById("msg_history");
					objDiv.scrollTop = objDiv.scrollHeight;
				}
			})
		}, 0);
		
/* 			if(sessionid == map["USER_NUM"]){
				var printHTML = "<div class='outgoing_msg'>";
				printHTML += "<div class='sent_msg'>";
				printHTML += "<input type='hidden' id='roomNum'>";
				printHTML += "<p>"+map["CHATCONTENT"]+"</p>";
				printHTML += "<span class='time_date_right'>"+map["CHATDATE"]+"</span> </div>";
				printHTML += "</div>";
				$('#msg_history').append(printHTML);
			}else{
				var printHTML = '<div class="incoming_msg">';
				printHTML += '<div class="incoming_msg_img">';
				printHTML += "<input type='hidden' id='roomNum'>";
				printHTML += "<a href='mypage'><span class='img'";
			    printHTML += "style='background-image: url(resources/upload/"+map["USER_IMG"]+"');'></span></a>";
				printHTML += '<img src="https://ptetutorials.com/images/user-profile.png" alt="sunil">';
				printHTML += '</div>';
				printHTML += '<div class="received_msg">';
				printHTML += '<div class="received_withd_msg">';
				printHTML += '<p>'+map["CHATCONTENT"]+'</p>';
				printHTML += '<span class="time_date_left">'+map["CHATDATE"];
				printHTML += '</span></div><br>';
				printHTML += '</div>';
				printHTML += '</div>';
				printHTML += '<br>';  */
</script>
