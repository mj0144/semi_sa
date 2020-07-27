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
	
	// UNIX Timestamp��ȯ
	private String TimestampToDate(String timestame) {
		long timestame_long = Long.parseLong(timestame);
		Date date = new Date(timestame_long * 1000L);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		//�׸���ġ ǥ�ؽ� �Ǵ� �׸���ġ ǥ�ؽ� (GMT)�� ���� �׸���ġ���ִ� �ո� õ������ �ð� �ð�
		sdf.setTimeZone(TimeZone.getTimeZone("GMT+9")); // GMT+9 => ID-TimeZone�� ID
	
		return sdf.format(date);
	}
	
	
	public void payListInsert(PaymentVO vo) {
		vo.setPaid_date(TimestampToDate(vo.getPaid_date())); //UNIX Timestame�� ��ȯ date�������� ��ȯ
		payDao.payListInsert(vo); //paylist���̺� ��������.

	}

}
