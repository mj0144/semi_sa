package mvc.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.vo.PaymentVO;

@Repository
public class SettingDao {
	
	@Autowired
	SqlSession ss;
	
	//setting���� ������� ��������
	public List<PaymentVO> payListModal(int user_num) {
		return ss.selectList("setting.payList", user_num);
	}
}
