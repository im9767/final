package test.app.project.controller.Y;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import test.app.project.service.Y.AdminService;
import test.app.project.vo.FaqVo;
import test.app.project.vo.HouseVo;
import test.app.project.vo.NoticeVo;

@Controller
public class BoardController {
	@Autowired
	private AdminService service;
	public void setService(AdminService service) {
		this.service = service;
	}
	//공지사항전체조회
	@RequestMapping(value = "/admin_view/noticeboard", method = RequestMethod.GET)
	public String allnoticelist(Model model) {
		List<NoticeVo> nlist = service.nlistAll();
		model.addAttribute("allnoticelist", nlist);
		return ".noticeboard";
	}
	//공지사항 작성
	@RequestMapping(value = "/admin_view/writenotice", method = RequestMethod.GET)
	public String lookwrite(){
		return "admin_view/writenotice";
	}
	//공지사항 작성체크
	@RequestMapping(value="/admin_view/writenoticeok",method=RequestMethod.POST)
	public String writenoticeok(String ntitle,String ncontent,HttpSession session) throws DataIntegrityViolationException{
		try{
		HashMap<String,Object> map=new HashMap<String, Object>();
		
		map.put("ntitle",ntitle);
		map.put("ncontent",ncontent);
		int n=service.wnotice(map);
		if(n>0){
			return "redirect:/admin_view/noticeboard";
		}else{
			return "/business_view/ac/allfail";
			}
		}catch(DataIntegrityViolationException dvo){
			dvo.printStackTrace();
			return "/business_view/ac/allfail";
		}
	}
	//공지사항 수정하기
	@RequestMapping(value = "/admin_view/upnotice", method = RequestMethod.GET)
	public ModelAndView upnotice(int nnum){
		List<NoticeVo> nlist = service.nlist(nnum);
		ModelAndView mv = new ModelAndView("admin_view/updatenotice");
		mv.addObject("upnoticelist", nlist);
		return mv;
	}
	//공지사항 수정체크
	@RequestMapping(value = "/admin_view/upnoticeok", method = RequestMethod.POST)
	public String upnotice(NoticeVo vo) throws Exception{
		try{
		int n=service.upnotice(vo);
		if (n > 0) {
			return "redirect:/admin_view/noticeboard";
		} else {
			return "/business_view/ac/allfail";
			}
		}catch(Exception dvo){
			dvo.printStackTrace();
			return "/business_view/ac/allfail";
		}
	}
	//공지사항 삭제
	@RequestMapping(value = "/admin_view/delnotice", method = RequestMethod.GET)
	public String delnotice(int nnum, HttpSession session) {
		int n = service.noticedelete(nnum);
		if (n > 0) {
			return "redirect:/admin_view/noticeboard";
		} else {
			return "business_view/ac/allfail";
		}
	}
	//공지사항 상세조회
	@RequestMapping(value = "/admin_view/selnotice", method = RequestMethod.GET)
	public ModelAndView selnotice(int nnum, HttpSession session) {
		List<NoticeVo> nlist = service.nlist(nnum);
		ModelAndView mv = new ModelAndView("admin_view/selnotice");
		mv.addObject("noticeinfolist", nlist);
		return mv;
	}
	//관리자 faq전체조회
		@RequestMapping(value = "/admin_view/faqboard", method = RequestMethod.GET)
		public String allfaqlist(Model model) {
			List<FaqVo> flist = service.flistAll();
			model.addAttribute("allfaqlist", flist);
			return ".faqboard";
		}
		//faq 작성
		@RequestMapping(value = "/admin_view/writefaq", method = RequestMethod.GET)
		public String writefaq(){
			return "admin_view/writefaq";
		}
		//faq 작성체크
		@RequestMapping(value="/admin_view/writefaqok",method=RequestMethod.POST)
		public String writefaqok(String ftitle,String fcontent,String fcnum,HttpSession session) throws DataIntegrityViolationException{
			try{
			HashMap<String,Object> map=new HashMap<String, Object>();
			
			map.put("ftitle",ftitle);
			map.put("fcontent",fcontent);
			map.put("fcnum",fcnum);
			int n=service.wfaq(map);
			if(n>0){
				return "redirect:/admin_view/faqboard";
			}else{
				return "/business_view/ac/allfail";
				}
			}catch(DataIntegrityViolationException dvo){
				dvo.printStackTrace();
				return "/business_view/ac/allfail";
			}
		}
		//faq 삭제
		@RequestMapping(value = "/admin_view/delfaq", method = RequestMethod.GET)
		public String delfaq(int fnum, HttpSession session) {
			int n = service.faqdelete(fnum);
			if (n > 0) {
				return "redirect:/admin_view/faqboard";
			} else {
				return "business_view/ac/allfail";
			}
		}
		//회원사이트에서 faq전체조회
				@RequestMapping(value = "/public/faq", method = RequestMethod.GET)
				public String mallfaqlist(Model model) {
					List<FaqVo> flist = service.flistAll();
					model.addAttribute("faq", flist);
					return ".public.faq";
				}
}
	
	