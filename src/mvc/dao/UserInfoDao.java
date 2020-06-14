package mvc.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mvc.vo.MemberVO;

@Repository
public class UserInfoDao {

	@Autowired
	SqlSessionTemplate ss;
	
	public MemberVO info(int num) {
		return ss.selectOne("userinfo.info", num);
	}
	
	public void infoUpdate(MemberVO vo) {
		ss.update("userinfo.infoUpdate", vo);
	}
	
}
