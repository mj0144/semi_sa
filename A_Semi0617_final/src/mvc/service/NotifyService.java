package mvc.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.NotifyDao;
import mvc.vo.NotifyVO;

@Service //�ۼ��� ����
public class NotifyService {
	@Autowired
	private NotifyDao notifydao;
	
	//�˶���ü����
	public List<HashMap<String, Object>> selectNotify(HashMap<String,Object> params) throws Exception{
		return notifydao.selectNotify(params);
	}
	//�˶� ��ư
	public HashMap<String, Object> buttonNotify(HashMap<String, Object> params) throws Exception{
		return notifydao.buttonNotify(params);
	}
	//�˶����� insert
	public int Notifyinsert(NotifyVO vo) throws Exception{
		return notifydao.Notifyinsert(vo);
	}
}
