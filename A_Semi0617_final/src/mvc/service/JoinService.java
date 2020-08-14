package mvc.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.JoinDao;
import mvc.vo.IdealVO;
import mvc.vo.MemberVO;

@Service
public class JoinService {
	
	@Autowired
	private JoinDao joinDao;
	
	
	//일주 생년월일 계산.
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

		if (vo.getBirth_hh() == 23 && vo.getBirth_mm() > 30) { // 23시 30분이 넘어가면 일주 계산 년월일이 달라짐. -> 원래 생일에서 하루를 더해야함.
			// 1. 윤년이고 28일 이면 29일로가고,
			// 2. 윤년이고 29이면 3월 1일로 바뀜.
			// 3. 1, 3, 5, 7, 8, 10월은 31일 까지. -> 30일이 들어오면 하루 증가.
			// 4. 4 6 9 11 -> 30일까지 ->30일이 들어오면 월이 증가하고 일은 1일로 초기화.

			// 단, 12월 31일은 년이 1증가하고, 1월1일로 초기화.

			if (vo.getSaju_mon() == 2) {
				if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) { // 윤년일 때.
					if (vo.getSaju_day() == 28) { // 윤년인데 28일이 들어오면 29일로 처리
						vo.setSaju_day(vo.getSaju_day() + 1);
					} else { // 윤년인데 29일이 들어오면 3월 1일로 처리.
						vo.setSaju_mon(vo.getSaju_mon() + 1);
						vo.setSaju_day(1);
					}
				} else { // 2월인데 윤년이 아닐 때.

					vo.setSaju_mon(vo.getSaju_mon() + 1); // 월은 1로 증가하고, 일은 1일로 초기화.
					vo.setSaju_day(1);
				}
			}

			if (vo.getSaju_day() >= 30 && vo.getSaju_mon() != 2) { // 2월이 아니면서 30일 이상일 때.
				switch (vo.getSaju_mon()) {
				case 1:
				case 3:
				case 5:
				case 7:
				case 8:
				case 10:
					vo.setSaju_mon(vo.getSaju_mon() + 1); // 30일 까지 있는 월들은 월을 1증가. 일을 1로 초기화.
					vo.setSaju_day(1);
					break;
				case 4:
				case 6:
				case 9:
				case 11:
					if (vo.getSaju_day() == 30) { // 31일까지 있는 월이기 때문에 30일인지 확인
						vo.setSaju_day(vo.getSaju_day() + 1); // 일만
						break;
					} else { // 31일이 이라면
						vo.setSaju_mon(vo.getSaju_mon() + 1); // 월은 1로 증가하고, 일은 1일로 초기화.
						vo.setSaju_day(1);
						break;
					}
				case 12:
					if (vo.getSaju_day() == 30) {
						vo.setSaju_day(vo.getSaju_day() + 1); // 30일이면 일만 증가.
						break;
					} else {
						vo.setSaju_mon(1); // 12월 31일은 1월로 초기화.
						vo.setSaju_day(1); // 12월 31일은 1일로 초기화.
						vo.setSaju_year(vo.getSaju_year() + 1); // 년도 증가.
						break;
					}
				}
			}

		}
		return vo;
	}
	
	
	public void join(MemberVO vo, IdealVO ivo) {
		try {
			joinDao.join(vo); //회원가입
			int user_num = joinDao.user_num(vo.getUser_id()); //이상형쪽에 user_num이 필요.
			ivo.setUser_num(user_num);
			joinDao.idealjoing(ivo);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	public void gradeInit(MemberVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();	
		map.put("user_id", vo.getUser_id());
		map.put("grade", "bronze");
		joinDao.gradeInit(map);		
	}
	
	

}
