package test.app.project.controller.p;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;

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

@Controller
public class MembersPaymentController {
	@Autowired
	private MembersPaymentService paymentService;
	
	
	@RequestMapping(value="/members/payment")
	public String payment(String sdt, String edt, int room_num, String room_name,int room_price,String company,Model model){
		
		model.addAttribute("sdt",sdt);
		model.addAttribute("edt",edt);
		model.addAttribute("room_num",room_num);
		model.addAttribute("room_name",room_name);
		model.addAttribute("room_price",room_price);
		model.addAttribute("company",company);
		
		System.out.println("sdt:"+sdt);
		System.out.println("edt:"+edt);
		System.out.println("room_num:"+room_num);
		System.out.println("room_name:"+room_name);
		System.out.println("room_price:"+room_price);
		System.out.println("company:"+company);
		
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
		}
		return json.toString();
		
		
	}
	
}
