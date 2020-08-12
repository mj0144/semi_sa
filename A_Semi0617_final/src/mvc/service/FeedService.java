package mvc.service;

import java.util.HashMap;
import java.util.List;


import mvc.vo.BoardVO;
import mvc.vo.NotifyVO;

public interface FeedService {
	//게시글 작성
	public Object create(BoardVO vo)throws Exception;
	//게시글 상세보기
	public HashMap<String, Object> read(int board_num)throws Exception;
	//게시글 수정
	public void boardUpdate(BoardVO vo)throws Exception;
	//게시글 삭제
	public void boardDelete (int BOARD_NUM)throws Exception;
	//게시글 전체목록
	public List<BoardVO> listAll()throws Exception;
	//댓글작성
	public int insertReply(HashMap<String, Object> params);
	//댓글 목록
	public List<HashMap<String, Object>> readReply(String board_num);
	//댓글알람작성
	public Object notifyReply(NotifyVO vo)throws Exception;
	//댓글 삭제
	public void commentDelete(int cm_num)throws Exception;
	//댓글 수정
	public void commentUpdate(HashMap<String, String> params) throws Exception;
	
}
