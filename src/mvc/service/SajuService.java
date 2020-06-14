package mvc.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.IljuDao;
import mvc.vo.IljuVO;

@Service
public class SajuService {

	@Autowired
	private IljuDao iljuDao;
	
	public void matching1(IljuVO vo, HttpSession session) {//천생연분 궁합
		
		String ilju= (String) session.getAttribute("user_ilju");
		vo.setIlju(ilju);
		vo = iljuDao.setIlju(vo);
		int sky_num = (vo.getIlju_sky_num()+5)%10;
		int land_num = 1;
		
		int aa = vo.getIlju_land_num();
		if (aa==1) {
			land_num =vo.getIlju_land_num()+1;
		}else if(aa==2) {
			land_num =vo.getIlju_land_num()-1;
		}else if(aa==3) {
			land_num =(vo.getIlju_land_num()-3)+12;
		}else if(aa==4) {
			land_num =(vo.getIlju_land_num()-5)+12;
		}else if(aa==5) {
			land_num =(vo.getIlju_land_num()-7)+12;
		}else if(aa==6) {
			land_num =(vo.getIlju_land_num()-9)+12;
		}else if(aa==7) {
			land_num =vo.getIlju_land_num()+1;
		}else if(aa==8) {
			land_num =vo.getIlju_land_num()-1;
		}else if(aa==9) {
			land_num =vo.getIlju_land_num()+9-12;
		}else if(aa==10) {
			land_num =vo.getIlju_land_num()+7-12;
		}else if(aa==11) {
			land_num =(vo.getIlju_land_num()+5)-12;
		}else if(aa==12) {
			land_num =vo.getIlju_land_num()+3-12;
		}else {
			land_num =vo.getIlju_land_num();
		}
		
		vo.setIlju_sky_num(sky_num);
		vo.setIlju_land_num(land_num);
		vo = iljuDao.viewIlju(vo);
	}
}
