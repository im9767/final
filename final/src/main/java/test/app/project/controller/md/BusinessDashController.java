package test.app.project.controller.md;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BusinessDashController {
	@RequestMapping(value = "/business/main")
	public String home(HttpServletRequest req) {
		
		return ".business.";
	}
	
	
}
