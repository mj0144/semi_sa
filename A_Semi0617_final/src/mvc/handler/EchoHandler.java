package mvc.handler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Configuration
public class EchoHandler extends TextWebSocketHandler{
	//로그인한 전체
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	
	private Map<String, Object> userSession;
	private String userid;

	//클라이언트가 연결 되었을때 실행함
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("커넥션완료");
		sessionList.add(session);
		logger.info("{} 연결됨 ", session.getId());
	}

	//메세지 전송 실행 메소드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("핸들텍스트메세지");
		userSession = session.getAttributes();
		userid = userSession.get("user_num").toString();
		System.out.println("유저아이디"+userid);
		System.out.println("메세지"+message.getPayload());
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(userid + "|" + message.getPayload()));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		System.out.println("소켓 닫혔어요");
		logger.info("{} 연결 끊겼뜸.", session.getId());
	}
}
