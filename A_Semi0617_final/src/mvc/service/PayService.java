package mvc.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.PayDao;
import mvc.vo.PaymentVO;

@Service
public class PayService {

	@Autowired
	private PayDao payDao;
	
	// UNIX Timestamp변환
	private String TimestampToDate(String timestame) {
		long timestame_long = Long.parseLong(timestame);
		Date date = new Date(timestame_long * 1000L);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		//그리니치 표준시 또는 그리니치 표준시 (GMT)는 런던 그리니치에있는 왕립 천문대의 시계 시간
		sdf.setTimeZone(TimeZone.getTimeZone("GMT+9")); // GMT+9 => ID-TimeZone의 ID
	
		return sdf.format(date);
	}
	
	
	public void payListInsert(PaymentVO vo) {
		vo.setPaid_date(TimestampToDate(vo.getPaid_date())); //UNIX Timestame을 변환 date형식으로 변환
		payDao.payListInsert(vo); //paylist테이블에 정보저장.

	}

}
