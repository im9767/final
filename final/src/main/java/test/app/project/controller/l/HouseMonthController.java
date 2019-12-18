package test.app.project.controller.l;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.app.project.service.L.PaymentService;

@Controller
public class HouseMonthController {
	@Autowired	PaymentService service;
	//월별 매출액 관련 작업
	@RequestMapping(value="/business/month",method=RequestMethod.POST)
	public String HouseSale(HttpSession session, Model model,int year,int month){
		//사업자 아이디
		String bid=(String)session.getAttribute("bid");
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("year", year);
		map.put("month", month);
		map.put("bid", bid);
		DecimalFormat dc=new DecimalFormat("###,###,###,###");
		int sumtemp=service.businessMonthsale(map);
		String monthSum=dc.format(sumtemp);
		model.addAttribute("monthSum",monthSum);
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		return ".business_view.ac.main";
	}
	//기간별 매출액 관련 작업
	@RequestMapping(value="/business/period",method=RequestMethod.POST)
	public String PeriodSale(HttpSession session,Model model,String startday,String endday){
		//사업자 아이디
		String bid=(String)session.getAttribute("bid");
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("bid", bid);
		map.put("startday", startday);
		map.put("endday", endday);
		DecimalFormat dc=new DecimalFormat("###,###,###,###");
		int sumtemp=service.businessPeriodSale(map);
		String periodSum=dc.format(sumtemp);
		model.addAttribute("periodSum",periodSum);
		model.addAttribute("startday",startday);
		model.addAttribute("endday",endday);
		return ".business_view.ac.main";
	}
	//업종별 갯수 구하기
	@RequestMapping(value="/business/register",method=RequestMethod.POST)
	public String businessCnt(HttpSession session,Model model,int company){
		//사업자 아이디
		String bid=(String)session.getAttribute("bid");
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("bid", bid);
		map.put("company", company);
		int companycount=service.businesscount(map);
		model.addAttribute("companycount",companycount);
		model.addAttribute("company",company);
		return ".business_view.ac.main";
	}
	//년,월 관련 매출액 구하기
	@RequestMapping(value="/business/statics",method=RequestMethod.POST)
	public String businessStatics(HttpSession session,Model model,int year){
		int years=year+1;
		String bid=(String)session.getAttribute("bid");
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("bid", bid);
		map.put("year", year);
		map.put("years", years);
		List<HashMap<String, Object>> staticList=service.businessStatics(map);
		model.addAttribute("staticList",staticList);
		model.addAttribute("year",year);
		return ".business_view.ac.main";
	}
}














