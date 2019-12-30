package test.app.project.controller.md;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BusinessLogoutController {
	@RequestMapping(value="/business/logout")
	public String BusinessLogout(HttpSession session){
		session.removeAttribute("bid");
		session.removeAttribute("bpwd");
		session.removeAttribute("house_num");
		return "redirect:/";
	}
}
