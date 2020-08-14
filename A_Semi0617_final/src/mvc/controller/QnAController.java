package mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mvc.service.QnaService;
import mvc.vo.QnaVO;

//QNA������ ���, �ۼ� , ����, ����(����)


@Controller
public class QnAController {


		@Autowired
	    private QnaService qnaService;
		
		
	    /** QnA - ��� ������ �̵� */
	    @RequestMapping( value = "/qnapage")
	    public ModelAndView qnapage(HttpSession session) throws Exception{
	    	String user_id = (String) session.getAttribute("user_id");
	    	List<QnaVO> qnalist = qnaService.getQnaList(session);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("qnapage");
			mav.addObject("vo", qnalist);
			mav.addObject("user_id", user_id);
			
			return mav;
	    }

	    
	    /** QnA - �� ������ �̵� */
	    @RequestMapping( value = "/qnaDetail")
	    public ModelAndView qnaDetail(HttpSession session, QnaVO vo) throws Exception{
	    	
	    	List<QnaVO> qnadetaillist = new ArrayList<QnaVO>();
	    	
	    	qnadetaillist = qnaService.getQnadetailList(session, vo);
	    	ModelAndView mav = new ModelAndView();
			mav.setViewName("qnaview");
			mav.addObject("list", qnadetaillist);

			return mav;
	    }    
	    
	    
	    /** QnA- ���� */
	    @RequestMapping( value = "/deleteqnapage" , method = RequestMethod.POST)
	    public ModelAndView deleteqnapage(HttpSession session, QnaVO vo) throws Exception{
	    	List<QnaVO> deletelist = new ArrayList<QnaVO>();
	    	deletelist = qnaService.deleteQnaList(session, vo);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("qnapage");
			mav.addObject("vo", deletelist);
	    	return mav;
	    }
	    
	    /** QnA - �ۼ������� */
	    @RequestMapping( value = "/qnawritepage")
	    public ModelAndView qnawritePage(HttpSession session, QnaVO vo) throws Exception{
	    	ModelAndView mav = new ModelAndView();
	    	int num = (int) session.getAttribute("user_num");
	    	mav.setViewName("qnawrite");
	    	mav.addObject("user_id", vo.getUser_id());
	    	mav.addObject("user_num", num);
	    	return mav;
	    }
	    
	    /** QnA - �� �ۼ� */
	    @RequestMapping( value = "/qnawrite", method = RequestMethod.POST)
	    public String qnawrite(HttpSession session, QnaVO vo) throws Exception{
			qnaService.addQna(session, vo);
	    	return "redirect:qnapage";
	    }



}
