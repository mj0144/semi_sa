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
import mvc.vo.NotifyVO;
import mvc.vo.PageVO;

@Repository
public class BoardDao extends FeedAbstract {

	@Autowired
	SqlSessionTemplate ss;

	private String nameSpace = "board.";

	public Object create(BoardVO vo) throws Exception {
		return insert(nameSpace + "boardinsert", vo);
	}

	@SuppressWarnings("unchecked")
	public HashMap<String, Object> read(int board_num) throws Exception {
		return (HashMap<String, Object>) selectOne(nameSpace + "boardview", board_num);
	}

	public void boardUpdate(BoardVO vo) throws Exception {
		update(nameSpace + "board_update", vo);
	}

	public void boardDelete(int BOARD_NUM) throws Exception {
		delete(nameSpace + "board_delete", BOARD_NUM);
	}

	@SuppressWarnings("unchecked")
	public List<BoardVO> listAll() throws Exception {
		return (List<BoardVO>) selectList(nameSpace + "boardList");
	}

	public int insertReply(HashMap<String, Object> params) throws Exception {
		return insert(nameSpace + "insertReply", params);
	}

	public Object Notifyinsert(NotifyVO vo) throws Exception {
		return insert("Notify.Notifyin", vo);
	}

	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> readReply(String board_num) throws Exception {
		return (List<HashMap<String, Object>>) selectList(nameSpace + "readReply", board_num);
	}

	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> getSubReply(String board_num) throws Exception {
		return (List<HashMap<String, Object>>) selectList(nameSpace + "getSubReply", board_num);
	}

	// 전체 피드 검색 기능 (성현)
	public List<BoardVO> getSearchlist(BoardVO vo) {
		return ss.selectList("board.searchlist", vo);
	}

	// 댓글삭제 (수연)
	public void deleteComment(int num) throws Exception {
		delete(nameSpace + "comment_delete", num);
	}

	// 댓글수정(수연)
	public void updateComment(HashMap<String, String> params) throws Exception {
		update(nameSpace + "comment_update", params);
	}
	// 게시글신고(수연)
	public void reportBoard(HashMap<String, Object> params) throws Exception {
		insert(nameSpace + "reportBoard", params);
	}
	// 댓글신고(수연)
	public void reportComment(HashMap<String, Object> params) throws Exception {
		insert(nameSpace + "reportComment", params);
	}

}
