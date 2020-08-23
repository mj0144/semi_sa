<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="chatRoom.jsp"%>
   	<div class="msg_history" id="msg_history">
   	<input type="hidden" id = "roomNumber" value="${roomNum }">
    	<c:forEach var="item" items="${map }">
    		<!-- 내가보낸 내용 -->
    		<c:if test="${sessionScope.user_num == item.CHATUSER }">
    		<div class="outgoing_msg">
              <div class="sent_msg">
              <input type="hidden" value="${item.CHATUSER }"><input type="hidden" value="${item.CHATROOM }" id="chatRoom">
                <p>${item.CHATCONTENT}</p>
                <span class="time_date_right"> ${item.CHATDATE }</span> </div>
            </div>
            </c:if>
    		<c:if test="${sessionScope.user_num != item.CHATUSER}">
    		<!-- 다른사용자가 보낸내용 -->
			<div class="incoming_msg">
			<input type="hidden" value="${item.CHATUSER }">
            	<div class="incoming_msg_img">
            	<img src="resources/upload/${item.USER_IMG}">
             	</div>
            <div class="received_msg">
                <div class="received_withd_msg">
                  <p>${item.CHATCONTENT}</p>
                  <span class="time_date_left"> ${item.CHATDATE }</span></div>
              </div>
            </div>
            </c:if>
       	</c:forEach>
    </div>
<%@ include file="chatFooter.jsp"%>