package mvc.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.ChatDao;

@Service
public class ChatService{
	
	@Autowired
	ChatDao chatdao;
	
	//ä����ȸ
	@SuppressWarnings("unchecked")
	public Map<Object, Object> ListAll(int user_num) throws Exception{
		return (Map<Object, Object>) chatdao.chatList(user_num);
	}
}