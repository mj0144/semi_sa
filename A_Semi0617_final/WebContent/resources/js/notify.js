/*	var message;
	function notifyon(evt) {
		var a = evt.split('|');
		var data = a[0];
		var link = a[1];
		var nickname = a[2];
		console.log(nickname);
		if(data == '' || data == null){
			alert('������ �߻��߽��ϴ�. �ٽ� �õ� ���ּ���.');
			return false
		}
		if(data == '���'){
			message = nickname+'���� ȸ������ �Խñۿ� ����� �޾ҽ��ϴ�.';
		}
		if(data == '����'){
			message = nickname+'���� ȸ������ ��ۿ� ����� �޾ҽ��ϴ�.';
		}
		var result = message+"|"+link+"|"+nickname;
		console.log(result);
		sock.send(result);
	}
	var sock = new SockJS('http://localhost:8080/AFinal/echo');
	var notification;
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
			    title: '�� �˸�',
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
			    '<button type="button" aria-hidden="true" class="close" data-notify="dismiss">x</button>' +
			    '<span data-notify="title">{1}</span>' +
			    '<img data-notify="icon" class="img-circle pull-left">' +
			    '<span data-notify="message">{2}</span>' +
			    '<div class="progress" data-notify="progressbar">' +
					'<div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>' +
				'</div>' +
				'<a href="{3}" target="{4}" data-notify="url"></a>' +
			    '</div>'
			});
		}
	}

	sock.onclose = function onClose() {
		alert("�˶�â ���� ���� �ٽ� �������ּ���");
		console.log("notify���� �������");
	}
	sock.onopen = function(){
		console.log("notify ���� ���� ����");
	}*/
