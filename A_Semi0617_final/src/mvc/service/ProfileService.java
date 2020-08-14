package mvc.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.ProfileDao;
import mvc.vo.MemberVO;

// (����)

@Service
public class ProfileService {

	@Autowired
	private ProfileDao profileDao;

	// ����������- �̸�, �̹���, �ڱ�Ұ� ����
	public MemberVO result_basic(HttpSession session) {
		int num = (int) session.getAttribute("user_num");
		MemberVO vo = new MemberVO();
		return vo=profileDao.result_basic(num);
	 
	}
}
