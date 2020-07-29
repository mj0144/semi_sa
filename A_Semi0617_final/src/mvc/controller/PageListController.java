package mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import mvc.dao.BlockDao;
import mvc.dao.LikeDao;
import mvc.dao.PageListDao;
import mvc.vo.IljuVO;
import mvc.vo.LikeVO;
import mvc.vo.PageVO;


@Controller
public class PageListController {
	
	@Autowired
	private PageListDao pagelistDao;
	
	@Autowired
	private LikeDao likeDao;
	
	@Autowired
	private BlockDao blockDao;
	
	@RequestMapping(value= "/listSome", params = "code=1")
	public String listSome1(PageVO vo, Model model, HttpSession session, String code, 
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") String cntPerPage) {
			
		int user_num=(int)session.getAttribute("user_num");	
		
		//유저 천간, 지지 받기
		int sky = pagelistDao.sajuilju(user_num).getIlju_sky_num();
		int land = pagelistDao.sajuilju(user_num).getIlju_land_num();
		
		//유저와 어울리는 상대의 천간, 지지 계산
		
	    
		
		int ilju_sky_num = (sky+5)%10;
		if(ilju_sky_num == 0) {
			ilju_sky_num = 10;
		}
		
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
		System.out.println(sex.equals("m"));
		if (sex.equals("m")) {
			sex="f";
		}else {
			sex="m";
		}
		
		List<Integer> blist = blockDao.blockList(user_num);
		
		PageVO svo = new PageVO();
		svo.setIlju_sky_num(ilju_sky_num);
		svo.setIlju_land_num(ilju_land_num);
		svo.setSex(sex.charAt(0));
		svo.setBlist(blist);

		int total = pagelistDao.getTotalCount1(svo);
		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(vo.toString());
		vo.setSex(sex.charAt(0));
		vo.setIlju_sky_num(ilju_sky_num);
		vo.setIlju_land_num(ilju_land_num);
		vo.setBlist(blist);
		
		list = pagelistDao.getListResult1(vo);
		List<LikeVO> list2 = likeDao.likeornot(user_num);
		
		System.out.println("list.getilfu" + list.getMem().get(0).getNickname());
		
		model.addAttribute("heart", list2);
		model.addAttribute("pm", "listSome");
		model.addAttribute("code", code);
		model.addAttribute("paging", vo);			
		model.addAttribute("list", list);
		
		return "listTypeA";

	}
	
	@RequestMapping(value= "/listSome", params = "code=2")
	public String listSome2(PageVO vo, Model model, HttpSession session, String code, 
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") String cntPerPage) {
		
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
		
		List<Integer> blist = blockDao.blockList(user_num);
		
		PageVO svo = new PageVO();
		svo.setSex(sex.charAt(0));
		svo.setIlju_sky_num(ilju_sky_num);
		svo.setIlju_land_num(ilju_land_num);
		svo.setIlju_sky_num2(ilju_sky_num2);
		svo.setIlju_land_num2(ilju_land_num2);
		svo.setBlist(blist);
		
		int total = pagelistDao.getTotalCount2(svo);
		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(vo.toString());
		vo.setSex(sex.charAt(0));
		vo.setIlju_sky_num(ilju_sky_num);
		vo.setIlju_land_num(ilju_land_num);
		vo.setIlju_sky_num2(ilju_sky_num2);
		vo.setIlju_land_num2(ilju_land_num2);
		vo.setBlist(blist);
		
		list = pagelistDao.getListResult2(vo);
		List<LikeVO> list2 = likeDao.likeornot(user_num);
		
		model.addAttribute("heart", list2);
		model.addAttribute("pm", "listSome");
		model.addAttribute("code", code);
		model.addAttribute("paging", vo);			
		model.addAttribute("list", list);
		
		return "listTypeB";

	}

	@RequestMapping(value= "/listSome", params = "code=3")
	public String listSome3(PageVO vo, Model model, HttpSession session, String code, 
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") String cntPerPage) {
			
		int user_num=(int)session.getAttribute("user_num");	
		
		//이성의 성별로 변환
		String sex = pagelistDao.sexdt(user_num).trim();
		if (sex.equals("m")) {
			sex="f";
		}else {
			sex="m";
		}
		
		List<Integer> blist = blockDao.blockList(user_num);
		
		PageVO svo = new PageVO();
		svo.setSex(sex.charAt(0));
		svo.setUser_num(user_num);
		svo.setBlist(blist);
		
		//리스트 갯수 구하고 페이징 처리.
		int total = pagelistDao.getTotalCount3(svo);
		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setSex(sex.charAt(0));
		vo.setUser_num(user_num);
		vo.setBlist(blist);
		
		//결과 값 넣기
		List<IljuVO> list = null;	
		list = pagelistDao.getListResult3(vo);
		
		//System.out.println(list.get(0).getMem().get(0).getUser_img());
		List<LikeVO> list2 = likeDao.likeornot(user_num);
		
		model.addAttribute("heart", list2);
		model.addAttribute("pm", "listSome");
		model.addAttribute("code", code);
		model.addAttribute("paging", vo);			
		model.addAttribute("list", list);
		
		return "listTypeC";

	}
	
