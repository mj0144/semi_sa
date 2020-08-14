package mvc.service;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.ProfileDao;

 	//(����)
@Service
public class LikeService {

	@Autowired
	private ProfileDao profileDao;

	//�ȷο�
	public int like1(HttpSession session) {
		int num = (int) session.getAttribute("user_num");
		return profileDao.cnt1(num);
	}
	//�ȷο�
	public int like2(HttpSession session) {
		int num = (int) session.getAttribute("user_num");
		return profileDao.cnt2(num);

	}
}
