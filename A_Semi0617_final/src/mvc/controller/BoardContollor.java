package mvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import mvc.dao.BoardDao;
import mvc.service.FeedService;
import mvc.utils.CommonUtils;
import mvc.utils.FeedImgUpload;
import mvc.vo.BoardVO;
import mvc.vo.MemberVO;

@Controller
public class BoardContollor {

	@Autowired
	private CommonUtils commonUtils;

	@Autowired
	private FeedService boardService;
	
	@Autowired
	private BoardDao boarddao;

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
	public ModelAndView boardView(@RequestParam HashMap<String, String> params, HttpSession session, ModelAndView mav)
			throws Exception {
		mav.setViewName("index");
		if (params.size() == 0) {
			return mav;
		}
		if (commonUtils.isEmptyCstm(String.valueOf(params.get("board_num")))) {
			return mav;
		}
		int board_num = Integer.parseInt(params.get("board_num").toString());
		HashMap<String, Object> boardList = boardService.read(board_num);
		System.out.println(boardList);
		List<HashMap<String, Object>> replyList = boardService.readReply(String.valueOf(board_num));
		mav.addObject("reply", replyList);
		mav.addObject("view", boardList);
		mav.addObject("replyCnt", replyList.size());
		mav.setViewName("board");
		return mav;
	}

	// 게시글 작성화면
	@RequestMapping(value = "boardwrite", method = RequestMethod.GET)
	public void write() {
	}

	// 게시글 작성처리
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVO vo, HttpSession session, HttpServletRequest request, MultipartFile[] files)
			throws Exception {
		if (session.getAttribute("user_num") == null) {
			return "redirect:feed";
		}
		int sessionid = Integer.parseInt(session.getAttribute("user_num").toString());
		vo.setBoard_writer_num(sessionid);
		System.out.println(sessionid);
		String imgname = FeedImgUpload.imgUpload(files, request);
		if (commonUtils.isEmptyCstm(imgname)) {
		}
		System.out.println(imgname);
		vo.setBoard_img(imgname);
		boardService.create(vo);
		return "redirect:feed";
	}

	// 댓글달기

	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(@RequestBody HashMap<String, String> params, HttpSession session) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println("public Map<String, Object> ");
		String result = "fail";
		String user_num = ""; // 회원번호
		String rcmtNum = ""; // 대댓글번호

		if (commonUtils.isEmptyCstm(params.get("boardNum")) || commonUtils.isEmptyCstm(params.get("content"))) {
			resultMap.put("result", result);
			return resultMap;
		}
		if (!commonUtils.isEmptyCstm(params.get("recommentNum"))) {
			rcmtNum = params.get("recommentNum");
		}
		user_num = String.valueOf(session.getAttribute("user_num"));
		params.put("userNum", user_num);
		params.put("recommentNum", rcmtNum);
		System.out.println("전송 직전의 param : " + params.toString());
		int aflt = boardService.insertReply(params);
		if (aflt == 1) {
			result = "success";
		}
		resultMap.put("result", result);
		return resultMap;
	}

	// 게시글 삭제
	@RequestMapping(value = "/boardDel")
	public String boardDel(@RequestParam int board_num) throws Exception {
		boardService.boardDelete(board_num);
		return "redirect:feed";
	}

	// 게시글 수정화면
	@RequestMapping(value = "upboard", method = RequestMethod.GET)
	public String boardupdate(BoardVO vo, Model model) throws Exception {
		model.addAttribute("updateB", boardService.read(vo.getBoard_num()));
		System.out.println("수정창" + vo.getBoard_num());
		return "boardupdate";
	}

	// 게시글 수정
	@RequestMapping(value = "/updatefeed", method = RequestMethod.POST)
	public String BoardUpdate(BoardVO vo, int BOARD_NUM, HttpServletRequest request, MultipartFile[] files)
			throws Exception {
		String imgname = FeedImgUpload.imgUpload(files, request);
		vo.setBoard_num(BOARD_NUM);
		vo.setBoard_img(imgname);
		boardService.boardUpdate(vo);
		return "redirect:feed";
	}
	
	//댓글 삭제
		@RequestMapping(value = "/commentDel", method = RequestMethod.GET)
		public void commentDel(@RequestParam int cm_num) throws Exception{
			boardService.commentDelete(cm_num);
			
		}
		
		//댓글 수정
//		@RequestMapping(value = "/commentUpdate")
//		public String commentUpdate(BoardVO vo, ) throws Exception{
//			S
//		}

	// 게시글 검색
	@RequestMapping(value = "/feedsearch", method = RequestMethod.POST)
	public ModelAndView search(BoardVO vo) throws Exception {

		String getSearch_option = vo.getSearch_option(); String getKeyword = vo.getKeyword();
		System.out.println(getSearch_option); 
		System.out.println(getKeyword);
		
		List<BoardVO> list =boarddao.getSearchlist(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list); // modelandview에 map를 저장

		mav.setViewName("feedsearch");
		return mav;
	}
}