	@RequestMapping(value= "/listFriend", params = "code=1")
	public String listFriend1(PageVO vo, Model model, HttpSession session, String code, 
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") String cntPerPage) {
			
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
		
		List<Integer> blist = blockDao.blockList(user_num);
		
		PageVO svo = new PageVO();
		svo.setIlju_sky_num(ilju_sky_num);
		svo.setIlju_land_num(ilju_land_num);
		svo.setSex(sex.charAt(0));
		svo.setBlist(blist);

		int total = pagelistDao.getTotalCount1(svo);
		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(vo.toString());
		vo.setSex(sex.charAt(0));
		vo.setIlju_sky_num(ilju_sky_num);
		vo.setIlju_land_num(ilju_land_num);
		vo.setBlist(blist);
		
		list = pagelistDao.getListResult1(vo);
		List<LikeVO> list2 = likeDao.likeornot(user_num);
		
		model.addAttribute("heart", list2);
		model.addAttribute("pm", "listFriend");
		model.addAttribute("code", code);
		model.addAttribute("paging", vo);			
		model.addAttribute("list", list);
		
		return "listTypeA";

	}
	
	
	@RequestMapping(value= "/listFriend", params = "code=2")
	public String listFriend2(PageVO vo, Model model, HttpSession session, String code, 
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") String cntPerPage) {
		
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
		
		List<Integer> blist = blockDao.blockList(user_num);

		PageVO svo = new PageVO();
		svo.setSex(sex.charAt(0));
		svo.setIlju_sky_num(ilju_sky_num);
		svo.setIlju_land_num(ilju_land_num);
		svo.setIlju_sky_num2(ilju_sky_num2);
		svo.setIlju_land_num2(ilju_land_num2);
		svo.setBlist(blist);

		int total = pagelistDao.getTotalCount2(svo);
		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(vo.toString());
		vo.setSex(sex.charAt(0));
		vo.setIlju_sky_num(ilju_sky_num);
		vo.setIlju_land_num(ilju_land_num);
		vo.setIlju_sky_num2(ilju_sky_num2);
		vo.setIlju_land_num2(ilju_land_num2);
		vo.setBlist(blist);
		
		list = pagelistDao.getListResult2(vo);
		List<LikeVO> list2 = likeDao.likeornot(user_num);
		
		model.addAttribute("heart", list2);
		model.addAttribute("pm", "listFriend");
		model.addAttribute("code", code);
		model.addAttribute("paging", vo);			
		model.addAttribute("list", list);
		
		return "listTypeB";

	}
	
	@RequestMapping(value= "/listFriend", params = "code=3")
	public String listFriend3(PageVO vo, Model model, HttpSession session, String code, 
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") String cntPerPage) {

		int user_num=(int)session.getAttribute("user_num");	

		List<IljuVO> list = null;
		
		String sex = pagelistDao.sexdt(user_num).trim();
		List<Integer> blist = blockDao.blockList(user_num);
		
		PageVO svo = new PageVO();
		svo.setSex(sex.charAt(0));
		svo.setUser_num(user_num);
		svo.setBlist(blist);
		
		int total = pagelistDao.getTotalCount3(svo);
		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setSex(sex.charAt(0));
		vo.setUser_num(user_num);
		vo.setBlist(blist);

		list = pagelistDao.getListResult3(vo);
		
		//System.out.println(list.get(0).getResult_img());
		List<LikeVO> list2 = likeDao.likeornot(user_num);
		
		model.addAttribute("heart", list2);
		model.addAttribute("pm", "listFriend");
		model.addAttribute("code", code);
		model.addAttribute("paging", vo);			
		model.addAttribute("list", list);
		
		return "listTypeC";
		
	}
	
	@RequestMapping(value= "/listWhole", params = "code=1")
	public String listWhole1(PageVO vo, Model model, HttpSession session, String code, 
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") String cntPerPage) {
			
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
		
		List<Integer> blist = blockDao.blockList(user_num);
		
		PageVO svo = new PageVO();
		svo.setIlju_sky_num(ilju_sky_num);
		svo.setIlju_land_num(ilju_land_num);
		svo.setBlist(blist);

		int total = pagelistDao.getTotalCountWhole1(svo);
		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(vo.toString());
		vo.setIlju_sky_num(ilju_sky_num);
		vo.setIlju_land_num(ilju_land_num);
		vo.setBlist(blist);
		
		list = pagelistDao.getListWhole1(vo);
		List<LikeVO> list2 = likeDao.likeornot(user_num);
		for(LikeVO e : list2) {
			System.out.println("likedyuser : "+ e.getLiked_user());
			System.out.println("user : "+ e.getUser_num());
		
			
		}
		
		
		model.addAttribute("heart", list2);
		model.addAttribute("pm", "listWhole");
		model.addAttribute("code", code);
		model.addAttribute("paging", vo);			
		model.addAttribute("list", list);
		
		return "listTypeA";

	}
	
