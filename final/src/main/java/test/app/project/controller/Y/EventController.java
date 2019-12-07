package test.app.project.controller.Y;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import test.app.project.service.Y.AdminService;
import test.app.project.vo.EventVo;
import test.app.project.vo.HouseVo;
import test.app.project.vo.NoticeVo;

@Controller
public class EventController {
	@Autowired
	private AdminService service;
	public void setService(AdminService service) {
		this.service = service;
	}
	@RequestMapping(value = "/admin_view/eventboard", method = RequestMethod.GET)
	public String applist(Model model) {
		List<EventVo> elist = service.elistAll();
		model.addAttribute("list2", elist);
		return ".eventboard";
	}

	@RequestMapping(value = "/admin_view/writeevent", method = RequestMethod.GET)
	public String lookwrite(){
		return "admin_view/writeevent";
	}
	@RequestMapping(value="/admin_view/writeeventok",method=RequestMethod.GET)
	public String writeeventok(String etitle,String edate,String sdate,String[] imgIn,Model model){
		HashMap<String, Object> elist= new HashMap<String, Object>();
		elist.put("etitle", etitle);
		elist.put("sdate", sdate);
		elist.put("edate", edate);
		for(int i=0;i<imgIn.length;i++){
				elist.put("orgfilename"+i+1,imgIn[i]);	
		}
		elist.put("imgcnt", imgIn.length);
		try{
			service.writeevent(elist);
			model.addAttribute("code","success");
		}catch(Exception e){
			model.addAttribute("code","fail");
			e.printStackTrace();
		}
		return ".eventboard";		
	}
	/*
	@RequestMapping(value = "/admin_view/upnotice", method = RequestMethod.GET)
	public ModelAndView upnotice(int nnum){
		List<NoticeVo> nlist = service.nlist(nnum);
		ModelAndView mv = new ModelAndView("admin_view/updatenotice");
		mv.addObject("list", nlist);
		return mv;
	}
	@RequestMapping(value = "/admin_view/upnoticeok", method = RequestMethod.GET)
	public String upnotice(NoticeVo vo){
		int n=service.upnotice(vo);
		System.out.println(vo.getNcontent());
		System.out.println(vo.getNnum());
		System.out.println(vo.getNtitle());
		System.out.println(vo.getNregdate());
		if (n > 0) {
			return "redirect:/admin_view/noticeboard";
		} else {
			return "redirect:/admin_view/login";
		}
	}
	*/
	
	@RequestMapping(value = "/admin_view/delevent", method = RequestMethod.GET)
	public String delevent(int event_Num, HttpSession session) {
		int n = service.eventdelete(event_Num);
		if (n > 0) {
			return "redirect:/admin_view/eventboard";
		} else {
			return "redirect:/admin_view/eventboard";
		}
	}
	/*
	@RequestMapping(value = "/admin_view/selnotice", method = RequestMethod.GET)
	public ModelAndView selnotice(int nnum, HttpSession session) {
		List<NoticeVo> nlist = service.nlist(nnum);
		ModelAndView mv = new ModelAndView("admin_view/selnotice");
		mv.addObject("list", nlist);
		return mv;
	}
	*/
}
	
	