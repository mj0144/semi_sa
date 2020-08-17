package mvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.ChatDao;

@Service //송성근제작
public class ChatService{
	
	@Autowired
	ChatDao chatdao;
	
	//채팅 입력처리
	public int insertChat(HashMap<String,Object> params) throws Exception{
		return chatdao.chatInsert(params);
	}
	//채팅 내역
	public List<HashMap<String, Object>> chatList(int roomNum) throws Exception{
		return chatdao.chatList(roomNum);
	}
}