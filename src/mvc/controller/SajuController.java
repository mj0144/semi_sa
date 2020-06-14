package mvc.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.IljuDao;
import mvc.dao.ListDao;
import mvc.service.SajuService;
import mvc.vo.IljuVO;

@Controller
public class SajuController {
	@Autowired
	private IljuDao iljudao;
	@Autowired
	private ListDao listDao;
	
	@Autowired
	private SajuService sajuService;
	
	@RequestMapping(value="/error")
    public String loginerr(Model m) {
		m.addAttribute("msg", "에러다");
         return "error";
      }
	
	@RequestMapping(value = "/login")
	public String login() {
		return "login";
	}

	@RequestMapping(value="/signin")
	public String viewsignin() {
		return "signin";
	}

	@RequestMapping(value="/memberchange")
	public String membershipchange() {
		return "membershipchange";
	}
//	@RequestMapping(value="/mypage")
//	public String mypage() {
//		return "mypage";
//	}
	@RequestMapping(value="/profile")
	public String profile() {
		return "profile";
	}
	@RequestMapping(value="/pwdChange")
	public String pwdChange() {
		return "pwdChange";
	}

	@RequestMapping(value="/chat")
	public String chat() {
		return "chat";
	}
	@RequestMapping(value="/boardwrite")
	public String boardwrite() {
		return "boardwrite";
	}
	@RequestMapping(value="/viewsaju")
	public String viewsaju() {
		return "viewsaju";
	}
	@RequestMapping(value="/resultsajutwo")
	public String viewresultsaju2() {
		return "resultsajutwo";
	}
	@RequestMapping(value="/resultsajuthree")
	public String viewresultsaju3() {
		return "resultsajuthree";
	}
	
	@RequestMapping(value="/resultsaju1")
	public ModelAndView resultsaju1(IljuVO vo,HttpSession session) {
		ModelAndView m = new ModelAndView("resultsaju1");
		String ilju= (String) session.getAttribute("user_ilju");
		vo.setIlju(ilju);
		vo = iljudao.setIlju(vo);
		m.addObject("ilju", vo);
		return m;
	}
	@RequestMapping(value="/resultsaju2")//천생연분 궁합 가져오기
	public ModelAndView resultsaju2(IljuVO vo, HttpSession session) {
		ModelAndView m = new ModelAndView("resultsaju2");
		String ilju= (String) session.getAttribute("user_ilju");
		String name = (String) session.getAttribute("name");
		vo.setIlju(ilju);
		vo = iljudao.setIlju(vo);
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
		vo = iljudao.viewIlju(vo);
		m.addObject("ilju", vo);
		m.addObject("name",name);
		
		System.out.println(sky_num);
		System.out.println(land_num);
		vo.setIlju_sky_num(sky_num);
		vo.setIlju_land_num(land_num);
		vo = iljudao.viewIlju(vo);
		System.out.println(vo.getIlju_land_num());
		m.addObject("minus",vo);
		      
		IljuVO sav = null;
		int user_num=(int)session.getAttribute("user_num");
		if (listDao.sexdt(user_num).equals("m")) {
			sav = listDao.listResultF(vo);
			System.out.println(sav);
			}else {
			sav = listDao.listResultM(vo);
			System.out.println(sav);
			}   
		m.addObject("list", sav);
		
		return m;
	}
	@RequestMapping(value="/resultsaju3")
	public ModelAndView resultsaju3(IljuVO vo,HttpSession session) {
		ModelAndView m = new ModelAndView("resultsaju3");
		String ilju= (String) session.getAttribute("user_ilju");
		vo.setIlju(ilju);
		vo = iljudao.setIlju(vo);
			int sky_num = 0;
			int land_num = 0;
			int aa = vo.getIlju_sky_num();
			if(session.getAttribute("gender").equals("m")) {
				
			}
			if (aa==1) {
				sky_num=10;
				land_num =2;
			}else if(aa==2) {
				sky_num =9;
				land_num =9;
			}else if(aa==3) {
				sky_num =2;
				land_num =12;
			}else if(aa==4) {
				sky_num =2;
				land_num =10;
			}else if(aa==5) {
				sky_num =4;
				land_num =8;
			}else if(aa==6) {
				sky_num =3;
				land_num =1;
			}else if(aa==7) {
				sky_num =6;
				land_num =8;
			}else if(aa==8) {
				sky_num =5;
				land_num =7;
			}else if(aa==9) {
				sky_num =8;
				land_num =4;
			}else if(aa==10) {
				sky_num =7;
				land_num =5;
			}else{
				land_num =vo.getIlju_land_num();
			}
			
			System.out.println(sky_num);
			System.out.println(land_num);
			vo.setIlju_sky_num(sky_num);
			vo.setIlju_land_num(land_num);
			vo = iljudao.viewIlju(vo);
			System.out.println(vo.getIlju_land_num());
			m.addObject("plus",vo);
			
			IljuVO sav = null;
			int user_num=(int)session.getAttribute("user_num");
			if (listDao.sexdt(user_num).equals("m")) {
				sav = listDao.listResultF(vo);
				System.out.println(sav);
				}else {
				sav = listDao.listResultM(vo);
				System.out.println(sav);
				}   
			m.addObject("list1", sav);
			
			if (aa==1) {
				sky_num=10;
				land_num =8;
			}else if(aa==2) {
				sky_num =9;
				land_num =1;
			}else if(aa==3) {
				sky_num =2;
				land_num =10;
			}else if(aa==4) {
				sky_num =2;
				land_num =12;
			}else if(aa==5) {
				sky_num =4;
				land_num =2;
			}else if(aa==6) {
				sky_num =3;
				land_num =9;
			}else if(aa==7) {
				sky_num =6;
				land_num =2;
			}else if(aa==8) {
				sky_num =5;
				land_num =3;
			}else if(aa==9) {
				sky_num =7;
				land_num =5;
			}else if(aa==10) {
				sky_num =8;
				land_num =4;
			}else{
				land_num =vo.getIlju_land_num();
			}
			System.out.println(sky_num);
			System.out.println(land_num);
			vo.setIlju_sky_num(sky_num);
			vo.setIlju_land_num(land_num);
			vo = iljudao.viewIlju(vo);
			System.out.println(vo.getIlju_land_num());
			m.addObject("minus",vo);
			
			user_num=(int)session.getAttribute("user_num");
			if (listDao.sexdt(user_num).equals("m")) {
				sav = listDao.listResultF(vo);
				System.out.println(sav);
				}else {
				sav = listDao.listResultM(vo);
				System.out.println(sav);
				}   
			m.addObject("list2", sav);
		return m;
	}


	@RequestMapping(value="/resultsaju")
	public String viewresultsaju() {
		return "resultsaju";
	}
}
