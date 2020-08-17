package mvc.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import mvc.service.FeedAbstract;
import mvc.vo.NotifyVO;

@Repository //�ۼ��� ����
public class NotifyDao extends FeedAbstract{
	
	private String nameSpace = "Notify.";
	
	//������ �˶� ��ü����
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> selectNotify(HashMap<String,Object> params) throws Exception{
		return (List<HashMap<String, Object>>) selectList(nameSpace+"NotifySelect", params);
	}
	//�˶� ��ư
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> buttonNotify(HashMap<String,Object> params) throws Exception{
		return (HashMap<String, Object>) selectOne(nameSpace+"ButtonNotify", params);
	}
	//�˶� ���� insert
	public int Notifyinsert(NotifyVO vo) throws Exception{
		return insert("Notify.Notifyin", vo);
	}
}
