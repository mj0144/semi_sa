package mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SajuController {

	

	@RequestMapping(value="/index")
	public String viewHome() {
		return "test/index";
	}
	@RequestMapping(value="/friend")
	public String viewfriend() {
		return "test/friend";
	}
	@RequestMapping(value="/resultsaju")
	public String viewresultsaju() {
		return "test/resultsaju";
	}
	@RequestMapping(value="/resultsajutwo")
	public String viewresultsaju2() {
		return "test/resultsajutwo";
	}
	@RequestMapping(value="/resultsajuthree")
	public String viewresultsaju3() {
		return "test/resultsajuthree";
	}
	@RequestMapping(value="/signin")
	public String viewsignin() {
		return "test/signin";
	}
	@RequestMapping(value="/addFeed")
	public String addFeed() {
		return "test/addFeed";
	}
	@RequestMapping(value="/feed")
	public String feed() {
		return "test/feed";
	}
	@RequestMapping(value="/listSome")
	public String listSome() {
		return "test/listSome";
	}
	@RequestMapping(value="/listfriend")
	public String listFriend() {
		return "test/listfriend";
	}
	@RequestMapping(value="/memberchange")
	public String membershipchange() {
		return "test/membershipchange";
	}
	@RequestMapping(value="/board")
	public String board() {
		return "test/board";
	}
	@RequestMapping(value="/mypage")
	public String mypage() {
		return "test/mypage";
	}
	@RequestMapping(value="/profile")
	public String profile() {
		return "test/profile";
	}
	@RequestMapping(value="/pwdChange")
	public String pwdChange() {
		return "test/pwdChange";
	}
	@RequestMapping(value="/readFeed")
	public String readFeed() {
		return "test/readFeed";
	}
	@RequestMapping(value="/viewsaju")
	public String viewsaju() {
		return "test/viewsaju";
	}
	@RequestMapping(value="/resultsaju2")
	public String resultsaju2() {
		return "test/resultsaju2";
	}
	@RequestMapping(value="/resultsaju1")
	public String resultsaju1() {
		return "test/resultsaju1";
	}
	@RequestMapping(value="/resultsaju3")
	public String resultsaju3() {
		return "test/resultsaju3";
	}
	@RequestMapping(value="/chat")
	public String chat() {
		return "test/chat";
	}
	@RequestMapping(value="/boardwrite")
	public String boardwrite() {
		return "test/boardwrite";
	}
}
