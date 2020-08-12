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
	
	@Autowired SqlSessionTemplate ss;
	
	private String nameSpace = "board.";
	
	//�Խñ��ۼ�
	public Object create(BoardVO vo) throws Exception {
		return insert(nameSpace + "boardinsert", vo);
	}
	//�Խñ� �󼼺���
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> read(int board_num) throws Exception {
		return (HashMap<String, Object>) selectOne(nameSpace + "boardview", board_num);
	}
	//�Խñۼ���
	public void boardUpdate(BoardVO vo) throws Exception {
		update(nameSpace + "board_update", vo);
	}
	//�Խñۻ���
	public void boardDelete(int BOARD_NUM) throws Exception {
		delete(nameSpace + "board_delete",BOARD_NUM);
	}
	//�Խñ� ��� 
	@SuppressWarnings("unchecked")
	public List<BoardVO> listAll() throws Exception {
		return (List<BoardVO>) selectList(nameSpace + "boardList");
	}
	//����ۼ�
	public int insertReply(HashMap<String, Object> params) throws Exception {
		return insert(nameSpace + "insertReply", params);
	}
	//��� �˶�ó��
	public Object Notifyinsert(NotifyVO vo) throws Exception{
		return insert("Notify.Notifyin", vo);
	}
	//��۸��
	@SuppressWarnings("unchecked")
	public List<HashMap<String, Object>> readReply(String board_num) throws Exception {
		return (List<HashMap<String, Object>>) selectList(nameSpace + "readReply", board_num);
	}
	//���۸��
	@SuppressWarnings("unchecked")
	public List<HashMap<String, String>> getSubReply(String board_num) throws Exception {
		return (List<HashMap<String, String>>) selectList(nameSpace + "getSubReply", board_num);
	}
	
	//�ǵ� �˻�
	public List<BoardVO> getSearchlist(BoardVO vo) {
	    return ss.selectList("board.searchlist", vo);
		}
	//��� ����
	public void deleteComment(int num) throws Exception{
		delete(nameSpace + "comment_delete", num);
	}
	//��� ����
	public void updateComment(HashMap<String, String> params) throws Exception{
		update(nameSpace + "comment_update", params);
	}
	
	//게시물 신고
			public void reportBoard(HashMap<String, Object> params) throws Exception{
				insert(nameSpace + "reportBoard", params);
			}
			
		//댓글 신고
			public void reportComment(HashMap<String, Object> params) throws Exception{
				insert(nameSpace + "reportComment", params);
			}
	
	
}
