package mvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.IljuDao;
import mvc.dao.JoinDao;
import mvc.dao.MemberDao;
import mvc.service.JoinService;
import mvc.service.MemberService;
import mvc.utils.ImgUtils;
import mvc.vo.IljuVO;
import mvc.vo.MemberVO;

@Controller
public class StartController {
	@Autowired
	private IljuDao iljudao;

	@Autowired
	ImgUtils imgUtils;
	@Autowired
	private JoinService joinService;
	@Autowired
	private JoinDao joinDao;

	// 간단한 정보 보여주기.
	@RequestMapping("/viewanimal")
	@ResponseBody
	public ModelAndView emailchk(IljuVO svo, MemberVO mvo, String email) {
		ModelAndView m = new ModelAndView();
		m.setViewName("resultsaju1F");
		mvo = joinService.yunYeon(mvo);
		String ilju = joinDao.ilju(mvo);
		svo.setIlju(ilju);
		svo = iljudao.setIlju(svo);
		m.addObject("ilju", svo);
		return m;
	}

	@RequestMapping(value = "/start1")
	public String start1() {
		return "start/start1";
	}
	

}
