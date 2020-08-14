package mvc.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.ProfileDao;
import mvc.vo.MemberVO;

		//(����)
@Service
public class DeleteService {

	@Autowired
	private ProfileDao profileDao;

	// ȸ��Ż��
	public MemberVO delete(HttpSession session) {
		int num = (int) session.getAttribute("user_num");
		
		MemberVO vo = profileDao.delete(num);
		return vo;
	 
	}
	
	// ȸ��Ż���ư������
	public void deleteconfirm(MemberVO vo) {
		
		profileDao.deleteconfirm(vo);
	 
	}
}
