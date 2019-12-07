
package test.app.project.controller.l;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping(value = "/admin")
	public String home(HttpServletRequest req) {
		String cp=req.getContextPath();
		req.getSession().getServletContext().setAttribute("cp", cp);
		return ".admin";
	}
}
