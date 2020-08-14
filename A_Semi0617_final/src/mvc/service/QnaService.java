package mvc.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mvc.dao.QnaDao;
import mvc.vo.QnaVO;

@Service
public class QnaService {

	//(����)
	@Autowired
	private QnaDao qnaDao;

	// QNA�����ȸ
	public List<QnaVO> getQnaList(HttpSession session) throws Exception {
		int num = (int) session.getAttribute("user_num");
		List<QnaVO> list = qnaDao.qnalist(num);
		return list;
	}

	// QNA����ȸ
	public List<QnaVO> getQnadetailList(HttpSession session, QnaVO vo) throws Exception {
		int num = (int) session.getAttribute("user_num");
		return qnaDao.qnadetaillist(num, vo);
	}

	// QNA����
	public List<QnaVO> deleteQnaList(HttpSession session, QnaVO vo) throws Exception {
		int num = (int) session.getAttribute("user_num");
		return qnaDao.deletelist(num, vo);
	}

	// QNA���
	public int addQna(HttpSession session, QnaVO vo) throws Exception {
		return qnaDao.addQna(vo);
	}

}
