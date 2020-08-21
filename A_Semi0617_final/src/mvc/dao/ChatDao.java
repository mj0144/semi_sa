package mvc.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import mvc.service.FeedAbstract;
import mvc.vo.ChatVO;

@Repository
public class ChatDao extends FeedAbstract{
	private String nameSpace = "chat.";
	
	//ä�ø޼��� insert
	public int chatInsert(HashMap<String,Object> params) throws Exception{
		return (int) insert(nameSpace+"chatIn", params);
	}
	//ä��room Number insert
	public int roomInsert(int user1) throws Exception {
		return (int) insert(nameSpace+"roomIn", user1);
	}
	//1:1 ä�� ����
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> chatList(int roomNum) throws Exception{
		return (List<HashMap<String, Object>>) selectList(nameSpace+"meList", roomNum);
	}
	//ä�ù���
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> roomSelect(int chat_num) throws Exception{
		return (List<HashMap<String, Object>>) selectList(nameSpace+"roomSelect", chat_num);
	}
	//ä�ó���
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> inToSelect(HashMap<String, Object> params) throws Exception{
		return (HashMap<String, Object>) selectOne(nameSpace+"inToSelect", params);
	}
	//1:1ä�� ���� ����
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> responeSelect(int roomNum) throws Exception{
		return (HashMap<String, Object>) selectOne(nameSpace+"responeSelect", roomNum);
	}
	//ä�ù� ��û�ѻ�� ���� ����Ʈ
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> responeChatList(int usernum) throws Exception{
		return (List<HashMap<String, Object>>) selectList(nameSpace+"responeChatList", usernum);
	}
	public void reqChatOK(HashMap<String, Object> params) throws Exception{
		update(nameSpace+"reqChatOK", params);
	}
	
	
	
}