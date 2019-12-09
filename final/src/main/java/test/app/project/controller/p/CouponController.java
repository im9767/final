package test.app.project.controller.p;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import test.app.project.service.p.MembersService;
import test.app.project.vo.CouponVo;

@Controller
public class CouponController {
	
	@Autowired
	private MembersService membersService;
	
	@RequestMapping(value="/members/couponList")
	public String couponPage(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model, HttpSession session){
		
		String mid = (String)session.getAttribute("id");
		HashMap<String, Object> map = membersService.myinfo(mid);
		int cntCoupon = membersService.cntCoupon(mid);
		model.addAttribute("map", map);
		model.addAttribute("cntCoupon",cntCoupon);
		
		List<CouponVo> couponList = membersService.couponList(mid);
		
		model.addAttribute("couponList", couponList);
		
		return ".members_p.couponList";
		
	}
}
