<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

      $(document).ready(function(){
         var session  ='<%=session.getAttribute("user_num")%>
	'
		console.log(session);

		if (session === '' || session === 'null') {
			alert('로그인이 만료되었습니다.다시로그인바람');
			document.location.href = "login";
		}
	});
</script>

<title>h</title>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Herr+Von+Muellerhoff"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">


<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">

<script type="text/javascript" src="se2/js/HuskyEZCreator.js"
	charset="EUC-KR"></script>
<script type="text/javascript"
	src="//code.jquery.com/jquery-1.11.0.min.js" charset="EUC-KR"></script>
</head>
<body>

	<div id="colorlib-page">