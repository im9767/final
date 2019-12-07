package test.app.project.controller.Y;

import java.sql.Date;
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
import test.app.project.vo.HouseVo;
import test.app.project.vo.NoticeVo;

@Controller
public class BoardController {
	@Autowired
	private AdminService service;
	public void setService(AdminService service) {
		this.service = service;
	}
	@RequestMapping(value = "/admin_view/noticeboard", method = RequestMethod.GET)
	public String applist(Model model) {
		List<NoticeVo> nlist = service.nlistAll();
		model.addAttribute("list", nlist);
		return ".noticeboard";
	}
	@RequestMapping(value = "/admin_view/writenotice", method = RequestMethod.GET)
	public String lookwrite(){
		return "admin_view/writenotice";
	}
	@RequestMapping(value="/admin_view/writenoticeok",method=RequestMethod.GET)
	public String writenoticeok(String ntitle,String ncontent,HttpSession session){
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("ntitle",ntitle);
		map.put("ncontent",ncontent);
		int n=service.wnotice(map);
		if(n>0){
			return "redirect:/admin_view/noticeboard";
		}else{
			return "admin_view/writenotice";
		}
	}
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
		if (n > 0) {
			return "redirect:/admin_view/noticeboard";
		} else {
			return "redirect:/admin_view/login";
		}
	}

	@RequestMapping(value = "/admin_view/delnotice", method = RequestMethod.GET)
	public String delnotice(int nnum, HttpSession session) {
		int n = service.noticedelete(nnum);
		if (n > 0) {
			return "redirect:/admin_view/noticeboard";
		} else {
			return "redirect:/admin_view/noticeboard";
		}
	}
	@RequestMapping(value = "/admin_view/selnotice", method = RequestMethod.GET)
	public ModelAndView selnotice(int nnum, HttpSession session) {
		List<NoticeVo> nlist = service.nlist(nnum);
		ModelAndView mv = new ModelAndView("admin_view/selnotice");
		mv.addObject("list", nlist);
		return mv;
	}
}
	
	