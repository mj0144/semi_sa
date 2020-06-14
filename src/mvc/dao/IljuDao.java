package mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import mvc.vo.IljuVO;

@Repository
public class IljuDao {
	
	@Autowired
	private SqlSessionTemplate ss;
	
	public IljuVO viewIlju(IljuVO vo) {
		return ss.selectOne("ilju.myilju",vo);
	}

	public IljuVO setIlju(IljuVO vo) {
		return ss.selectOne("ilju.setilju",vo);
	}
	
}
