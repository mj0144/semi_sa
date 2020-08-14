package mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.vo.QnaVO;

//(성현)

@Repository
public class QnaDao {

	@Autowired
	private SqlSessionTemplate ss;

	// 최신 QNA
	public List<QnaVO> qnalist(int num) throws Exception {
		return ss.selectList("qnapage.list", num);
	}

	// QNA 디테일
	public List<QnaVO> qnadetaillist(int num, QnaVO vo) throws Exception {
		return ss.selectList("qnapage.detaillist", vo);
	}

	// QNA 삭제
	public List<QnaVO> deletelist(int num, QnaVO vo) throws Exception {
		ss.delete("qnapage.delete", vo);
		return ss.selectList("qnapage.deletelist", vo);
	}

	// QNA 등록
	public int addQna(QnaVO vo) throws Exception {

		return ss.insert("qnapage.addqna", vo);

	}
}
