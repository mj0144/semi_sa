package mvc.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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


//이동현

@Controller
public class BlockController {
	
	@Autowired
	private BlockDao blockdao; 
	
	//블락 리스트 모달 
	@RequestMapping(value = "/blockmodal")
	public ModelAndView blockmodal(HttpSession session) {
		
		ModelAndView mav = new ModelAndView("blockmodal");
		
		int user_num = (int) session.getAttribute("user_num");

		List<HashMap<String, Object>> list = blockdao.blockListProfile(user_num);
		
		mav.addObject("list",list);
		
		return mav;
	}
	
	//블락 추가, 블락 해제
	@ResponseBody   
	@RequestMapping("/blockox")
	public void blockox(String block, int blocked_user, HttpSession session) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("user_num",(int)session.getAttribute("user_num"));
		map.put("blocked_user", blocked_user);
		
		if (block.equals("true") ) {
			blockdao.blockPush(map);
			System.out.println("블락 추가");
		}else {
			blockdao.blockDel(map);
			System.out.println("블락 해제");
		}				
		
	}

}
