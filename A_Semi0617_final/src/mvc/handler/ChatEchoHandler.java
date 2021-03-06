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
public class ChatEchoHandler extends TextWebSocketHandler{
   //�α����� ��ü
   private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
   
   private static Logger logger = LoggerFactory.getLogger(ChatEchoHandler.class);
   
   private Map<String, Object> userSession;
   private String userid;
   //suyeon start----------------------------------------------------------------
    private Map<String, Object> map;
     private String user_num;
   //end-------------------------------------------------------------------------
     
     
   //Ŭ���̾�Ʈ�� ���� �Ǿ����� ������
   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
      System.out.println("Ŀ�ؼǿϷ�");
      sessionList.add(session);
      logger.info("{} ����� ", session.getId());
   }

   //�޼��� ���� ���� �޼ҵ�
   @Override
   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
      userSession = session.getAttributes();
      userid = userSession.get("user_num").toString();


      
      
      logger.info("{}�� ���� {} ����", session.getId(), message.getPayload());
	  for(WebSocketSession sess : sessionList) {
		sess.sendMessage(new TextMessage(userid + "|" + message.getPayload()));
	  }
   }
   
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      sessionList.remove(session);
      System.out.println("���� �������");
      logger.info("{} ���� �����.", session.getId());
   }
   
   @Override
   public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
      sessionList.remove(session);
       logger.info("{} ���� �����.", session.getId());
   }
}