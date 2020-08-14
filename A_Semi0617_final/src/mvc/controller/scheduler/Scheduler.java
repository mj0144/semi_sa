package mvc.controller.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import mvc.dao.PageListDao;

//이동현
@Component
public class Scheduler {
	
	@Autowired
	PageListDao pagelistDao;
	
	//매일 0시마다 추천인을 저장 내용 삭제
	@Scheduled(cron = "0 0 0 * * *")
	public void deleteRProfile() {
		pagelistDao.delRprofile();
	}

}
