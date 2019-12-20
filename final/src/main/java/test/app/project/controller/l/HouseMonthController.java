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
import org.springframework.web.bind.annotation.RequestParam;

import test.app.project.service.L.PaymentService;
import test.app.project.service.Y.BusinessYService;

@Controller
public class HouseMonthController {
	@Autowired private PaymentService service;
	@Autowired private BusinessYService servicey;
	//월별 매출액 관련 작업
	@RequestMapping(value="/business/month",method=RequestMethod.POST)
	public String HouseSale(HttpSession session, Model model,@RequestParam(value="year",defaultValue="2019")int year,int month){
		//사업자 아이디
		String bid=(String)session.getAttribute("bid");
		int years=year+1;
		HashMap<String, Object> businessmap=new HashMap<String, Object>();
		HashMap<String, Object> piemap=new HashMap<String, Object>();
		piemap.put("bid", bid);
		businessmap.put("year", year);
		businessmap.put("years", years);
		businessmap.put("bid", bid);
		List<HashMap<String, Object>> staticList=service.businessStatics(businessmap);
		model.addAttribute("staticList",staticList);
		model.addAttribute("year",year);
		HashMap<String, Object> map=new HashMap<String, Object>();
		List<HashMap<String, Object>> piechart=service.businesschart(piemap);
		model.addAttribute("piechart",piechart);
		map.put("year", year);
		map.put("month", month);
		map.put("bid", bid);
		DecimalFormat dc=new DecimalFormat("###,###,###,###");
		int sumtemp=service.businessMonthsale(map);
		String monthSum=dc.format(sumtemp);
		List<HashMap<String, Object>> comlist=servicey.selhnumlist(bid);
		model.addAttribute("comlist",comlist);
		model.addAttribute("monthSum",monthSum);
		model.addAttribute("year",year);
		model.addAttribute("month",month);
		return ".business_view.ac.main";
	}
	//기간별 매출액 관련 작업
	@RequestMapping(value="/business/period",method=RequestMethod.POST)
	public String PeriodSale(HttpSession session,Model model,String startday,String endday,
			@RequestParam(value="year",defaultValue="2019")int year){
		int years=year+1;
		//사업자 아이디
		String bid=(String)session.getAttribute("bid");
		HashMap<String, Object> map=new HashMap<String, Object>();
		HashMap<String, Object> piemap=new HashMap<String, Object>();
		HashMap<String,Object> businessmap=new HashMap<String, Object>();
		businessmap.put("year", year);
		businessmap.put("years", years);
		businessmap.put("bid", bid);
		List<HashMap<String, Object>> staticList=service.businessStatics(businessmap);
		piemap.put("bid", bid);
		map.put("bid", bid);
		map.put("startday", startday);
		map.put("endday", endday);
		DecimalFormat dc=new DecimalFormat("###,###,###,###");
		int sumtemp=service.businessPeriodSale(map);
		String periodSum=dc.format(sumtemp);
		List<HashMap<String, Object>> piechart=service.businesschart(piemap);
		List<HashMap<String, Object>> comlist=servicey.selhnumlist(bid);
		model.addAttribute("comlist",comlist);
		model.addAttribute("piechart",piechart);
		model.addAttribute("periodSum",periodSum);
		model.addAttribute("startday",startday);
		model.addAttribute("endday",endday);
		model.addAttribute("staticList",staticList);
		return ".business_view.ac.main";
	}
	//업종별 갯수 구하기
	@RequestMapping(value="/business/register",method=RequestMethod.POST)
	public String businessCnt(HttpSession session,Model model,int company,@RequestParam(value="year",defaultValue="2019")
	int year){
		//사업자 아이디
		String bid=(String)session.getAttribute("bid");
		int years=year+1;
		HashMap<String, Object> businessmap=new HashMap<String, Object>();
		HashMap<String, Object> map=new HashMap<String, Object>();
		HashMap<String, Object> piemap=new HashMap<String, Object>();
		piemap.put("bid", bid);
		businessmap.put("year", year);
		businessmap.put("years", years);
		businessmap.put("bid", bid);
		List<HashMap<String, Object>> staticList=service.businessStatics(businessmap);
		List<HashMap<String, Object>> piechart=service.businesschart(piemap);
		List<HashMap<String, Object>> comlist=servicey.selhnumlist(bid);
		model.addAttribute("comlist",comlist);
		model.addAttribute("piechart",piechart);
		model.addAttribute("staticList",staticList);
		model.addAttribute("year",year);
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
		HashMap<String, Object> piemap=new HashMap<String, Object>();
		piemap.put("bid", bid);
		map.put("bid", bid);
		map.put("year", year);
		map.put("years", years);
		List<HashMap<String, Object>> staticList=service.businessStatics(map);
		List<HashMap<String, Object>> piechart=service.businesschart(piemap);
		List<HashMap<String, Object>> comlist=servicey.selhnumlist(bid);
		model.addAttribute("comlist",comlist);
		model.addAttribute("piechart",piechart);
		model.addAttribute("staticList",staticList);
		model.addAttribute("year",year);
		return ".business_view.ac.main";
	}
	//사업자모드 pie차트 관련 메소드
	@RequestMapping(value="/business/piechart")
	public String businessChart(HttpSession session,Model model,@RequestParam(value="year",defaultValue="2019")
	int year){
		int years=year+1;
		//사업자아이디
		String bid=(String)session.getAttribute("bid");
		HashMap<String, Object> piemap=new HashMap<String, Object>();
		HashMap<String, Object> businessmap=new HashMap<String, Object>();
		piemap.put("bid", bid);
		businessmap.put("year", year);
		businessmap.put("years", years);
		businessmap.put("bid", bid);
		List<HashMap<String, Object>> staticList=service.businessStatics(businessmap);
		List<HashMap<String, Object>> piechart=service.businesschart(piemap);
		List<HashMap<String, Object>> comlist=servicey.selhnumlist(bid);
		model.addAttribute("comlist",comlist);
		model.addAttribute("piechart",piechart);
		model.addAttribute("staticList",staticList);
		model.addAttribute("year",year);
		return ".business_view.ac.main";
	}
}














