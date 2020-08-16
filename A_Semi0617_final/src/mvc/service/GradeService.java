package mvc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.GradeDao;

@Service
public class GradeService {
	
	@Autowired
	private GradeDao gradeDao;
	private boolean chatchk;
	private boolean listchk;
	
	public List<String> gradeChk(int user_num) {
 
		return gradeDao.gradeChk(user_num);		
	}
	
	public void leftCountUpdate(int user_num) {
		gradeDao.leftCountUpdate(user_num);
	}
	
	
	
	
}
