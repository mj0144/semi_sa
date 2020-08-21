package mvc.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.ChatDao;

@Service //�ۼ�������
public class ChatService{
	
	@Autowired
	ChatDao chatdao;
	
	//ä�� �Է�ó��
	public int insertChat(HashMap<String,Object> params) throws Exception{
		int result = 0;
		try {
			result = chatdao.chatInsert(params);
			for(int i=0; i<result; i++) {
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	//ä�� ����
	public List<HashMap<String, Object>> chatList(int roomNum) throws Exception{
		return chatdao.chatList(roomNum);
	}
	//ä�ù� ���
	public List<HashMap<String, Object>> roomSelect(int user_num) throws Exception{
		return chatdao.roomSelect(user_num);
	}
	//ä�ó��� 1�� request
	public HashMap<String, Object> inToSelect (HashMap<String, Object> params) throws Exception{
		return chatdao.inToSelect(params);
	}
	//ä�ó��� 1�� respone
	public HashMap<String, Object> responeSelect (int roomNum) throws Exception{
		return chatdao.responeSelect(roomNum);
	}
	//ä�� ��û
	public int roomInsert(int user1) throws Exception{
		return chatdao.roomInsert(user1);
	}
	//ä�ý�û�� ��������
	public List<HashMap<String, Object>> responeChatList (int usernum) throws Exception{
		return chatdao.responeChatList(usernum);
	}
	public void reqChatOK (HashMap<String, Object> params) throws Exception{
		chatdao.reqChatOK(params);
	}
	
}