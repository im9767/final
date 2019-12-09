package test.app.project.controller.l;

import java.text.DecimalFormat;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import test.app.project.service.L.PaymentService;

@Controller
public class AdminMonthSale {
	@Autowired private PaymentService service;
	
	@RequestMapping(value="/admin/month",method=RequestMethod.POST)
	public String MonthSales(@RequestParam(value="year",defaultValue="2019")int year,int month,Model model){
		HashMap<String, Object> map=new HashMap<String, Object>();
		HashMap<String, Object> map1=new HashMap<String, Object>();
		DecimalFormat dc=new DecimalFormat("###,###,###,###");
		java.util.List<HashMap<String, Object>> piechart=service.piechart();
		
		int years=year+1;
		map1.put("year", year);
		map1.put("years", years);
		java.util.List<HashMap<String, Object>> slist=service.statics(map1);
		
		map.put("year", year);
		map.put("month", month);
		int sumprice=service.monthsale(map);
		String coma=dc.format(sumprice);
		model.addAttribute("coma",coma);
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		model.addAttribute("list",piechart);
		model.addAttribute("slist",slist);
		return ".admin";
	}
	@RequestMapping(value="/admin/period",method=RequestMethod.POST)
	public String Periodsale(@RequestParam(value="year",defaultValue="2019")int year,String startday,String endday,Model model){
		HashMap<String, Object> map=new HashMap<String, Object>();
		HashMap<String, Object> map1=new HashMap<String, Object>();
		DecimalFormat dc=new DecimalFormat("###,###,###,###");
		
		int years=year+1;
		map1.put("year", year);
		map1.put("years", years);
		java.util.List<HashMap<String, Object>> slist=service.statics(map1);
		java.util.List<HashMap<String, Object>> piechart=service.piechart();
		map.put("startday", startday);
		map.put("endday", endday);
		int sumprice=service.periodsale(map);
		String coma=dc.format(sumprice);
		model.addAttribute("periodSum",coma);
		model.addAttribute("startday",startday);
		model.addAttribute("endday",endday);
		model.addAttribute("list",piechart);
		model.addAttribute("slist",slist);
		return ".admin";
	}
	@RequestMapping(value="/company/register",method=RequestMethod.POST)
	public String RegisterCompany(@RequestParam(value="year",defaultValue="2019")int year,int company,Model model){
		HashMap<String, Object> map=new HashMap<String, Object>();
		HashMap<String, Object> map1=new HashMap<String, Object>();
		int years=year+1;
		map1.put("year", year);
		map1.put("years", years);
		java.util.List<HashMap<String, Object>> slist=service.statics(map1);
		java.util.List<HashMap<String, Object>> piechart=service.piechart();
		map.put("company", company);
		int companycount=service.companycount(map);
		model.addAttribute("company",company);
		model.addAttribute("companycount",companycount);
		model.addAttribute("list",piechart);
		model.addAttribute("slist",slist);
		return ".admin";
	}
}








