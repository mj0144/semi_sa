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
	
	//등급 체크
	public List<String> gradeChk(int user_num) { 
		return gradeDao.gradeChk(user_num);		
	}
	
	
	//단일권 채팅권 사용 -> 업데이트
	public void leftCountUpdate(int user_num, HttpSession session) {
		gradeDao.leftCountUpdate(user_num);
		
		//채팅권 세션 업데이트
		int chatChk = gradeDao.ChatChk(user_num);
		session.setAttribute("chatcount", chatChk);
		
	}
	
	
	
	
}
