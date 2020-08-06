package mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.service.FeedAbstract;
import mvc.vo.BoardVO;
import mvc.vo.IljuVO;
import mvc.vo.PageVO;

@Repository
public class BoardDao extends FeedAbstract {
	
	@Autowired SqlSessionTemplate ss;
	
	private String nameSpace = "board.";
	
	//게시글작성
	public Object create(BoardVO vo) throws Exception {
		return insert(nameSpace + "boardinsert", vo);
	}
	//게시글 상세보기
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> read(int board_num) throws Exception {
		return (HashMap<String, Object>) selectOne(nameSpace + "boardview", board_num);
	}
	//게시글수정
	public void boardUpdate(BoardVO vo) throws Exception {
		update(nameSpace + "board_update", vo);
	}
	//게시글삭제
	public void boardDelete(int BOARD_NUM) throws Exception {
		delete(nameSpace + "board_delete",BOARD_NUM);
	}
	//게시글 목록 
	@SuppressWarnings("unchecked")
	public List<BoardVO> listAll() throws Exception {
		return (List<BoardVO>) selectList(nameSpace + "boardList");
	}
	//댓글작성
	public int insertReply(HashMap<String, String> params) throws Exception {
		return insert(nameSpace + "insertReply", params);
	}
	//댓글목록
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> readReply(String board_num) throws Exception {
		return (List<HashMap<String, Object>>) selectList(nameSpace + "readReply", board_num);
	}
	//대댓글목록
	@SuppressWarnings("unchecked")
	public List<HashMap<String, String>> getSubReply(String board_num) throws Exception {
		return (List<HashMap<String, String>>) selectList(nameSpace + "getSubReply", board_num);
	}
	//댓글 삭제
	public void Delete(int num) throws Exception{
		delete(nameSpace, num);
	}
	
	//피드 검색
	public List<BoardVO> getSearchlist(BoardVO vo) {
	    return ss.selectList("board.searchlist", vo);
		}
	//댓글 삭제
	public void deleteComment(int num) throws Exception{
		delete(nameSpace + "comment_delete", num);
	}
	//댓글 수정
	public void updateComment(BoardVO vo) throws Exception{
		update(nameSpace + "comment_update", vo);
	}
	
}
