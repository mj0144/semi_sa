package mvc.service;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.JoinDao;
import mvc.vo.IdealVO;
import mvc.vo.MemberVO;

@Service
public class JoinService {
	
	@Autowired
	private JoinDao joinDao;
	
	
	//���� ������� ���.
	public MemberVO yunYeon(MemberVO vo) {
		String[] array = vo.getBirth().split("-");
		// 2020-06-08;
		vo.setSaju_year(Integer.parseInt(array[0]));
		vo.setSaju_mon(Integer.parseInt(array[1]));
		vo.setSaju_day(Integer.parseInt(array[2]));

		vo.setInfo_year(Integer.parseInt(array[0]));
		vo.setInfo_mon(Integer.parseInt(array[1]));
		vo.setInfo_day(Integer.parseInt(array[2]));

		int year = vo.getSaju_year();

		if (vo.getBirth_hh() == 23 && vo.getBirth_mm() > 30) { // 23�� 30���� �Ѿ�� ���� ��� ������� �޶���. -> ���� ���Ͽ��� �Ϸ縦 ���ؾ���.
			// 1. �����̰� 28�� �̸� 29�Ϸΰ���,
			// 2. �����̰� 29�̸� 3�� 1�Ϸ� �ٲ�.
			// 3. 1, 3, 5, 7, 8, 10���� 31�� ����. -> 30���� ������ �Ϸ� ����.
			// 4. 4 6 9 11 -> 30�ϱ��� ->30���� ������ ���� �����ϰ� ���� 1�Ϸ� �ʱ�ȭ.

			// ��, 12�� 31���� ���� 1�����ϰ�, 1��1�Ϸ� �ʱ�ȭ.

			if (vo.getSaju_mon() == 2) {
				if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) { // ������ ��.
					if (vo.getSaju_day() == 28) { // �����ε� 28���� ������ 29�Ϸ� ó��
						vo.setSaju_day(vo.getSaju_day() + 1);
					} else { // �����ε� 29���� ������ 3�� 1�Ϸ� ó��.
						vo.setSaju_mon(vo.getSaju_mon() + 1);
						vo.setSaju_day(1);
					}
				} else { // 2���ε� ������ �ƴ� ��.

					vo.setSaju_mon(vo.getSaju_mon() + 1); // ���� 1�� �����ϰ�, ���� 1�Ϸ� �ʱ�ȭ.
					vo.setSaju_day(1);
				}
			}

			if (vo.getSaju_day() >= 30 && vo.getSaju_mon() != 2) { // 2���� �ƴϸ鼭 30�� �̻��� ��.
				switch (vo.getSaju_mon()) {
				case 1:
				case 3:
				case 5:
				case 7:
				case 8:
				case 10:
					vo.setSaju_mon(vo.getSaju_mon() + 1); // 30�� ���� �ִ� ������ ���� 1����. ���� 1�� �ʱ�ȭ.
					vo.setSaju_day(1);
					break;
				case 4:
				case 6:
				case 9:
				case 11:
					if (vo.getSaju_day() == 30) { // 31�ϱ��� �ִ� ���̱� ������ 30������ Ȯ��
						vo.setSaju_day(vo.getSaju_day() + 1); // �ϸ�
						break;
					} else { // 31���� �̶��
						vo.setSaju_mon(vo.getSaju_mon() + 1); // ���� 1�� �����ϰ�, ���� 1�Ϸ� �ʱ�ȭ.
						vo.setSaju_day(1);
						break;
					}
				case 12:
					if (vo.getSaju_day() == 30) {
						vo.setSaju_day(vo.getSaju_day() + 1); // 30���̸� �ϸ� ����.
						break;
					} else {
						vo.setSaju_mon(1); // 12�� 31���� 1���� �ʱ�ȭ.
						vo.setSaju_day(1); // 12�� 31���� 1�Ϸ� �ʱ�ȭ.
						vo.setSaju_year(vo.getSaju_year() + 1); // �⵵ ����.
						break;
					}
				}
			}

		}
		return vo;
	}
	
	
	//ȸ������
	public void join(MemberVO vo, IdealVO ivo) {
		try {
			joinDao.join(vo); //ȸ������
			int user_num = joinDao.user_num(vo.getUser_id()); //�̻����ʿ� user_num�� �ʿ�.
			ivo.setUser_num(user_num);
			joinDao.idealjoing(ivo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//����ʱ�ȭ
	public void gradeInit(MemberVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();;
		vo.setUser_num(joinDao.user_num(vo.getUser_id()));
		map.put("user_num", vo.getUser_num());
		map.put("grade", "gold");
		map.put("left_count", 5);
		joinDao.gradeInit(map);
	}
	

	
	

}
