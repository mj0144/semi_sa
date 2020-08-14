package mvc.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.ChatDao;

@Service
public class ChatService{
	
	@Autowired
	ChatDao chatdao;
	
	//채팅조회
	@SuppressWarnings("unchecked")
	public Map<Object, Object> ListAll(int user_num) throws Exception{
		return (Map<Object, Object>) chatdao.chatList(user_num);
	}
}