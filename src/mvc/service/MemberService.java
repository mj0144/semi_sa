package mvc.service;

import org.springframework.stereotype.Service;

import mvc.vo.MemberVO;

@Service
public class MemberService {

	public MemberVO yunYeon(MemberVO vo) {
		String[] array = vo.getFromDt().split("-");
		// 2020-06-08;
		vo.setSaju_year(Integer.parseInt(array[0]));
		vo.setSaju_mon(Integer.parseInt(array[1]));
		vo.setSaju_day(Integer.parseInt(array[2]));
		
		vo.setInfo_year(Integer.parseInt(array[0]));
		vo.setInfo_mon(Integer.parseInt(array[1]));
		vo.setInfo_day(Integer.parseInt(array[2]));
		
		int year = vo.getSaju_year();

		if (vo.getInfo_hh() == 23 && vo.getInfo_mm() > 30) { // 식? 윤년 year%4===0 &&year%100!=0||year%400 ==0 // 이번해가
																// 뉸년이자나?
			// 1. 윤년이고 28일 이면 29일로가고, // 윤년이고 29이면 월도 3으로 바뀌고 일도 1로 바꿔야 // 2. 1 3 5 7 8 10
			// 12 -> 31일 // 4 6 9 11 -> 30일.

			if (vo.getSaju_mon() == 2) {
				if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) { // 윤년이야
					if (vo.getSaju_day() == 28) { // 윤년인데 28일이 들어옴
						vo.setSaju_day(vo.getSaju_day() + 1);
					} else { // 윤년인데 29일이들어옴
						vo.setSaju_mon(vo.getSaju_mon() + 1);
						vo.setSaju_day(1);
					}
				} else { // 2월인데 윤년이 아닐때.

					vo.setSaju_mon(vo.getSaju_mon() + 1); // 월은 1로 증가하고, 일은 1일로 초기화.
					vo.setSaju_day(1);
				}
			}

			if (vo.getSaju_day() >= 30 && vo.getSaju_mon() != 2) {
				switch (vo.getSaju_mon()) {
				case 1:
				case 3:
				case 5:
				case 7:
				case 8:
				case 10:
					vo.setSaju_mon(vo.getSaju_mon() + 1); // 월은 1로 증가하고, 일은 1일로 초기화.
					vo.setSaju_day(1);
					break;
				case 4:
				case 6:
				case 9:
				case 11:
					if (vo.getSaju_day() == 30) {
						vo.setSaju_day(vo.getSaju_day() + 1); // 일만
						break;
					} else {
						vo.setSaju_mon(vo.getSaju_mon() + 1); // 월은 1로 증가하고, 일은 1일로 초기화.
						vo.setSaju_day(1);
						break;
					}
				case 12:
					if (vo.getSaju_day() == 30) {
						vo.setSaju_day(vo.getSaju_day() + 1); // 일만
						break;
					} else {
						vo.setSaju_mon(1); // 12월 31일은 1월로 초기화.
						vo.setSaju_day(1); // 12월 31일은 1일로 초기화.
						vo.setSaju_year(vo.getSaju_year() + 1);
						break;
					}
				}
			}

		}
		return vo;
	}

}
