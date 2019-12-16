package test.app.project.controller.Y;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import test.app.project.service.Y.AdminService;
import test.app.project.service.Y.BusinessYService;
import test.app.project.vo.HouseVo;
import test.app.project.vo.NoticeVo;

@Controller
public class RoomController {
	@Autowired
	private BusinessYService service;
	public void setService(BusinessYService service) {
		this.service = service;
	}

	//방전체보기
	@RequestMapping(value = "/business_view/roomsboard", method = RequestMethod.GET)
	public String allroomlist(Model model,HttpSession session) {
		int house_num=(Integer)session.getAttribute("house_num");
		List<HashMap<String,Object>> arlist = service.roomlistAll(house_num);
		model.addAttribute("allroomlist", arlist);
		return ".business_view.ac.roomsboard";
	}
	//방 등록
	@RequestMapping(value = "/business_view/writeroom", method = RequestMethod.GET)
	public String inroom(HttpSession session){
		return "/business_view/ac/writeroom";
	}
	//방등록체크
	@RequestMapping(value="/business_view/writeroomok",method=RequestMethod.POST)
	public String writeroomok(String rcontent,String rname,@RequestParam(required=false) List<MultipartFile> imgIn,int price,int max,HttpSession session) throws IOException{
		HashMap<String, Object> irlist= new HashMap<String, Object>();
		int house_num=(Integer)session.getAttribute("house_num");
		irlist.put("rname", rname);
		irlist.put("rcontent",rcontent);
		irlist.put("price", price);
		irlist.put("max", max);
				String uploadPath=
					session.getServletContext().getRealPath("/resources/upload");
				System.out.println(uploadPath);
	try{
		
	   for(int j = 0;j<imgIn.size();j++){
		
			String orgfilename=imgIn.get(j).getOriginalFilename();
			irlist.put("orgfilename"+j+1,orgfilename);
		
			String savefilename=UUID.randomUUID() +"_" + orgfilename;
			irlist.put("savefilename"+j+1,savefilename);
		
				InputStream fis=imgIn.get(j).getInputStream();
		
				FileOutputStream fos=
						new FileOutputStream(uploadPath+"\\" + savefilename);
		
				FileCopyUtils.copy(fis, fos);
				fis.close();
				fos.close();
	   }
		irlist.put("imgcnt", imgIn.size());
		service.writeroom(irlist,house_num);	
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/business_view/roomsboard";		
	}
	//방 삭제
	@RequestMapping(value = "/business_view/delroom", method = RequestMethod.GET)
	public String delroom(int room_num, HttpSession session) {
		String uploadPath=
				session.getServletContext().getRealPath("/resources/upload");
		System.out.println(uploadPath);
		List<String> s=service.rimginfo(room_num);
		
		for(int a=0;a<s.size();a++){
		String savefilename=s.get(a);
		File f=new File(uploadPath +"\\" + savefilename);
		if(!f.delete()) {
			new Exception("삭제실패");
			}
		}
		int n = service.roomdelete(room_num);
		if (n > 0) {
			return "redirect:/business_view/roomsboard";
		} else {
			return "redirect:/business_view/roomsboard";
		}
	}
	//방 상세조회
		@RequestMapping(value = "/business_view/selroominfo", method = RequestMethod.GET)
		public ModelAndView selroominfo(int room_num,HttpSession session) {
			List<HashMap<String, Object>> srlist = service.selroominfo(room_num);
			ModelAndView mv = new ModelAndView("business_view/ac/selroom");
			mv.addObject("roominfolist", srlist);
			return mv;
		}
	//방수정 이동
		@RequestMapping(value = "/business_view/uproom", method = RequestMethod.GET)
		public ModelAndView uproom(int room_num, HttpSession session) {
			List<HashMap<String, Object>> nlist = service.selroominfo(room_num);
			ModelAndView mv = new ModelAndView("business_view/ac/updateroom");	
			mv.addObject("uproomlist", nlist);
			return mv;
		}
	//방 수정 체크	
		@RequestMapping(value="/business_view/updateroomok",method=RequestMethod.POST)
		public String updateroomok(String rcontent,String rname,@RequestParam(required=false) List<MultipartFile> imgIn,int price,int max,int room_num,HttpSession session) throws IOException{
			HashMap<String, Object> irlist= new HashMap<String, Object>();
			irlist.put("rname", rname);
			irlist.put("rcontent",rcontent);
			irlist.put("price", price);
			irlist.put("max", max);
			
		try{
			String uploadPath=
					session.getServletContext().getRealPath("/resources/upload");
			System.out.println(uploadPath);
			List<String> s=service.rimginfo(room_num);
			for(int a=0;a<s.size();a++){
			String savefilename=s.get(a);
			File f=new File(uploadPath +"\\" + savefilename);
			if(!f.delete()) {
				new Exception("�뙆�씪�궘�젣�떎�뙣!");
				}
			}
		   for(int j = 0;j<imgIn.size();j++){
			 
				String orgfilename=imgIn.get(j).getOriginalFilename();
				irlist.put("orgfilename"+j+1,orgfilename);
			
				String savefilename=UUID.randomUUID() +"_" + orgfilename;
				irlist.put("savefilename"+j+1,savefilename);
			
					InputStream fis=imgIn.get(j).getInputStream();
			
					FileOutputStream fos=
							new FileOutputStream(uploadPath+"\\" + savefilename);
			
					FileCopyUtils.copy(fis, fos);
					fis.close();
					fos.close();
		   }
			irlist.put("imgcnt", imgIn.size());
			service.uproom(irlist,room_num);	
			}catch(Exception e){
				e.printStackTrace();
			}
			return "redirect:/business_view/roomsboard";		
		}
}
	
	