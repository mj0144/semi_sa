package mvc.service;

import java.util.HashMap;
import java.util.List;


import mvc.vo.BoardVO;
import mvc.vo.NotifyVO;

public interface FeedService {
	//�Խñ� �ۼ�
	public Object create(BoardVO vo)throws Exception;
	//�Խñ� �󼼺���
	public HashMap<String, Object> read(int board_num)throws Exception;
	//�Խñ� ����
	public void boardUpdate(BoardVO vo)throws Exception;
	//�Խñ� ����
	public void boardDelete (int BOARD_NUM)throws Exception;
	//�Խñ� ��ü���
	public List<BoardVO> listAll()throws Exception;
	//����ۼ�
	public int insertReply(HashMap<String, Object> params);
	//��� ���
	public List<HashMap<String, Object>> readReply(String board_num);
	//��۾˶��ۼ�
	public Object notifyReply(NotifyVO vo)throws Exception;
	//��� ����
	public void commentDelete(int cm_num)throws Exception;
	//��� ����
	public void commentUpdate(HashMap<String, String> params) throws Exception;
	
}
