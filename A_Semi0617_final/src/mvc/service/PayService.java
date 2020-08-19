package mvc.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
	
	
	public void payListInsert(PaymentVO vo, HttpSession session) {
		vo.setPaid_date(TimestampToDate(vo.getPaid_date())); //UNIX Timestame을 변환 date형식으로 변환
		//아이디값 가져오기.
		String user_id = payDao.selectUserId(vo.getBuyer_num());
		vo.setUser_id(user_id);
		
		
		//단품 상품
		if(vo.getProduct_num() == 1) {			
			payDao.paySingleListInsert(vo); //paylist테이블에 정보저장.			
		}else {
			//세트 상품
			vo = Expiary_date_cal(vo); // 종료일 계산.
			payDao.paySetListInsert(vo);			
		}
		
		//세션값 업데이트
		session.setAttribute("chatcount", payDao.chatCount(vo.getBuyer_num()));
		session.setAttribute("grade_name", payDao.gradeName(vo.getBuyer_num()));
	}
	
	
	//종료일 계산.
	public PaymentVO Expiary_date_cal(PaymentVO vo) {
		int amount = vo.getPaid_count();

//		SimpleDateFormat format= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//		Calendar calendar = Calendar.getInstance();
//		
//		try {
//			Date paid_date = format.parse(vo.getPaid_date());
//			calendar.setTime(paid_date);
//			 
//			calendar.add(Calendar.DATE, 30*amount);
//			
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		DateTimeFormatter formate = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");		
		LocalDateTime date = LocalDateTime.parse(vo.getPaid_date(), formate);
		
		//구매한 갯수만큼 종료일 연장
		date = date.plusDays(30*amount);
	
		//종료일 설정.
		vo.setExpiry_date(date.format(formate));		
		return vo;
		
	}
	
	

}
