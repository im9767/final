package test.app.project.dao.p;

import java.util.HashMap;
import java.util.List;

import test.app.project.vo.BookingTableVo;
import test.app.project.vo.CouponVo;

public interface MembersPaymentDao {
	
	public int bookingInsert(BookingTableVo vo);
	
	public int paymentInsert(HashMap<String, Object> map);
	
	public List<CouponVo> couponSelect(String mid);
	
	public int couponUpdate(HashMap<String, Object> map);
	
	public int days(HashMap<String, Object> map);
}
