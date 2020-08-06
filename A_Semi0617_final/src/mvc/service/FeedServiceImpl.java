package mvc.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;

import mvc.dao.BoardDao;
import mvc.vo.BoardVO;

@Service
public class FeedServiceImpl implements FeedService{
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	private HttpSession session;

	//�Խñ� �ۼ�
	@Override
	public Object create(BoardVO vo) throws Exception {
		return boardDao.create(vo);
	}
	
	//�Խñ� �󼼺���
	@Override
	public HashMap<String, Object> read(int board_num) throws Exception {
		return boardDao.read(board_num);
	}
	
	//�Խñ� ����
	@Override
	public void boardUpdate(BoardVO vo) throws Exception {
		boardDao.boardUpdate(vo);
	}
	
	//�Խñ� ����
	@Override
	public void boardDelete(int BOARD_NUM) throws Exception {
		boardDao.boardDelete(BOARD_NUM);
	}
	
	//�Խñ� ��ü���
	@Override
	public List<BoardVO> listAll() throws Exception {
		return boardDao.listAll();
	}
	//��� �ۼ�
	@Override
	public int insertReply(HashMap<String, String> params) {
		int result = 0;
		try {
			result = boardDao.insertReply(params);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	//��� ���
	@Override
	public List<HashMap<String, Object>> readReply(String board_num) {
		List<HashMap<String, Object>> resultLsit = new ArrayList<HashMap<String,Object>>();
		try {
			
			List<HashMap<String, Object>> replyList = boardDao.readReply(board_num);
			List<HashMap<String, String>> subList = boardDao.getSubReply(board_num);
			for(int i=0; i<replyList.size(); i++) {
				HashMap<String, Object> reply = replyList.get(i);
				List<HashMap<String, String>> tempList = new ArrayList<HashMap<String,String>>();
				for(int k=0; k<subList.size(); k++) {
					HashMap<String, String> sub = subList.get(k);
					if(String.valueOf(reply.get("CM_NUM")).equals(sub.get("CM_RECOMMENT_NUM"))) {
						tempList.add(sub);
					}
				}
				System.out.println(tempList.toString());
				reply.put("subList", tempList);
				replyList.set(i, reply);
			}
			System.out.println("��� : "+replyList);
			System.out.println("���� : " +subList);
			resultLsit = replyList;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return resultLsit;
	}
	
	//��� ����
	@Override
	public void commentDelete(int cm_num) throws Exception {
			boardDao.deleteComment(cm_num);
	}
			
	//��� ����
	@Override
	public void commentUpdate(BoardVO vo) throws Exception {
		boardDao.updateComment(vo);
		
	}
}
