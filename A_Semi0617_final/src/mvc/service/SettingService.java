package mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.SettingDao;
import mvc.vo.PaymentVO;

@Service
public class SettingService {
	
	@Autowired
	private SettingDao settingDao;
	
	public List<PaymentVO> payListModal(int user_num){
		return settingDao.payListModal(user_num);
	}
	
}
