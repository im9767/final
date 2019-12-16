package test.app.project.dao.p;

import java.util.HashMap;

import test.app.project.vo.BookingTableVo;

public interface MembersPaymentDao {
	
	public int bookingInsert(BookingTableVo vo);
	
	public int paymentInsert(HashMap<String, Object> map);
	
	
}
