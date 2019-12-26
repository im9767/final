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
	
	// 예약 테이블 insert
	@Override
	public int bookingInsert(BookingTableVo vo) {
		
		return sqlSessionTemplate.insert(NAMESPACE+".bookingInsert", vo);
		
	}
	
	// 결제 테이블 insert
	@Override
	public int paymentInsert(HashMap<String, Object> map) {
		return sqlSessionTemplate.insert(NAMESPACE+".paymentInsert", map);
	}

	// 쿠폰 목록 가져오기
	@Override
	public List<CouponVo> couponSelect(String mid) {
		return sqlSessionTemplate.selectList(NAMESPACE+".couponSelect", mid);
	}

	@Override
	public int couponUpdate(HashMap<String, Object> map) {
		return sqlSessionTemplate.delete(NAMESPACE+".couponUpdate", map);
	}

	@Override
	public int days(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".days", map);
	}

	
	
}
