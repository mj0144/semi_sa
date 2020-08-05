package mvc.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mvc.dao.BlockDao;
import mvc.vo.LikeVO;


@Controller
public class BlockController {
	
	@Autowired
	private BlockDao blockdao; 
	
	//블락할 멤버 추가
	@RequestMapping(value = "/block", method = RequestMethod.POST)
	public String blockUser(RedirectAttributes rd, HttpSession session, int user_num, String pm, String sex, int nowPage, int cntPerPage){
		
		System.out.println("성별"+sex);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("user_num", (int)session.getAttribute("user_num"));
		//System.out.println(map.get("user_num"));
		map.put("blocked_user", user_num);
		//System.out.println(map.get("blocked_user"));
		
		rd.addAttribute("nowPage", nowPage);
		rd.addAttribute("cntPerPage", cntPerPage);
		rd.addAttribute("sex", sex);
		
		blockdao.blockPush(map);

		return "redirect:"+pm;		
	}
	
	@RequestMapping(value = "/blockmodal")
	public ModelAndView blockmodal(HttpSession session) {
		
		ModelAndView mav = new ModelAndView("blockmodal");
		
		int user_num = (int) session.getAttribute("user_num");

		List<HashMap<String, Object>> list = blockdao.blockListProfile(user_num);
		
		mav.addObject("list",list);
		
		return mav;
	}
	
	@ResponseBody   
	@RequestMapping("/blockox")
	public void blockox(String block, int blocked_user, HttpSession session) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("user_num",(int)session.getAttribute("user_num"));
		map.put("blocked_user", blocked_user);
		
		if (block.equals("true") ) {
			blockdao.blockPush(map);			
		}else {
			blockdao.blockDel(map);
		}				
		
	}
		

}
