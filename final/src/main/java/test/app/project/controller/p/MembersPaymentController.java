package test.app.project.controller.p;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import test.app.project.service.p.MembersPaymentService;
import test.app.project.vo.BookingTableVo;
import test.app.project.vo.CouponVo;

@Controller
public class MembersPaymentController {
	@Autowired
	private MembersPaymentService paymentService;
	
	
	@RequestMapping(value="/members/payment")
	public String payment(String sdt, String edt, int room_num, String room_name,int room_price,String company,Model model,HttpSession session){
		
		String mid = (String) session.getAttribute("id");
		
		List<CouponVo> coupon = paymentService.couponSelect(mid);
		
		model.addAttribute("coupon", coupon);
		
		model.addAttribute("sdt",sdt); // 숙박 시작일
		model.addAttribute("edt",edt); // 숙박 종료일
		model.addAttribute("room_num",room_num); // 룸 식별번호
		model.addAttribute("room_name",room_name); // 룸 이름
		model.addAttribute("room_price",room_price); // 룸 가격
		model.addAttribute("company",company); // 업체 이름
		
		System.out.println("sdt:"+sdt);
		System.out.println("edt:"+edt);
		System.out.println("room_num:"+room_num);
		System.out.println("room_name:"+room_name);
		System.out.println("room_price:"+room_price);
		System.out.println("company:"+company);
		System.out.println();
		
		String[] s = sdt.split("/"); // 박수 계산
		String[] e = edt.split("/"); // 박수 계산
		int days = Integer.parseInt(e[2])-Integer.parseInt(s[2]);
		
		model.addAttribute("days",days); // 숙박 일 수
		
		DecimalFormat dc = new DecimalFormat("###,###,###,###");
		
		model.addAttribute("dc",dc);
		
		return ".members_p.payment";
	}
	
	@RequestMapping(value="/members/paymentOk", produces="application/json;charset=utf-8")
	@ResponseBody
	public String payment(int room_price,int room_num,int pay_money,String start_date,String end_date,String name,String payment_type,HttpSession session){
		
		System.out.println("room_price:"+room_price);
		System.out.println("room_num:"+room_num);
		System.out.println("pay_money:"+pay_money);
		System.out.println("start_date:"+start_date);
		System.out.println("end_date:"+end_date);
		System.out.println("name:"+name);
		System.out.println("payment_type:"+payment_type);
		System.out.println();
		
		String mid = (String) session.getAttribute("id");
		
		//java.sql.Date d = java.sql.Date.valueOf(start_date);
		//java.sql.Date d2 = java.sql.Date.valueOf(end_date);
		
		BookingTableVo vo = new BookingTableVo(0, room_num, mid, pay_money, null, start_date, end_date, "예약완료", name);
		
				
		
		HashMap<String , Object> map = new HashMap<String, Object>();
		
		map.put("pay", vo.getPay_money());
		map.put("coupon_num", 0);
		map.put("payment_type", payment_type);
		
		int n = paymentService.bookingInsert(vo, map);
		
		
		JSONObject json = new JSONObject();
		if(n>0){
			json.put("code", true);
		}else{
			json.put("code", false);
		}
		return json.toString();
		
		
	}
	
}
