package mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SajuController {

	
	@RequestMapping(value="/error")
    public String loginerr(Model m) {
		m.addAttribute("msg", "¿¡·¯´Ù");
         return "error";
      }
	@RequestMapping(value="/index")
	public String viewHome() {
		return "index";
	}
	@RequestMapping(value="/friend")
	public String viewfriend() {
		return "friend";
	}
	@RequestMapping(value="/resultsaju")
	public String viewresultsaju() {
		return "resultsaju";
	}
	@RequestMapping(value="/resultsajutwo")
	public String viewresultsaju2() {
		return "resultsajutwo";
	}
	@RequestMapping(value="/resultsajuthree")
	public String viewresultsaju3() {
		return "resultsajuthree";
	}
	@RequestMapping(value="/signin")
	public String viewsignin() {
		return "signin";
	}
	@RequestMapping(value="/addFeed")
	public String addFeed() {
		return "addFeed";
	}
	@RequestMapping(value="/feed")
	public String feed() {
		return "feed";
	}
	@RequestMapping(value="/listSome")
	public String listSome() {
		return "listSome";
	}
	@RequestMapping(value="/listfriend")
	public String listFriend() {
		return "listfriend";
	}
	@RequestMapping(value="/memberchange")
	public String membershipchange() {
		return "membershipchange";
	}
	@RequestMapping(value="/board")
	public String board() {
		return "board";
	}
	@RequestMapping(value="/mypage")
	public String mypage() {
		return "mypage";
	}
	@RequestMapping(value="/profile")
	public String profile() {
		return "profile";
	}
	@RequestMapping(value="/pwdChange")
	public String pwdChange() {
		return "pwdChange";
	}
	@RequestMapping(value="/readFeed")
	public String readFeed() {
		return "readFeed";
	}
	@RequestMapping(value="/viewsaju")
	public String viewsaju() {
		return "viewsaju";
	}
	@RequestMapping(value="/resultsaju2")
	public String resultsaju2() {
		return "resultsaju2";
	}
	@RequestMapping(value="/resultsaju1")
	public String resultsaju1() {
		return "resultsaju1";
	}
	@RequestMapping(value="/resultsaju3")
	public String resultsaju3() {
		return "resultsaju3";
	}
	@RequestMapping(value="/chat")
	public String chat() {
		return "chat";
	}
	@RequestMapping(value="/boardwrite")
	public String boardwrite() {
		return "boardwrite";
	}
}
