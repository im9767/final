package test.app.project.controller.Y;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpSession;

import org.junit.internal.runners.model.MultipleFailureException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import test.app.project.service.Y.BusinessYService;


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
		int houseCnt=(Integer)session.getAttribute("houseCnt");
		System.out.println("housecnt: " + houseCnt);
		return ".business_view.ac.roomsboard";
	}
	//방 등록
	@RequestMapping(value = "/business_view/writeroom", method = RequestMethod.GET)
	public String inroom(HttpSession session){
		return "/business_view/ac/writeroom";
	}

	//방등록완료
	@RequestMapping(value="business_view/writeroomok",method=RequestMethod.POST)
	public String writeroomok(String rcontent,String rname,@RequestParam(required=false) List<MultipartFile> imgIn,String price,String max,HttpSession session) throws IOException{
		try{
			int price1=Integer.parseInt(price);
			int max1=Integer.parseInt(max);
		HashMap<String, Object> irlist= new HashMap<String, Object>();
		int house_num=(Integer)session.getAttribute("house_num");
		irlist.put("rname", rname);
		irlist.put("rcontent",rcontent);
		irlist.put("price", price1);
		irlist.put("max", max1);
				String uploadPath=
					session.getServletContext().getRealPath("/resources/upload");
				System.out.println(uploadPath);		
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
			return "/business_view/ac/allfail";
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
			return "business_view/ac/allfail";
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
		public String updateroomok(String rcontent,String rname,@RequestParam(required=false) List<MultipartFile> imgIn,String price,String max,String room_num,HttpSession session) throws IOException{
			try{
				int price1=Integer.parseInt(price);
				int max1=Integer.parseInt(max);
				int room_num1=Integer.parseInt(room_num);
			HashMap<String, Object> irlist= new HashMap<String, Object>();
			irlist.put("rname", rname);
			irlist.put("rcontent",rcontent);
			irlist.put("price", price1);
			irlist.put("max", max1);			
			String uploadPath=
					session.getServletContext().getRealPath("/resources/upload");
			System.out.println(uploadPath);
			List<String> s=service.rimginfo(room_num1);
			for(int a=0;a<s.size();a++){
			String savefilename=s.get(a);
			File f=new File(uploadPath +"\\" + savefilename);
			if(!f.delete()) {
				new Exception("파일삭제!");
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
			service.uproom(irlist,room_num1);	
			}catch(Exception e){
				e.printStackTrace();
				return "business_view/ac/allfail";
			}
			return "redirect:/business_view/roomsboard";		
		}
}
	
	