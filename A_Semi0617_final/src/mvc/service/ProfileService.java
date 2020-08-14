package mvc.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.ProfileDao;
import mvc.vo.MemberVO;

// (성현)

@Service
public class ProfileService {

	@Autowired
	private ProfileDao profileDao;

	// 마이페이지- 이름, 이미지, 자기소개 제외
	public MemberVO result_basic(HttpSession session) {
		int num = (int) session.getAttribute("user_num");
		MemberVO vo = new MemberVO();
		return vo=profileDao.result_basic(num);
	 
	}
}
