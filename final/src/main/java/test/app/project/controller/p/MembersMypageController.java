package test.app.project.controller.p;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.app.project.service.p.MembersService;
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
}
