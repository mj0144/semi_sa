package mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mvc.service.FeedService;
import mvc.utils.FeedUtils;
import mvc.utils.CommonUtils;
import mvc.vo.BoardVO;


@Controller
public class BoardContollor {
	
	@Autowired
	private CommonUtils commonUtils;

	@Autowired
	private FeedService boardService;

	// 전체게시글
	@RequestMapping(value = "/feed")
	public ModelAndView list(ModelAndView mav) throws Exception {
		List<BoardVO> list = boardService.listAll();
		mav.setViewName("feed");
		mav.addObject("boardlist", list);
		return mav;
	}

	// 게시글조회
	@RequestMapping(value = "/board", method = RequestMethod.GET)
//	public ModelAndView boardView(@RequestParam int board_num, HttpSession session) throws Exception {
	public ModelAndView boardView(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav) throws Exception {
		mav.setViewName("index");
		if(params.size() == 0) {
			return mav;
		}
		if(commonUtils.isEmptyCstm(String.valueOf(params.get("board_num")))) {
			return mav;
		}
		int board_num = Integer.parseInt(params.get("board_num").toString());
		HashMap<String, Object> boardList = boardService.read(board_num);
		List<HashMap<String, Object>> replyList = boardService.readReply(String.valueOf(board_num));
		
		mav.addObject("reply", replyList);
		mav.addObject("view", boardList);
		mav.addObject("replyCnt", replyList.size());
		mav.setViewName("board");
		return mav;
	}
		//게시글 작성화면
		@RequestMapping(value = "boardwrite", method = RequestMethod.GET)
		public void write() {
		}

		//게시글 작성처리
		@RequestMapping(value = "/write", method = RequestMethod.POST)
		public String write (BoardVO vo, HttpSession session,
				HttpServletRequest request,MultipartFile[] files ) throws Exception {
			if(session.getAttribute("user_num") == null) {
				return "redirect:feed";
			}
			int sessionid = Integer.parseInt(session.getAttribute("user_num").toString());
			vo.setBoard_writer_num(sessionid);
			System.out.println(sessionid);
			String imgname= FeedUtils.imgUpload(files, request);
			System.out.println(imgname);
			vo.setBoard_img(imgname);
			boardService.create(vo);
			return "redirect:feed";
		}
		//댓글달기
		@ResponseBody
		@RequestMapping(value="/reply", method=RequestMethod.POST)
		public Map<String, Object> insertReply(@RequestBody HashMap<String, String> params, HttpSession session) {
			Map<String, Object> resultMap = new HashMap<String, Object>();
			String result = "fail";
			String user_num = "";				// 회원번호
			String rcmtNum = "";			//대댓글번호

			if(commonUtils.isEmptyCstm(params.get("boardNum")) || commonUtils.isEmptyCstm(params.get("content"))) {
				resultMap.put("result", result);
				return resultMap;
			}
			if(!commonUtils.isEmptyCstm(params.get("recommentNum"))) {
				rcmtNum = params.get("recommentNum");
			}
			user_num = String.valueOf(session.getAttribute("user_num"));
			params.put("userNum", user_num);
			params.put("recommentNum", rcmtNum);
			System.out.println("전송 직전의 param : "+ params.toString());
			int aflt = boardService.insertReply(params);
			if(aflt == 1) {
				result = "success";
			}
			resultMap.put("result", result);
			return resultMap;
		}
}
