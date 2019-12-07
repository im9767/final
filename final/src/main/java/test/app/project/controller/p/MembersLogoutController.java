package test.app.project.controller.p;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MembersLogoutController {
	
	@RequestMapping(value="/members/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
}
