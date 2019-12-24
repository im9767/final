package test.app.project.controller.md;

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
import test.app.project.service.md.BusinessService;

@Controller
public class BusinessLoginController {
	@Autowired
	private BusinessService service;
	@Autowired
	private BusinessYService servicey;
	@Autowired
	private PaymentService pservice;

	@RequestMapping(value="business_view/login",method=RequestMethod.GET)
	public String loginForm(){
		return "business_view/ac/login";
	}
	@RequestMapping(value="business_view/loginok",method=RequestMethod.POST)
	public String loginOk(String bid,String bpwd,HttpSession session,Model model,@RequestParam(value="year",defaultValue="2019")
	int year){
		session.setAttribute("bid",bid);
		session.setAttribute("bpwd",bpwd);
		HashMap<String,Object> map=new HashMap<String, Object>();
		HashMap<String,Object> housemap=new HashMap<String, Object>();
		HashMap<String,Object> businessmap=new HashMap<String, Object>();
		HashMap<String, Object> piemap=new HashMap<String, Object>();
		piemap.put("bid", bid);
		int years=year+1;
		businessmap.put("year", year);
		businessmap.put("years", years);
		businessmap.put("bid", bid);
		List<HashMap<String, Object>> staticList=pservice.businessStatics(businessmap);
		List<HashMap<String, Object>> piechart=pservice.businesschart(piemap);
		map.put("bid",bid);
		map.put("bpwd",bpwd);
		housemap.put("bbid", bid);
		//사업자모드 총 업체갯수
		int businessAll=pservice.businessAll(piemap);
		session.setAttribute("businessAll", businessAll);
		//사업자 아이디로 조회한 업체수
		int houseCnt=service.houseCnt(housemap);
		HashMap<String,Object> business=service.login(map);
		if(business!=null){
			session.setAttribute("houseCnt", houseCnt);
			if(houseCnt==1)
			{		
				session.setAttribute("houseCnt", houseCnt);
				int a=servicey.selhnum(bid);
				session.setAttribute("house_num", a);
				int approval=service.approval(housemap);
				session.setAttribute("approval", approval);
				if(approval==2){
					return ".business_view.ac.main_sub2";
				}else if(approval==1){
					model.addAttribute("staticList",staticList);
					model.addAttribute("piechart",piechart);
					model.addAttribute("year",year);
					return ".business";
				}else{
					return ".business_view.ac.main_sub";
				}
			}else if(houseCnt==0){
				session.setAttribute("houseCnt", houseCnt);
				return ".business_view.ac.main_sub";
			}else{
				session.setAttribute("houseCnt", houseCnt);
				List<HashMap<String, Object>> comlist=servicey.selhnumlist(bid);
				model.addAttribute("comlist",comlist);
				model.addAttribute("staticList",staticList);
				model.addAttribute("piechart",piechart);
				model.addAttribute("year",year);
				return ".business";
			}
		}else{
			return "business_view/ac/login";
		}
	}
	@RequestMapping(value="business/loginok",method=RequestMethod.GET)
	public String gomyBesiness(HttpSession session, @RequestParam(value="year",defaultValue="2019")int year,Model model){
		String bid=(String)session.getAttribute("bid");
		String bpwd=(String)session.getAttribute("bpwd");
		int years=year+1;
		HashMap<String,Object> map=new HashMap<String, Object>();
		HashMap<String,Object> housemap=new HashMap<String, Object>();
		HashMap<String,Object> businessmap=new HashMap<String, Object>();
		HashMap<String, Object> piemap=new HashMap<String, Object>();
		piemap.put("bid", bid);
		businessmap.put("year", year);
		businessmap.put("years", years);
		businessmap.put("bid", bid);
		List<HashMap<String, Object>> staticList=pservice.businessStatics(businessmap);
		List<HashMap<String, Object>> piechart=pservice.businesschart(piemap);
		map.put("bid",bid);
		map.put("bpwd",bpwd);
		housemap.put("bbid", bid);
		//사업자 아이디로 조회한 업체수
		int houseCnt=service.houseCnt(housemap);
		HashMap<String,Object> business=service.login(map);
		if(business!=null){
			session.setAttribute("houseCnt", houseCnt);
			if(houseCnt==1)
			{
				session.setAttribute("houseCnt", houseCnt);
				int a=servicey.selhnum(bid);
				session.setAttribute("house_num", a);
				int approval=service.approval(housemap);
				session.setAttribute("approval", approval);
				if(approval==2){
					return ".business_view.ac.main_sub2";
				}else if(approval==1){
					model.addAttribute("staticList",staticList);
					model.addAttribute("piechart",piechart);
					model.addAttribute("year",year);
				return ".business";
				}else{
					return ".business_view.ac.main_sub";
				}
			}else if(houseCnt==0){
				session.setAttribute("houseCnt", houseCnt);
				return ".business_view.ac.main_sub";
			}else{
				session.setAttribute("houseCnt", houseCnt);
				List<HashMap<String, Object>> comlist=servicey.selhnumlist(bid);
				model.addAttribute("comlist",comlist);
				model.addAttribute("staticList",staticList);
				model.addAttribute("piechart",piechart);
				model.addAttribute("year",year);
				return ".business";
			}
		}else{
			return "business_view/ac/login";
		}
	}
	
	@RequestMapping(value="business1/loginok",method=RequestMethod.GET)
	public String gomyBesiness1(){
		return ".business_view.ac.main_sub";
	}
}







