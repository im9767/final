
package test.app.project.controller.l;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import test.app.project.service.L.PaymentService;

@Controller
public class AdminController {
	@Autowired PaymentService service;
	
	@RequestMapping(value = "/admin")
	public String home(HttpServletRequest req,Model model) {
		String cp=req.getContextPath();
		req.getSession().getServletContext().setAttribute("cp", cp);
		List<HashMap<String, Object>> piechart=service.piechart();
		model.addAttribute("list",piechart);
		return ".admin";
	}
}
