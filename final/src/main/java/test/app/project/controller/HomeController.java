package test.app.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.app.project.service.p.MainService;
import test.app.project.vo.EventJoinVo;

@Controller
public class HomeController {

	@Autowired
	private MainService mainService;
	
	@RequestMapping(value = "/",method = RequestMethod.GET)
	public String home(HttpServletRequest req,Model model) {
		String cp=req.getContextPath();
		req.getSession().getServletContext().setAttribute("cp",cp);
		
		List<EventJoinVo> event = mainService.event();
		
		model.addAttribute("event", event);
		
		return ".main";
	}
}
