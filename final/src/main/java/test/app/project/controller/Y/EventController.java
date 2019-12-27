package test.app.project.controller.Y;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.SyncFailedException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.compiler.SyntaxError;
import org.apache.tiles.request.RequestException;
import org.aspectj.apache.bcel.generic.TargetLostException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.DefaultHandlerExceptionResolver;

import test.app.project.service.Y.AdminService;
import test.app.project.vo.EventVo;
import test.app.project.vo.EventimagesVo;



@Controller
public class EventController {
	@Autowired
	private AdminService service;
	public void setService(AdminService service) {
		this.service = service;
	}
	//이벤트 전체조회
	@RequestMapping(value = "/admin_view/eventboard", method = RequestMethod.GET)
	public String eventlist(Model model) {
		List<EventVo> elist = service.elistAll();
		model.addAttribute("alleventlist", elist);
		return ".eventboard";
	}
	//이벤트작성
	@RequestMapping(value = "/admin_view/writeevent", method = RequestMethod.GET)
	public String lookwrite(){
		return "admin_view/writeevent";
	}
	//이벤트작성체크
	@RequestMapping(value="/admin_view/writeeventok",method=RequestMethod.POST)
	public String writeeventok(String etitle,String edate,String sdate,@RequestParam(required=false) List<MultipartFile> imgIn,HttpSession session) throws IOException{
		try{
		java.sql.Date sdate1=java.sql.Date.valueOf(sdate);
		java.sql.Date edate1=java.sql.Date.valueOf(edate);
		HashMap<String, Object> elist= new HashMap<String, Object>();
		elist.put("etitle", etitle);
		elist.put("sdate", sdate1);
		elist.put("edate", edate1);
		//업로드할 폴더의 절대경로 얻어오기
				String uploadPath=
					session.getServletContext().getRealPath("/resources/upload");
				System.out.println(uploadPath);
	
		
	   for(int j = 0;j<imgIn.size();j++){
		 //전송된 파일명
			String orgfilename=imgIn.get(j).getOriginalFilename();
			elist.put("orgfilename"+j+1,orgfilename);
		//저장될 파일명(중복되지 않는 이름으로 만들기)
			String savefilename=UUID.randomUUID() +"_" + orgfilename;
			elist.put("savefilename"+j+1,savefilename);
		//전송된 파일을 읽어오기 위한 스트림
				InputStream fis=imgIn.get(j).getInputStream();
		//전송된 파일을 서버에 출력하기 위한 스트림
				FileOutputStream fos=
						new FileOutputStream(uploadPath+"\\" + savefilename);
		//파일복사하기(업로드하기)
				FileCopyUtils.copy(fis, fos);
				fis.close();
				fos.close();
	   }
		elist.put("imgcnt", imgIn.size());
				service.writeevent(elist);
			} catch (Exception e) {
				e.printStackTrace();
				return "/business_view/ac/allfail";
			}
		return "redirect:/admin_view/eventboard";		
	}
	//이벤트삭제
	@RequestMapping(value = "/admin_view/delevent", method = RequestMethod.GET)
	public String delevent(int event_Num, HttpSession session) {
		
		String uploadPath=session.getServletContext().getRealPath("/resources/upload");
		System.out.println(uploadPath);
		
		List<String> s=service.imginfo(event_Num);
		
		for(int a=0;a<s.size();a++){
		String savefilename=s.get(a);
		File f=new File(uploadPath +"\\" + savefilename);
		if(!f.delete()) {
			new Exception("파일삭제실패!");
			}
		}
		int n = service.eventdelete(event_Num);
		if (n > 0) {
			return "redirect:/admin_view/eventboard";
		} else {
			return "business_view/ac/allfail";
		}
	}
	//이벤트 상세조회
	@RequestMapping(value = "/admin_view/seleventinfo", method = RequestMethod.GET)
	public ModelAndView selevent(int event_Num, HttpSession session) {
		List<HashMap<String, Object>> nlist = service.seleventinfo(event_Num);
		ModelAndView mv = new ModelAndView("admin_view/selevent");
		mv.addObject("eventinfolist", nlist);
		mv.addObject("list", nlist);
		return mv;
	}
	//이벤트 수정하기
	@RequestMapping(value = "/admin_view/upevent", method = RequestMethod.GET)
	public ModelAndView upevent(int event_Num, HttpSession session) {
		List<HashMap<String, Object>> nlist = service.selevent(event_Num);
		ModelAndView mv = new ModelAndView("admin_view/updateevent");	
		mv.addObject("upeventlist", nlist);
		return mv;
	}
	//이벤트 수정체크
	@RequestMapping(value="/admin_view/updateeventok",method=RequestMethod.POST)
	public String updateeventok(int event_Num,String etitle,String edate,String sdate,@RequestParam(required=false) List<MultipartFile> imgIn,HttpSession session) throws IOException{
		java.sql.Date sdate1=java.sql.Date.valueOf(sdate);
		java.sql.Date edate1=java.sql.Date.valueOf(edate);
		HashMap<String, Object> elist= new HashMap<String, Object>();
		elist.put("etitle", etitle);
		elist.put("sdate", sdate1);
		elist.put("edate", edate1);
	try{
		
		String uploadPath=
				session.getServletContext().getRealPath("/resources/upload");
		System.out.println(uploadPath);
		List<String> s=service.imginfo(event_Num);
		
		for(int a=0;a<s.size();a++){
		String savefilename=s.get(a);
		File f=new File(uploadPath +"\\" + savefilename);
		if(!f.delete()) {
			new Exception("파일삭제실패!");
			}
		}
	   for(int j = 0;j<imgIn.size();j++){
			String orgfilename=imgIn.get(j).getOriginalFilename();
			elist.put("orgfilename"+j+1,orgfilename);
			String savefilename=UUID.randomUUID() +"_" + orgfilename;
			elist.put("savefilename"+j+1,savefilename);
				InputStream fis=imgIn.get(j).getInputStream();
				FileOutputStream fos=
						new FileOutputStream(uploadPath+"\\" + savefilename);
				FileCopyUtils.copy(fis, fos);
				fis.close();
				fos.close();
	   }
		elist.put("imgcnt", imgIn.size());
		service.updateevent(elist,event_Num);	
		}catch(Exception e){
			e.printStackTrace();
			return "business_view/ac/allfail";
		}
		return "redirect:/admin_view/eventboard";		
	}
	
}
	
	