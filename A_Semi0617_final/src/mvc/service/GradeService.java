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
		return gradeDao.gradeChk(user_num);		
	}
	
	
	//���ϱ� ä�ñ� ��� -> ������Ʈ
	public void leftCountUpdate(int user_num, HttpSession session) {
		gradeDao.leftCountUpdate(user_num);
		
		//ä�ñ� ���� ������Ʈ
		int chatChk = gradeDao.ChatChk(user_num);
		session.setAttribute("chatcount", chatChk);
		
	}
	
	
	
	
}
