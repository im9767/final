package test.app.project.controller.l;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.app.project.service.L.PaymentService;

@Controller
public class ChartController {
	@Autowired PaymentService service;
	
	@RequestMapping(value="/admin/piechart")
	public String piechart(Model model){
		List<HashMap<String, Object>> piechart=service.piechart();
		model.addAttribute("list",piechart);
		return ".admin";
	}
	@RequestMapping(value="/company/statics",method=RequestMethod.POST)
	public String statics(int year,Model model){
		int years=year+1;
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("year", year);
		map.put("years", years);
		List<HashMap<String, Object>> slist=service.statics(map);
		List<HashMap<String, Object>> piechart=service.piechart();
		model.addAttribute("list",piechart);
		model.addAttribute("slist",slist);
		model.addAttribute("year",year);
		return ".admin";
	}
}






