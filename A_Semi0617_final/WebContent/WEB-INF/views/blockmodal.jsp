<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!-- 이동현 -->

<meta charset="EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width-device-width, inital-scale=1">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="modal-header">
<h5 class="modal-title" id="modalheader">차단된 유저 목록</h5>
<button type="button" class="close" data-dismiss="modal" aria-label="Close">
<span aria-hidden="true">&times;</span>
</button>
</div>
<div class="modal-body">
    <div class="table-responsive">
        <div class="container">
        </div>
        <table class="table table-hover">
            <tbody class="text-center">
            <c:forEach items="${list}" var="e">
                <tr class="content" style="font-size: 12px;">
                    <td class="text-left">
                    <a href="javascript:sendChildValue('${e.BLOCKED_USER}')">
                    	${e.NICKNAME }
                    </a>
                    </td>
                    <td class="text-center">
                    <img src="resources/img/btn/like.png" style="width: 50px; cursor: pointer;"
                     class="blockox">
                     <input type="hidden" id="user_num" value="${e.BLOCKED_USER}">
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<div class="modal-footer">
<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
</div>

	<script>
		$(document).on('click', '.blockox', function(event) {
			
			var block = 'false';
			
			var blockon = "resources/img/btn/dislike.png"; //블락 하기
			var blockoff = "resources/img/btn/like.png"; //블락 해제
			
			var user_num = ${sessionScope.user_num};
			
			if ($(this).attr("src") === blockon) {
					$(this).attr("src", "resources/img/btn/like.png"); //블락취소
					block='true';
			} else if($(this).attr("src") === blockoff){
					$(this).attr("src", "resources/img/btn/dislike.png"); //블락
					block='false';
			}
			
			var pm = {"block" : block, "blocked_user" : $('#user_num').val()};
			
			blocked(pm);
	
		});
		
		function blocked(pm){
					
			$.ajax({
					url : "blockox",
					type : "post",
					data : pm,
					success : function(data){
					},
					error : function(request, error){
						console.log("code:"+request.status+"\n"+"message:"+request.responsetext+"\n"+"error:"+error);
					}
				});
		}
	</script>
	
	<script>
		$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();   
		});
	</script>


</body>
</html>