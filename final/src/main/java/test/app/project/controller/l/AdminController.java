
package test.app.project.controller.l;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import test.app.project.service.L.MembersService1;
import test.app.project.service.L.PaymentService;
import test.app.project.service.Y.AdminService;
import test.app.project.vo.EventVo;

@Controller
public class AdminController {
	@Autowired PaymentService service;
	@Autowired AdminService service1;
	@Autowired MembersService1 service2;
	
	@RequestMapping(value = "/admin")
	public String home(@RequestParam(value="year",defaultValue="2019")int year,HttpServletRequest req,Model model,
			HttpSession session) {
		String cp=req.getContextPath();
		req.getSession().getServletContext().setAttribute("cp", cp);
		HashMap<String, Object> map1=new HashMap<String, Object>();
		int years=year+1;
		int allCnt=service2.allCnt();
		session.setAttribute("allCnt", allCnt);
		map1.put("year", year);
		map1.put("years", years);
		List<EventVo> elist=service1.elistAll();
		java.util.List<HashMap<String, Object>> slist=service.statics(map1);
		List<HashMap<String, Object>> piechart=service.piechart();
		model.addAttribute("list",piechart);
		model.addAttribute("slist",slist);
		model.addAttribute("eelist",elist); //모달창을 위한 이벤트 리스트
		return ".admin";
	}
}
