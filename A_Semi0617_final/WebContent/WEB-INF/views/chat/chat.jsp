<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="chatRoom.jsp"%>
    	<div class="msg_history" id="msg_history">
    		<!-- 상대가보낸거 -->
			<div class="incoming_msg">
            	<div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> 
             	</div>
            <div class="received_msg">
                <div class="received_withd_msg">
                  <p>인연과 대화를 나눠보세요.<br>
                  상대방에게 채팅 신청 후,<br>
                     상대방이 요청에 승락하면 채팅방이 개설됩니다.
                  </p>
                  <span class="time_date_left"></span></div>
              </div>
            </div>
        </div>
<%@ include file="chatFooter.jsp"%>