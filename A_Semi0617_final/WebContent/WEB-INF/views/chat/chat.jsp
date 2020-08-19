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
                  <p>상대가보낸거</p>
                  <span class="time_date_left"> 11:01 AM    |    June 9</span></div>
              </div>
            </div>
            <!-- 내가보낸거 -->
            <div class="outgoing_msg">
              <div class="sent_msg">
                <p>내가보낸거</p>
                <span class="time_date_right"> 11:01 AM    |    June 9</span> </div>
            </div>
        </div>
<%@ include file="chatFooter.jsp"%>