package mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.vo.QnaVO;

//(����)

@Repository
public class QnaDao {

	@Autowired
	private SqlSessionTemplate ss;

	// �ֽ� QNA
	public List<QnaVO> qnalist(int num) throws Exception {
		return ss.selectList("qnapage.list", num);
	}

	// QNA ������
	public List<QnaVO> qnadetaillist(int num, QnaVO vo) throws Exception {
		return ss.selectList("qnapage.detaillist", vo);
	}

	// QNA ����
	public List<QnaVO> deletelist(int num, QnaVO vo) throws Exception {
		ss.delete("qnapage.delete", vo);
		return ss.selectList("qnapage.deletelist", vo);
	}

	// QNA ���
	public int addQna(QnaVO vo) throws Exception {

		return ss.insert("qnapage.addqna", vo);

	}
}
