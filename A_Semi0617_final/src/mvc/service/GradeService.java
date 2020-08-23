package mvc.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.GradeDao;

@Service
public class GradeService {
	
	@Autowired
	private GradeDao gradeDao;
	private boolean chatchk;
	private boolean listchk;
	
	//��� üũ
	public List<String> gradeChk(int user_num) { 
		return gradeDao.gradeCodeChk(user_num);		
	}
	
	
	//���ϱ� ä�ñ� ��� -> ������Ʈ
	public void leftCountUpdate(int user_num, HttpSession session) {
		gradeDao.leftCountUpdate(user_num);
		
		//ä�ñ� ���� ������Ʈ
		int chatChk = gradeDao.chatChk(user_num);
		session.setAttribute("chatcount", chatChk);
		
		if(chatChk ==0) {
			String grade_name = gradeDao.gradeChk(user_num);
			session.setAttribute("grade_name", grade_name);
		}
		
	}
	
	
	
	
}
