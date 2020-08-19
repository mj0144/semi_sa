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
	
	// UNIX Timestamp��ȯ
	private String TimestampToDate(String timestame) {
		long timestame_long = Long.parseLong(timestame);
		Date date = new Date(timestame_long * 1000L);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		//�׸���ġ ǥ�ؽ� �Ǵ� �׸���ġ ǥ�ؽ� (GMT)�� ���� �׸���ġ���ִ� �ո� õ������ �ð� �ð�
		sdf.setTimeZone(TimeZone.getTimeZone("GMT+9")); // GMT+9 => ID-TimeZone�� ID
	
		return sdf.format(date);
	}
	
	
	public void payListInsert(PaymentVO vo, HttpSession session) {
		vo.setPaid_date(TimestampToDate(vo.getPaid_date())); //UNIX Timestame�� ��ȯ date�������� ��ȯ
		//���̵� ��������.
		String user_id = payDao.selectUserId(vo.getBuyer_num());
		vo.setUser_id(user_id);
		
		
		//��ǰ ��ǰ
		if(vo.getProduct_num() == 1) {			
			payDao.paySingleListInsert(vo); //paylist���̺� ��������.			
		}else {
			//��Ʈ ��ǰ
			vo = Expiary_date_cal(vo); // ������ ���.
			payDao.paySetListInsert(vo);			
		}
		
		//���ǰ� ������Ʈ
		session.setAttribute("chatcount", payDao.chatCount(vo.getBuyer_num()));
		session.setAttribute("grade_name", payDao.gradeName(vo.getBuyer_num()));
	}
	
	
	//������ ���.
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
		
		//������ ������ŭ ������ ����
		date = date.plusDays(30*amount);
	
		//������ ����.
		vo.setExpiry_date(date.format(formate));		
		return vo;
		
	}
	
	

}
