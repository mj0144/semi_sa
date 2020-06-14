package mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.vo.IljuVO;
import mvc.vo.PageVO;


@Repository
public class PageListDao {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	//skynum, landnum �ޱ�
	public IljuVO sajuilju(int user_num) {
		return ss.selectOne("pagelist.iljuselect", user_num);
	}
	
	//����� ����
	public String sexdt(int user_num) {
		return ss.selectOne("pagelist.sexdt", user_num);
	}
	
	public IljuVO getListResult1(PageVO vo) {//nowpage ������ ����� start, end
		return ss.selectOne("pagelist.listResult1", vo);
	}

	public List<IljuVO> getListResult2(PageVO vo) {//nowpage ������ ����� start, end
		return ss.selectList("pagelist.listResult2", vo);
	}
	
	public List<IljuVO> getListResult3(PageVO vo) {//nowpage ������ ����� start, end
		return ss.selectList("pagelist.listResult3", vo);
	}
	
	public int getTotalCount1(PageVO vo) {//��ü �����͸� �������� �������� ���� ���̱� ����...
		return ss.selectOne("pagelist.totalCount1",vo);
	}
	
	public int getTotalCount2(PageVO vo) {//��ü �����͸� �������� �������� ���� ���̱� ����...
		return ss.selectOne("pagelist.totalCount2",vo);
	}

	public int getTotalCount3(PageVO vo) {//��ü �����͸� �������� �������� ���� ���̱� ����...
		return ss.selectOne("pagelist.totalCount3",vo);
	}
}
