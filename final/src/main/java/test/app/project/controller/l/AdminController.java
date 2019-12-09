
package test.app.project.controller.l;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import test.app.project.service.L.PaymentService;

@Controller
public class AdminController {
	@Autowired PaymentService service;
	
	@RequestMapping(value = "/admin")
	public String home(@RequestParam(value="year",defaultValue="2019")int year,HttpServletRequest req,Model model) {
		String cp=req.getContextPath();
		req.getSession().getServletContext().setAttribute("cp", cp);
		HashMap<String, Object> map1=new HashMap<String, Object>();
		int years=year+1;
		map1.put("year", year);
		map1.put("years", years);
		java.util.List<HashMap<String, Object>> slist=service.statics(map1);
		List<HashMap<String, Object>> piechart=service.piechart();
		model.addAttribute("list",piechart);
		model.addAttribute("slist",slist);
		return ".admin";
	}
}
