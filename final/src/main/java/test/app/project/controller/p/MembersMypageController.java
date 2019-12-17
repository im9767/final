package test.app.project.controller.p;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import test.app.project.service.p.MembersService;
import test.app.project.util.PageUtil;
import test.app.project.vo.MembersVo;

@Controller
public class MembersMypageController {
	
	@Autowired
	private MembersService membersService;
	
	// 마이페이지 이동
	@RequestMapping(value="/members/mypage")
	public String mypage(HttpSession session, Model model){
		String mid = (String)session.getAttribute("id");
		HashMap<String, Object> map = membersService.myinfo(mid);
		int cntCoupon = membersService.cntCoupon(mid);
		model.addAttribute("map", map);
		model.addAttribute("cntCoupon",cntCoupon);
		
		return ".members_p.mypage";
	}
	
	// 회원정보 수정페이지 이동
	@RequestMapping(value="/members/infoupdate",method=RequestMethod.GET)
	public String infoupdateForm(HttpSession session,Model model){
		
		String mid = (String) session.getAttribute("id");
		
		HashMap<String, Object> map = membersService.myinfo(mid);
		model.addAttribute("map", map);
		
		MembersVo vo = membersService.idCheck(mid);
		model.addAttribute("vo",vo);
		
		int cntCoupon = membersService.cntCoupon(mid);
		model.addAttribute("cntCoupon",cntCoupon);
		
		return ".members_p.infoupdate";
	}
	
	// 회원정보 수정하기
	@RequestMapping(value="/members/infoupdate",method=RequestMethod.POST)
	public String infoupdate(String mname, String mid, String mpwd, String memail, String mphone, Model model){
		
		MembersVo vo = new MembersVo();
		
		vo.setMname(mname);
		vo.setMid(mid);
		vo.setMpwd(mpwd);
		vo.setMemail(memail);
		vo.setMphone(mphone);
		
		int n = membersService.myinfoupdate(vo);
		
		return "redirect:/members/mypage";
	}
	
	// 회원 예약내역 조회
	@RequestMapping(value="/members/bookingList",method=RequestMethod.GET)
	public String bookingList(@RequestParam(value="pageNum",defaultValue="1")int pageNum, Model model,HttpSession session){
		
		String mid = (String) session.getAttribute("id");
		
		int totalRowCount = membersService.bookingCount(mid);
		
		PageUtil pagination = new PageUtil(pageNum, totalRowCount, 5, 5);
		
		HashMap<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("mid", mid);
		parameter.put("startRow", pagination.getStartRow());
		parameter.put("endRow", pagination.getEndRow());
		
		List<HashMap<String, Object>> bookingList = membersService.bookingList(parameter);
		
		model.addAttribute("bookingList", bookingList);
		model.addAttribute("pagination", pagination);
		
		int cntCoupon = membersService.cntCoupon(mid);
		model.addAttribute("cntCoupon",cntCoupon);
		
		HashMap<String, Object> map = membersService.myinfo(mid);
		
		model.addAttribute("map",map);
		
		return ".members_p.bookingList";
		
	}
}
