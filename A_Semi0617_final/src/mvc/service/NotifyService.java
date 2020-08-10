package mvc.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.NotifyDao;

@Service //송성근 제작
public class NotifyService {
	@Autowired
	private NotifyDao notifydao;
	
	//알람전체보기
	public List<HashMap<String, Object>> selectNotify(HashMap<String,Object> params) throws Exception{
		return notifydao.selectNotify(params);
	}
	//알람 버튼
	public HashMap<String, Object> buttonNotify(HashMap<String, Object> params) throws Exception{
		return notifydao.buttonNotify(params);
	}
 
}
