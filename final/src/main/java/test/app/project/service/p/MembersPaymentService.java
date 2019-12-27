package test.app.project.service.p;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import test.app.project.daoimpl.p.MembersPaymentDaoImpl;
import test.app.project.vo.BookingTableVo;
import test.app.project.vo.CouponVo;

@Service
public class MembersPaymentService {
	
	@Autowired
	private MembersPaymentDaoImpl paymentDaoImpl;
	
	// 예약,결제 테이블 insert / 쿠폰 사용시 쿠폰 삭제 트랜잭션
	@Transactional
	public int bookingInsert(BookingTableVo vo,HashMap<String, Object> map){
		
		paymentDaoImpl.bookingInsert(vo);
		
		System.out.println("잘찍힘?:"+vo.getBooking_num());
		
		map.put("booking_num", vo.getBooking_num());
		System.out.println("map.get(booking_num):"+map.get("booking_num"));
		
		int n = paymentDaoImpl.paymentInsert(map);
		System.out.println("n:"+n);
		
		if(map.get("coupon_num") != null){
			paymentDaoImpl.couponUpdate(map);	
		}
		
		return 1;
		
	}
	
	public List<CouponVo> couponSelect(String mid){
		return paymentDaoImpl.couponSelect(mid);
	}
	
	public int days(HashMap<String, Object> map){
		return paymentDaoImpl.days(map);
	}
	
	
}
