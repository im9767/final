package test.app.project.service.p;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import test.app.project.daoimpl.p.MembersPaymentDaoImpl;
import test.app.project.vo.BookingTableVo;

@Service
public class MembersPaymentService {
	
	@Autowired
	private MembersPaymentDaoImpl paymentDaoImpl;
	
	@Transactional
	public int bookingInsert(BookingTableVo vo,HashMap<String, Object> map){
		
		paymentDaoImpl.bookingInsert(vo);
		
		System.out.println("잘찍힘?:"+vo.getBooking_num());
		
		map.put("booking_num", vo.getBooking_num());
		System.out.println("map.get(booking_num):"+map.get("booking_num"));
		
		int n = paymentDaoImpl.paymentInsert(map);
		System.out.println("n:"+n);
		return 1;
		
	}
	
	
}
