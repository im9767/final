package test.app.project.daoimpl.p;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.app.project.dao.p.MembersPaymentDao;
import test.app.project.vo.BookingTableVo;
import test.app.project.vo.CouponVo;

@Repository
public class MembersPaymentDaoImpl implements MembersPaymentDao{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	private final String NAMESPACE = "test.app.mybatis.mapper.p.PaymentMapper";
	
	@Override
	public int bookingInsert(BookingTableVo vo) {
		
		return sqlSessionTemplate.insert(NAMESPACE+".bookingInsert", vo);
		
	}

	@Override
	public int paymentInsert(HashMap<String, Object> map) {
		return sqlSessionTemplate.insert(NAMESPACE+".paymentInsert", map);
	}

	@Override
	public List<CouponVo> couponSelect(String mid) {
		return sqlSessionTemplate.selectList(NAMESPACE+".couponSelect", mid);
	}
	
	
	
}
