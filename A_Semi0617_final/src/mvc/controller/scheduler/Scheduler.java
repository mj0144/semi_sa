package mvc.controller.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import mvc.dao.PageListDao;

//�̵���
@Component
public class Scheduler {
	
	@Autowired
	PageListDao pagelistDao;
	
	//���� 0�ø��� ��õ���� ���� ���� ����
	@Scheduled(cron = "0 0 0 * * *")
	public void deleteRProfile() {
		pagelistDao.delRprofile();
	}

}
