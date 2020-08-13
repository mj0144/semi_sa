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
import mvc.vo.NotifyVO;

@Controller
public class BoardContollor {

	@Autowired
	private CommonUtils commonUtils;

	@Autowired
	private FeedService boardService;
	
	@Autowired
	private BoardDao boarddao;

	// ��ü�Խñ�
	@RequestMapping(value = "/feed")
	public ModelAndView list(ModelAndView mav) throws Exception {
		List<BoardVO> list = boardService.listAll();
		mav.setViewName("feed");
		mav.addObject("boardlist", list);
		return mav;
	}

	// �Խñ���ȸ
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

	// �Խñ� �ۼ�ȭ��
	@RequestMapping(value = "boardwrite", method = RequestMethod.GET)
	public void write() {
	}

	// �Խñ� �ۼ�ó��
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

	// ��۴ޱ�

	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(@RequestBody HashMap<String, Object> params, HttpSession session,NotifyVO vo) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String result = "fail";
		int user_num; // ȸ����ȣ
		String rcmtNum = ""; // ���۹�ȣ
		//��ȿ�� üũ
		if (commonUtils.isEmptyCstm((String) params.get("boardNum")) || commonUtils.isEmptyCstm((String) params.get("content"))) {
			resultMap.put("result", result);
			return resultMap;
		}
		if (!commonUtils.isEmptyCstm((String) params.get("recommentNum"))) {
			rcmtNum = (String) params.get("recommentNum");
		}
		user_num = (int) session.getAttribute("user_num");
		params.put("userNum", user_num);
		params.put("recommentNum", rcmtNum);
		System.out.println("���� ������ param : " + params.toString());
		vo.setNotifyusernum(user_num);
		vo.setNotifylink((String) params.get("notifyLink"));
		vo.setNotifycontent((String) params.get("notifycontent"));
		vo.setNotifyuser(Integer.parseInt((String) params.get("usernum")));
		boardService.notifyReply(vo);
		int aflt = boardService.insertReply(params);
		if (aflt == 1) {
			result = "success";
		}
		resultMap.put("result", result);
		return resultMap;
	}

	// �Խñ� ����
	@RequestMapping(value = "/boardDel")
	public String boardDel(@RequestParam int board_num) throws Exception {
		boardService.boardDelete(board_num);
		return "redirect:feed";
	}

	// �Խñ� ����ȭ��
	@RequestMapping(value = "upboard", method = RequestMethod.GET)
	public String boardupdate(BoardVO vo, Model model) throws Exception {
		model.addAttribute("updateB", boardService.read(vo.getBoard_num()));
		System.out.println("����â" + vo.getBoard_num());
		return "boardupdate";
	}

	// �Խñ� ����
	@RequestMapping(value = "/updatefeed", method = RequestMethod.POST)
	public String BoardUpdate(BoardVO vo, int BOARD_NUM, HttpServletRequest request, MultipartFile[] files)
			throws Exception {
		String imgname = FeedImgUpload.imgUpload(files, request);
		vo.setBoard_num(BOARD_NUM);
		vo.setBoard_img(imgname);
		boardService.boardUpdate(vo);
		return "redirect:feed";
	}
	
	//��� ����
		@RequestMapping(value = "/commentDel", method = RequestMethod.GET)
		public void commentDel(@RequestParam int cm_num) throws Exception{
			boardService.commentDelete(cm_num);
			
		}
		
	//��� ����
		@RequestMapping(value = "/commentUpdate",  method = RequestMethod.POST)
		@ResponseBody
		public void commentUpdate(@RequestBody HashMap<String, String> params ) throws Exception{
			System.out.println("�� �� �����ֵ� ������ ��ȩ��");
			System.out.println(params);
			boardService.commentUpdate(params);
		}

	// �Խñ� �˻�
	@RequestMapping(value = "/feedsearch", method = RequestMethod.POST)
	public ModelAndView search(BoardVO vo) throws Exception {

		String getSearch_option = vo.getSearch_option(); String getKeyword = vo.getKeyword();
		System.out.println(getSearch_option); 
		System.out.println(getKeyword);
		
		List<BoardVO> list =boarddao.getSearchlist(vo);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list); // modelandview�� map�� ����

		mav.setViewName("feedsearch");
		return mav;
	}
	
	//게시물 신고
			@RequestMapping(value = "/reportBoard", method = RequestMethod.POST)
			public String reportBoard(HttpSession session, String board_num, String report_board, HttpServletRequest request) throws Exception{
				System.out.println("------------");
				int user_num = (int) session.getAttribute("user_num");
				String user_id = (String) session.getAttribute("user_id");
				int board_num1 = Integer.parseInt(board_num);
				System.out.println("파람 왓니"+board_num+"/+"+report_board+"/+"+user_num+"/+"+user_id);
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("user_num", user_num);
				map.put("board_num", board_num1);
				map.put("reason", report_board);
				map.put("user_id", user_id);
				boarddao.reportBoard(map);
				String referer = request.getHeader("Referer");
			    return "redirect:"+ referer;
			}
			
			//댓글신고
			
			 @RequestMapping(value = "/reportComment", method = RequestMethod.POST) 
			 public String reportComment(HttpSession session, String comment_num, String board_num, String report_comment, HttpServletRequest request) throws Exception { 
				 System.out.println("댓글신고컨트롤러인데..왓니?");
				 int user_num = (int) session.getAttribute("user_num");
				 System.out.println(user_num);
				 String user_id = (String) session.getAttribute("user_id");
				 System.out.println(user_id);
				 int board_num1 = Integer.parseInt(board_num);
				 System.out.println(board_num);
				 int comment_num1 = Integer.parseInt(comment_num);
				 System.out.println(comment_num);
				 System.out.println("파람 왓니"+user_num+"/+"+user_id+"/+"+board_num1+"/+"+report_comment+"/"+comment_num1);
				 HashMap<String, Object> map = new HashMap<String, Object>();
				 map.put("user_num", user_num);
				 map.put("board_num", board_num1);
				 map.put("reason", report_comment);
				 map.put("user_id", user_id);
				 map.put("comment_num", comment_num1);
				 boarddao.reportComment(map);
				 String referer = request.getHeader("Referer");
				 return "redirect:"+ referer;
			}
}
