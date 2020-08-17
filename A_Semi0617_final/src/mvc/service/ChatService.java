package mvc.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.ChatDao;

@Service //�ۼ�������
public class ChatService{
	
	@Autowired
	ChatDao chatdao;
	
	//ä�� �Է�ó��
	public int insertChat(HashMap<String,Object> params) throws Exception{
		return chatdao.chatInsert(params);
	}
	//ä�� ����
	public List<HashMap<String, Object>> chatList(int roomNum) throws Exception{
		return chatdao.chatList(roomNum);
	}
}