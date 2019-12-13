package test.app.project.controller.md;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;

public class BusinessController {
	@RequestMapping(value = "/business")
	public String home(HttpServletRequest req) {
		String cp=req.getContextPath();
		req.getSession().getServletContext().setAttribute("cp", cp);
		return ".business";
	}
}