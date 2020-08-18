	var message;
	function notifyon(evt) {
		var a = evt.split('|');
		console.log("notify로 날라온 매게변수 : "+a);
		var data = a[0]; //날라온 알림이 무엇인지 구분
		var link = a[1]; //알림의 링크
		var nickname = a[2]; //닉네임
		console.log(nickname);
		if(data == '' || data == null){
			alert('문제가 발생했습니다. 다시 시도 해주세요.');
			return false
		}
		if(data == '댓글'){
			message = nickname+'님이 회원님의 게시글에 댓글을 달았습니다.';
		}
		if(data == '대댓글'){
			message = nickname+'님이 회원님의 댓글에 답글을 달았습니다.';
		}
		if(data == '채팅'){
			message = nickname+'님이 회원님에게 채팅을 요청하였습니다.';
		}
		var result = message+"|"+link+"|"+nickname;
		console.log(result);
		sock.send(result);
	}
	var sock = new SockJS('http://localhost/AFinal/echo');
	sock.onmessage = function onMessage(evt) {
		var data = evt.data;
		var notifyss = data.split('|');
		var sender = notifyss[0];
		message = notifyss[1];
		var link = notifyss[2];
		var sessionid = $('#session_id_ssg').val();
		if(sessionid != sender){
			$.notify({
			    icon: 'resources/img/bell.png',
			    title: '새 알림',
			    message: message,
			    url: link,
			    target: '_blank'
			},{
				element: 'body',
			    type: 'minimalist',
			    delay: 100000,
			    icon_type: 'image',
			    position: 'fixed',
			    placement: {
			    	from: 'bottom',
					align: 'left'
				},
				offset: 30,
				spacing: 10,
				z_index: 1031,
				delay: 1000,
				timer: 1000,
				url_target: '_blank',
				mouse_over: null,
				animate: {
					enter: 'animate__animated animate__fadeInUp',
					exit: 'animate__animated animate__fadeOutDown'
				},
				onShow: null,
				onShown: null,
				onClose: null,
				onClosed: null,
			    template:
			    '<div data-notify="container" class="col-xs-11 col-sm-3 alert alert-{0}" role="alert">' +
			    '<span data-notify="title">{1}</span>' +
			    '<img data-notify="icon" class="img-circle pull-left">' +
			    '<span data-notify="message">{2}</span>' +
			    '<div class="progress" data-notify="progressbar">' +
					'<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>' +
				'</div>' +
				'<a href="{3}" target="{4}" data-notify="url"></a>' +
			    '</div>'
			});
			notifycations();
		}
	}

	sock.onclose = function onClose() {
		alert("알람창 서버 오류 다시 접속해주세요");
		console.log("notify서버 연결끊김");
	}
	sock.onopen = function(){
		console.log("notify 소켓 연결 성공");
	}
