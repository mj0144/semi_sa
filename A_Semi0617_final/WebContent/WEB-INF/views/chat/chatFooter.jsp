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

<script>
		$(document).ready(function() {
			$("#chatsend").click(function() {
				sendMessage();
			});
		});
		var sock = new SockJS('<c:url value="/chatEcho"/>');
		//�޼����� ������ ���޵����� ����Ǵ� �Լ�
		sock.onmessage = onMessage;
		//������ �����Ҷ� ����
		sock.onclose = onClose;
		//���� ��������� �����
		sock.onopen = function () {
			console.log("���Ͽ��Ἲ��");
		}
		sock.onerror = function(evt) {
            onError(evt)
        };
		function onError(evt) {
            writeToScreen('ERROR: ' + evt.data);
        }
		var sessionid = $('#sessionuserid').val();
		//�޽��� ����
		//�޼��� ���� function�� onMessage�� �־ ajax ó���ϱ�
		var requestChat;
		var responeChat;
		function sendMessage(){
			sock.send($("#ChatText").val());
			$('#ChatText').val('')
		}
		//�����κ��� �޼����� ����
		function onMessage(evt) {
			var data = evt.data;
			var message = data.split('|');
			var sender = message[0]; //�����»���� ����
			var content = message[1]; //�޼�������
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
							console.log("������Ʈ����"+res.inTo);
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
						console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
					}
				});
			}else{
				setTimeout(function() {
					var chatRoom = $("#roomNumber").val();
					$.ajax({
						type: "POST",
						url : "responeSelect",
						data : "param="+chatRoom,
						success: function (res) {
							console.log("����������"+JSON.stringify(res));
							var printHTML = '<div class="incoming_msg">';
							printHTML += '<input type="hidden" value='+res["CHATUSER"]+'>';
							printHTML += '<div class="incoming_msg_img">';
						    printHTML += '<img src="resources/upload/'+res["USER_IMG"]+'">';
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
							console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
						}
					});
			}, 100);
		}
	}
		//�����κ��� ������ ����
		function onClose(evt){
			alert("ä�ü����� ������ �߻��߽��ϴ�. �ٽ� �������ּ���.");
			console.log(evt);
		}
		//����Ű�� ���� �Է�ó��
		function enterkey() {
	    if (window.event.keyCode == 13) {
	    	sendMessage();
	    	}
		}
		//ä�ù� ���
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
						printHTML += '<div class="chat_img"> <img src=resources/upload/'+map["USER_IMG"]+'> </div>';
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
</script>
