package mvc.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mvc.dao.BlockDao;

@Controller
public class BlockController {
	
	@Autowired
	private BlockDao blockdao; 
	
	//블락할 멤버 추가
	@RequestMapping(value = "/block", method = RequestMethod.POST)
	public String blockUser(HttpSession session, int user_num, String pm, int code){
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		System.out.println(pm);
		System.out.println(code);
		
		map.put("user_num", (int)session.getAttribute("user_num"));
		//System.out.println(map.get("user_num"));
		map.put("blocked_user", user_num);
		//System.out.println(map.get("blocked_user"));
		
		blockdao.blockPush(map);

		return "redirect:"+pm+"?"+"code="+code;		
	}

}
