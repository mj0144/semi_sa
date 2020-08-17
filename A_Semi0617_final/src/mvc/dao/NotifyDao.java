package mvc.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import mvc.service.FeedAbstract;
import mvc.vo.NotifyVO;

@Repository //송성근 제작
public class NotifyDao extends FeedAbstract{
	
	private String nameSpace = "Notify.";
	
	//개개인 알람 전체보기
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> selectNotify(HashMap<String,Object> params) throws Exception{
		return (List<HashMap<String, Object>>) selectList(nameSpace+"NotifySelect", params);
	}
	//알람 버튼
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> buttonNotify(HashMap<String,Object> params) throws Exception{
		return (HashMap<String, Object>) selectOne(nameSpace+"ButtonNotify", params);
	}
	//알람 내용 insert
	public int Notifyinsert(NotifyVO vo) throws Exception{
		return insert("Notify.Notifyin", vo);
	}
}
