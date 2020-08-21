package mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mvc.vo.PaymentVO;
import mvc.vo.ProductVO;

@Repository
public class PayDao {
	@Autowired
	SqlSession ss;
	
	@Transactional
	public void paySingleListInsert(PaymentVO vo) {
		ss.insert("pay.paylistInsert", vo); //paylist�� �������� ����.
		ss.insert("pay.singleInsert", vo); //��ǰ�� ���� ��/��Ʈ ��ǰ ��Ȳ���̺� ���� ����
		ss.update("pay.singleGradeUpdate", vo); //��ǰ ���Ž�, ��޾�����Ʈ.
	}
	@Transactional
	public void paySetListInsert(PaymentVO vo) {
		ss.insert("pay.paylistInsert", vo); //paylist�� �������� ����.
		ss.insert("pay.setInsert", vo); //��ǰ�� ���� ��/��Ʈ ��ǰ ��Ȳ���̺� ���� ����
		ss.update("pay.setGradeUpdate", vo); //��Ʈ���Ž�, ��޾�����Ʈ.
	}
	
	
	public ProductVO selectProduct_Info(int product_num) {
		ProductVO vo = ss.selectOne("pay.selectproduct_info", product_num);
		return vo;
	}
	
	public String selectUserId(int user_num) {
		return ss.selectOne("pay.selectUserId", user_num);
	}
	
	
	//���� ä�ñ�
	public int chatCount(int user_num) {
		return ss.selectOne("pay.chatcount", user_num);		
	}
	
	//����̸� ��ȸ
	public String gradeName(int user_num) {
		return ss.selectOne("pay.gradename", user_num);
	}
	
	
	
}
