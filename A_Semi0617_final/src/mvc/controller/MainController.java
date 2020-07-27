package mvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.ListDao;
import mvc.vo.IljuVO;

@Controller
public class MainController {

	@Autowired
	private ListDao listDao;
	
	@RequestMapping(value= "/index")
	public ModelAndView main(HttpSession session) {
		
ModelAndView mav = new ModelAndView("index");
		
		int user_num=(int)session.getAttribute("user_num");
		int sky = listDao.sajuilju(user_num).getIlju_sky_num();
		int land = listDao.sajuilju(user_num).getIlju_land_num();
		
		System.out.println(user_num);
		System.out.println(sky);
	    System.out.println(land);
	    
	    
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
        
        Map<String, Integer> map = new HashMap<String, Integer>();
        
        System.out.println("1-1: "+ilju_sky_num);
        System.out.println("1-2: "+ilju_land_num);
        System.out.println("2-1: "+ilju_sky_num2);
        System.out.println("2-2: "+ilju_land_num2);
        
        map.put("ilju_sky_num", ilju_sky_num);
        map.put("ilju_land_num", ilju_land_num);        
        map.put("ilju_sky_num2", ilju_sky_num2);
        map.put("ilju_land_num2", ilju_land_num2);
   
      
        List<IljuVO> list = new ArrayList<IljuVO>();	      
        List<IljuVO> list2 = new ArrayList<IljuVO>();	
        
		if (listDao.sexdt(user_num).trim().equals("f")) {
			list = listDao.listResultf2(map);
			list2 = listDao.listResultm2(map);
			}
		
		else {
				list = listDao.listResultm2(map);
				list2 = listDao.listResultf2(map);
			}
		
		
		mav.addObject("list", list);
		mav.addObject("list2", list2);
		return mav;
		
	}
}
