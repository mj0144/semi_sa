<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<title>인증번호입력</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<form action="passinjeung?dice=${dice }&email=${email}" method="post">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>입력한 이메일로 받은 인증번호를 입력하세요. (인증번호가 맞아야 비밀번호를 변경하실 수 있습니다.)</h3>
			</div>
			<div>
				<h5>
					인증번호 입력 : </h5><input type="number" name="pass_injeung"
                                placeholder="  인증번호를 입력하세요. ">
				
				<p class="w3-center">
					<button type="submit" id="Btn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">인증번호 전송</button>
				</p>
			</div>
		</div>
		</form>
	</div>
</body>
</html>