	@RequestMapping(value= "/listWhole", params = "code=2")
	public String listWhole2(PageVO vo, Model model, HttpSession session, String code, 
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") String cntPerPage) {
		
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
		
		List<Integer> blist = blockDao.blockList(user_num);

		PageVO svo = new PageVO();
		svo.setIlju_sky_num(ilju_sky_num);
		svo.setIlju_land_num(ilju_land_num);
		svo.setIlju_sky_num2(ilju_sky_num2);
		svo.setIlju_land_num2(ilju_land_num2);
		svo.setBlist(blist);

		int total = pagelistDao.getTotalCountWhole2(svo);
		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(vo.toString());
		vo.setIlju_sky_num(ilju_sky_num);
		vo.setIlju_land_num(ilju_land_num);
		vo.setIlju_sky_num2(ilju_sky_num2);
		vo.setIlju_land_num2(ilju_land_num2);
		vo.setBlist(blist);
		
		list = pagelistDao.getListWhole2(vo);
		List<LikeVO> list2 = likeDao.likeornot(user_num);
		
		model.addAttribute("heart", list2);
		model.addAttribute("pm", "listWhole");
		model.addAttribute("code", code);
		model.addAttribute("paging", vo);			
		model.addAttribute("list", list);
		
		return "listTypeB";

	}
	
	@RequestMapping(value= "/listWhole", params = "code=3")
	public String listWhole3(PageVO vo, Model model, HttpSession session, String code, 
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") String cntPerPage) {

		int user_num=(int)session.getAttribute("user_num");	

		List<IljuVO> list = null;
		
		List<Integer> blist = blockDao.blockList(user_num);
		
		PageVO svo = new PageVO();
		svo.setUser_num(user_num);
		svo.setBlist(blist);
		
		int total = pagelistDao.getTotalCountWhole3(svo);
		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setUser_num(user_num);
		vo.setBlist(blist);

		//System.out.println("user_num: "+ user_num);
		
		list = pagelistDao.getListWhole3(vo);

		List<LikeVO> list2 = likeDao.likeornot(user_num);
		

		model.addAttribute("heart", list2);
		model.addAttribute("pm", "listWhole");
		model.addAttribute("code", code);
		model.addAttribute("paging", vo);			
		model.addAttribute("list", list);
		
		return "listTypeC";
		
	}
	
	
	@RequestMapping(value= "/listSearch", params = "code=1")
	public String listSearch(PageVO vo, Model model, HttpSession session, String code,
			@RequestParam(value = "nowPage", required = false, defaultValue = "1") String nowPage,
			@RequestParam(value = "cntPerPage", required = false, defaultValue = "10") String cntPerPage) {
	 
		String searchType = vo.getSearchType(); String searchValue = vo.getSearchValue();
		System.out.println(searchType); 
		System.out.println(searchValue);
	 
		int user_num=(int)session.getAttribute("user_num");
		System.out.println(user_num);
	 
		String sex = pagelistDao.sexdt(user_num).trim(); 
		System.out.println(sex);
	 
		List<IljuVO> list = null;
		
		List<Integer> blist = blockDao.blockList(user_num);
	 
		PageVO svo = new PageVO(); 
		svo.setUser_num(user_num);
	 
		if (searchType.equals("2")) { 
			System.out.println("2일때");
			sex = pagelistDao.sexdt(user_num).trim(); 
			}
		else if (searchType.equals("1")) { 
			if (sex.equals("m")) { 
				System.out.println("1의 f");
				sex = "f"; 
				} else { 
					System.out.println("1의 m");
				sex = "m"; 
				}
		}else {
			System.out.println("작동오류");
		}
		System.out.println(sex);
	 
		svo.setSex(sex.charAt(0)); 
		svo.setSearchType(vo.getSearchType());
		svo.setSearchValue(vo.getSearchValue());
		svo.setBlist(blist);
	  
		int total = pagelistDao.getTotalCountSearch(svo); System.out.println(total);
	 
		vo = new PageVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setUser_num(user_num);
		vo.setSex(sex.charAt(0)); vo.setSearchType(searchType);
		vo.setSearchValue(searchValue);
		vo.setBlist(blist);
	 
		System.out.println("user_num: "+ user_num);
		System.out.println(vo.toString()); System.out.println("searchType: "+ vo.getSearchType()); 
		System.out.println("searchValue: "+ vo.getSearchValue());
		list = pagelistDao.getSearchlist(vo);
	  
		List<LikeVO> list2 = likeDao.likeornot(user_num);
	  
		model.addAttribute("heart", list2); 
		model.addAttribute("pm", "listSearch");
		model.addAttribute("code", code); 
		model.addAttribute("paging", vo);
		model.addAttribute("list", list);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchValue", searchValue);
	  
		return "listSearch";
	  
	  }

	

}
