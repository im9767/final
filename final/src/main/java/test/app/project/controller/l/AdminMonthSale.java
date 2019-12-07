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
	public String MonthSales(@RequestParam String year,String month,Model model){
		HashMap<String, Object> map=new HashMap<String, Object>();
		DecimalFormat dc=new DecimalFormat("###,###,###,###");
		map.put("year", year);
		map.put("month", month);
		int sumprice=service.monthsale(map);
		String coma=dc.format(sumprice);
		model.addAttribute("coma",coma);
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		return ".admin";
	}
	@RequestMapping(value="/admin/period",method=RequestMethod.POST)
	public String Periodsale(String startday,String endday,Model model){
		HashMap<String, Object> map=new HashMap<String, Object>();
		DecimalFormat dc=new DecimalFormat("###,###,###,###");
		map.put("startday", startday);
		map.put("endday", endday);
		int sumprice=service.periodsale(map);
		String coma=dc.format(sumprice);
		model.addAttribute("periodSum",coma);
		model.addAttribute("startday",startday);
		model.addAttribute("endday",endday);
		return ".admin";
	}
	@RequestMapping(value="/company/register",method=RequestMethod.POST)
	public String RegisterCompany(int company,Model model){
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("company", company);
		int companycount=service.companycount(map);
		model.addAttribute("company",company);
		model.addAttribute("companycount",companycount);
		return ".admin";
	}
}








