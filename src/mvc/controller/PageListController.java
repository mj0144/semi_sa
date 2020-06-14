package mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mvc.dao.PageListDao;
import mvc.vo.IljuVO;
import mvc.vo.PageVO;


@Controller
public class PageListController {
	
	@Autowired
	private PageListDao pagelistDao;
	
	@RequestMapping(value= "/listSome", params = "code=1")
	public String listSome1(PageVO vo, Model model, HttpSession session, String code, 
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "5") String cntPerPage) {
			
		int user_num=(int)session.getAttribute("user_num");	
		
		//유저 천간, 지지 받기
		int sky = pagelistDao.sajuilju(user_num).getIlju_sky_num();
		int land = pagelistDao.sajuilju(user_num).getIlju_land_num();
		
		//유저와 어울리는 상대의 천간, 지지 계산
	    int ilju_sky_num = (sky+5)%10;
		int ilju_land_num = 0;
		      
		if (land==1) {ilju_land_num =land+1;}
		else if(land==2) {ilju_land_num =land-1;}
		else if(land==3) {ilju_land_num =land+9;}
		else if(land==4) {ilju_land_num =land+7;}
		else if(land==5) {ilju_land_num =land+5;}
		else if(land==6) {ilju_land_num =land+3;}
		else if(land==7) {ilju_land_num =land+1;}
		else if(land==8) {ilju_land_num =land-1;}
		else if(land==9) {ilju_land_num =land-3;}
		else if(land==10) {ilju_land_num =land-5;}
		else if(land==11) {ilju_land_num =land-7;}
		else if(land==12) {ilju_land_num =land-9;}
		else {ilju_land_num =land;}
		
		IljuVO list = null;	
		String sex = pagelistDao.sexdt(user_num).trim();
		
		if (sex.equals("m")) {
			sex="f";
		}else {
			sex="m";
		}
		
		PageVO svo = new PageVO();
		svo.setIlju_sky_num(ilju_sky_num);
		svo.setIlju_land_num(ilju_land_num);
		svo.setSex(sex.charAt(0));

		int total = pagelistDao.getTotalCount1(svo);
		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(vo.toString());
		vo.setSex(sex.charAt(0));
		vo.setIlju_sky_num(ilju_sky_num);
		vo.setIlju_land_num(ilju_land_num);
		
		list = pagelistDao.getListResult1(vo);
		
		model.addAttribute("paging", vo);			
		model.addAttribute("list", list);
		
		return "listSome1";

	}
	
	@RequestMapping(value= "/listSome", params = "code=2")
	public String listSome2(PageVO vo, Model model, HttpSession session, String code, 
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "5") String cntPerPage) {
		
		int user_num=(int)session.getAttribute("user_num");	
		
		//유저 천간 받기
		int sky = pagelistDao.sajuilju(user_num).getIlju_sky_num();
		
		//유저와 어울리는 상대의 천간, 지지 계산
	    int ilju_sky_num = 0;
		int ilju_land_num = 0;
		int ilju_sky_num2 = 0;
		int ilju_land_num2 = 0;
		
        if (sky==1) {ilju_sky_num=10; ilju_land_num =2; ilju_sky_num2=10; ilju_land_num2 =8;}
        else if(sky==2) {ilju_sky_num =9; ilju_land_num =9; ilju_sky_num2 =9; ilju_land_num2 =1;}
        else if(sky==3) {ilju_sky_num =2; ilju_land_num =12; ilju_sky_num2 =2; ilju_land_num2 =10;}
        else if(sky==4) {ilju_sky_num =2; ilju_land_num =10; ilju_sky_num2 =2; ilju_land_num2 =12;}
        else if(sky==5) {ilju_sky_num =4; ilju_land_num =8; ilju_sky_num2 =4; ilju_land_num2 =2;}
        else if(sky==6) {ilju_sky_num =3; ilju_land_num =1; ilju_sky_num2 =3; ilju_land_num2 =9;}
        else if(sky==7) {ilju_sky_num =6; ilju_land_num =8; ilju_sky_num2 =6; ilju_land_num2 =2;}
        else if(sky==8) {ilju_sky_num =5; ilju_land_num =7; ilju_sky_num2 =5; ilju_land_num2 =3;}
        else if(sky==9) {ilju_sky_num =8; ilju_land_num =4; ilju_sky_num2 =7; ilju_land_num2 =5;}
        else if(sky==10) {ilju_sky_num =7; ilju_land_num =5; ilju_sky_num2 =8; ilju_land_num2 =4;}
        
        System.out.println("1-1: "+ilju_sky_num);
        System.out.println("1-2: "+ilju_land_num);
        System.out.println("2-1: "+ilju_sky_num2);
        System.out.println("2-2: "+ilju_land_num2);
        
		List<IljuVO> list = null;	
		String sex = pagelistDao.sexdt(user_num).trim();
		
		if (sex.equals("m")) {
			sex="f";
		}else {
			sex="m";
		}
		
		PageVO svo = new PageVO();
		svo.setSex(sex.charAt(0));
		svo.setIlju_sky_num(ilju_sky_num);
		svo.setIlju_land_num(ilju_land_num);
		svo.setIlju_sky_num2(ilju_sky_num2);
		svo.setIlju_land_num2(ilju_land_num2);

		int total = pagelistDao.getTotalCount2(svo);
		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(vo.toString());
		vo.setSex(sex.charAt(0));
		vo.setIlju_sky_num(ilju_sky_num);
		vo.setIlju_land_num(ilju_land_num);
		vo.setIlju_sky_num2(ilju_sky_num2);
		vo.setIlju_land_num2(ilju_land_num2);
		
		list = pagelistDao.getListResult2(vo);
		
		model.addAttribute("paging", vo);			
		model.addAttribute("list", list);
		
		return "listSome2";

	}

	@RequestMapping(value= "/listSome", params = "code=3")
	public String listSome3(PageVO vo, Model model, HttpSession session, String code, 
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "5") String cntPerPage) {
			
		int user_num=(int)session.getAttribute("user_num");	
		
		//이성의 성별로 변환
		String sex = pagelistDao.sexdt(user_num).trim();
		
		if (sex.equals("m")) {
			sex="f";
		}else {
			sex="m";
		}
		
		PageVO svo = new PageVO();
		svo.setSex(sex.charAt(0));
		svo.setUser_num(user_num);
		
		//리스트 갯수 구하고 페이징 처리.
		int total = pagelistDao.getTotalCount3(svo);
		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setSex(sex.charAt(0));
		vo.setUser_num(user_num);
		
		//결과 값 넣기
		List<IljuVO> list = null;	
		list = pagelistDao.getListResult3(vo);
		
		model.addAttribute("paging", vo);			
		model.addAttribute("list", list);
		
		return "listSome3";

	}
	
	@RequestMapping(value= "/listFriend", params = "code=1")
	public String listFriend1(PageVO vo, Model model, HttpSession session, String code, 
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "5") String cntPerPage) {
			
		int user_num=(int)session.getAttribute("user_num");	
		
		//유저 천간, 지지 받기
		int sky = pagelistDao.sajuilju(user_num).getIlju_sky_num();
		int land = pagelistDao.sajuilju(user_num).getIlju_land_num();
		
		//유저와 어울리는 상대의 천간, 지지 계산
	    int ilju_sky_num = (sky+5)%10;
		int ilju_land_num = 0;
		      
		if (land==1) {ilju_land_num =land+1;}
		else if(land==2) {ilju_land_num =land-1;}
		else if(land==3) {ilju_land_num =land+9;}
		else if(land==4) {ilju_land_num =land+7;}
		else if(land==5) {ilju_land_num =land+5;}
		else if(land==6) {ilju_land_num =land+3;}
		else if(land==7) {ilju_land_num =land+1;}
		else if(land==8) {ilju_land_num =land-1;}
		else if(land==9) {ilju_land_num =land-3;}
		else if(land==10) {ilju_land_num =land-5;}
		else if(land==11) {ilju_land_num =land-7;}
		else if(land==12) {ilju_land_num =land-9;}
		else {ilju_land_num =land;}
		
		IljuVO list = null;	
		String sex = pagelistDao.sexdt(user_num).trim();
		
		PageVO svo = new PageVO();
		svo.setIlju_sky_num(ilju_sky_num);
		svo.setIlju_land_num(ilju_land_num);
		svo.setSex(sex.charAt(0));

		int total = pagelistDao.getTotalCount1(svo);
		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(vo.toString());
		vo.setSex(sex.charAt(0));
		vo.setIlju_sky_num(ilju_sky_num);
		vo.setIlju_land_num(ilju_land_num);
		
		list = pagelistDao.getListResult1(vo);
		
		model.addAttribute("paging", vo);			
		model.addAttribute("list", list);
		
		return "listFriend1";

	}
	
	
	@RequestMapping(value= "/listFriend", params = "code=2")
	public String listFriend2(PageVO vo, Model model, HttpSession session, String code, 
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "5") String cntPerPage) {
		
		int user_num=(int)session.getAttribute("user_num");	
		
		//유저 천간 받기
		int sky = pagelistDao.sajuilju(user_num).getIlju_sky_num();
		
		//유저와 어울리는 상대의 천간, 지지 계산
	    int ilju_sky_num = 0;
		int ilju_land_num = 0;
		int ilju_sky_num2 = 0;
		int ilju_land_num2 = 0;
		
        if (sky==1) {ilju_sky_num=10; ilju_land_num =2; ilju_sky_num2=10; ilju_land_num2 =8;}
        else if(sky==2) {ilju_sky_num =9; ilju_land_num =9; ilju_sky_num2 =9; ilju_land_num2 =1;}
        else if(sky==3) {ilju_sky_num =2; ilju_land_num =12; ilju_sky_num2 =2; ilju_land_num2 =10;}
        else if(sky==4) {ilju_sky_num =2; ilju_land_num =10; ilju_sky_num2 =2; ilju_land_num2 =12;}
        else if(sky==5) {ilju_sky_num =4; ilju_land_num =8; ilju_sky_num2 =4; ilju_land_num2 =2;}
        else if(sky==6) {ilju_sky_num =3; ilju_land_num =1; ilju_sky_num2 =3; ilju_land_num2 =9;}
        else if(sky==7) {ilju_sky_num =6; ilju_land_num =8; ilju_sky_num2 =6; ilju_land_num2 =2;}
        else if(sky==8) {ilju_sky_num =5; ilju_land_num =7; ilju_sky_num2 =5; ilju_land_num2 =3;}
        else if(sky==9) {ilju_sky_num =8; ilju_land_num =4; ilju_sky_num2 =7; ilju_land_num2 =5;}
        else if(sky==10) {ilju_sky_num =7; ilju_land_num =5; ilju_sky_num2 =8; ilju_land_num2 =4;}
        
        System.out.println("1-1: "+ilju_sky_num);
        System.out.println("1-2: "+ilju_land_num);
        System.out.println("2-1: "+ilju_sky_num2);
        System.out.println("2-2: "+ilju_land_num2);
        
		List<IljuVO> list = null;	
		String sex = pagelistDao.sexdt(user_num).trim();

		PageVO svo = new PageVO();
		svo.setSex(sex.charAt(0));
		svo.setIlju_sky_num(ilju_sky_num);
		svo.setIlju_land_num(ilju_land_num);
		svo.setIlju_sky_num2(ilju_sky_num2);
		svo.setIlju_land_num2(ilju_land_num2);

		int total = pagelistDao.getTotalCount2(svo);
		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(vo.toString());
		vo.setSex(sex.charAt(0));
		vo.setIlju_sky_num(ilju_sky_num);
		vo.setIlju_land_num(ilju_land_num);
		vo.setIlju_sky_num2(ilju_sky_num2);
		vo.setIlju_land_num2(ilju_land_num2);
		
		list = pagelistDao.getListResult2(vo);
		
		model.addAttribute("paging", vo);			
		model.addAttribute("list", list);
		
		return "listFriend2";

	}
	
	@RequestMapping(value= "/listFriend", params = "code=3")
	public String listFriend3(PageVO vo, Model model, HttpSession session, String code, 
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "5") String cntPerPage) {

		int user_num=(int)session.getAttribute("user_num");	

		List<IljuVO> list = null;
		
		String sex = pagelistDao.sexdt(user_num).trim();
		
		PageVO svo = new PageVO();
		svo.setSex(sex.charAt(0));
		svo.setUser_num(user_num);
		
		int total = pagelistDao.getTotalCount3(svo);
		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setSex(sex.charAt(0));
		vo.setUser_num(user_num);

		list = pagelistDao.getListResult3(vo);
		
		System.out.println(list.get(0).getResult_img());
		
		model.addAttribute("paging", vo);			
		model.addAttribute("list", list);
		
		return "listFriend3";
		
	}
	

	

}
