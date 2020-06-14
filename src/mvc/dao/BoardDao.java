package mvc.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import mvc.service.FeedAbstract;
import mvc.vo.BoardVO;

@Repository
public class BoardDao extends FeedAbstract {
	
	
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
		update(nameSpace + "", vo);
	}
	//�Խñۻ���
	public void boardDelete(int board_num) throws Exception {
		delete(nameSpace + "",board_num);
	}
	//�Խñ� ��� 
	@SuppressWarnings("unchecked")
	public List<BoardVO> listAll() throws Exception {
		return (List<BoardVO>) selectList(nameSpace + "boardList");
	}
	//����ۼ�
	public int insertReply(HashMap<String, String> params) throws Exception {
		return insert(nameSpace + "insertReply", params);
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
	//��� ����
	public void Delete(int num) throws Exception{
		delete(nameSpace, num);
	}
}
