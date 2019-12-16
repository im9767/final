package test.app.project.controller.l;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import test.app.project.service.md.BusinessService;

@Controller
public class HouseController {
	@Autowired
	private BusinessService service;
	
	@RequestMapping(value="/house/count")
	public String houseCnt(HttpSession session,Model model){
		String bid=(String)session.getAttribute("bid");
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("bid", bid);
		int houseCnt=service.houseCnt(map);
		System.out.println("등록된 업체 수: " + houseCnt);
		model.addAttribute("houseCnt",houseCnt);
		return null;
	}
}









