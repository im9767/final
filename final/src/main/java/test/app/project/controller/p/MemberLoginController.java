package test.app.project.controller.p;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.app.project.service.p.MembersService;
import test.app.project.vo.MembersVo;

@Controller
public class MemberLoginController {
	
	@Autowired
	private MembersService membersService;
	
	@RequestMapping(value="/members/login",method=RequestMethod.GET)
	public String loginForm(){
		return "/members_p/login";
	}
	@RequestMapping(value="/members/login",method=RequestMethod.POST)
	public String login(String id,String pwd,Model model,HttpSession session) {
		MembersVo vo = new MembersVo();
		vo.setMid(id);
		vo.setMpwd(pwd);
		MembersVo vo1 = membersService.isMember(vo);
		
		if(vo1 == null){
			model.addAttribute("msg","아이디 또는 비밀번호가 틀렸습니다");
			return "/members_p/login";
		}else{
			session.setAttribute("id", id);
			return "redirect:/";
		}
		
	}
	
	@RequestMapping(value="/members/findPwd")
	public String findPwd(){
		return "/members_p/findPwd";
	}
	
}
