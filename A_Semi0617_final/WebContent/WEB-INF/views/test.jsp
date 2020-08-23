<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div id="result"> </div>
</body>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$.ajax({
	    url : "http://192.168.0.172:8000/dpl/result",
	    success : function(data){
	       data = data.replace(/&#x27;/gi, '"').replace(/&#x27;/gi, '"')
	       data = JSON.parse(data)
	       console.log(data)
   
	       $("#result").text(data['일에는'])
	    },
	    error : function(){
	    }
	 });
</script>
</html>