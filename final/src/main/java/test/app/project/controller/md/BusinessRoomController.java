package test.app.project.controller.md;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

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

import test.app.project.service.md.BusinessService;


@Controller
public class BusinessRoomController {
	@Autowired
	private BusinessService service;
	public void setService(BusinessService service) {
		this.service = service;
	}
	//사업자 등록된 방전체조회
	@RequestMapping(value = "business_view/roomsboards", method = RequestMethod.GET)
	public String allroomlist(Model model) {
		int house_num=10;
		List<HashMap<String,Object>> arlist = service.roomlistAll(house_num);
		model.addAttribute("allroomlist", arlist);
	
		return ".business_view.ac.roomsboard";
	}
	//방등록
	@RequestMapping(value = "business_view/writeroom", method = RequestMethod.GET)
	public String inroom(){
		return ".business_view.ac.writeroom";
	}
	//방등록 체크
	@RequestMapping(value="business_view/writeroomok",method=RequestMethod.POST)
	public String writeroomok(String rcontent,String rname,@RequestParam(required=false) List<MultipartFile> imgIn,int price,int max,HttpSession session) throws IOException{
		HashMap<String, Object> irlist= new HashMap<String, Object>();
		int house_num=10;
		irlist.put("rname", rname);
		irlist.put("rcontent",rcontent);
		irlist.put("price", price);
		irlist.put("max", max);
		//업로드할 폴더의 절대경로 얻어오기
				String uploadPath=
					session.getServletContext().getRealPath("/resources/upload");
				System.out.println(uploadPath);
	try{
		
	   for(int j = 0;j<imgIn.size();j++){
		   //전송된 파일명
			String orgfilename=imgIn.get(j).getOriginalFilename();
			irlist.put("orgfilename"+j+1,orgfilename);
			//저장될 파일명(중복되지 않는 이름으로 만들기)
			String savefilename=UUID.randomUUID() +"_" + orgfilename;
			irlist.put("savefilename"+j+1,savefilename);
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
		irlist.put("imgcnt", imgIn.size());
		service.writeroom(irlist,house_num);	
		}catch(Exception e){
			e.printStackTrace();
		}
		return "redirect:/business_view/ac/roomsboard";		
	}
	//방 삭제
	@RequestMapping(value = "business_view/delroom", method = RequestMethod.GET)
	public String delroom(int room_num, HttpSession session) {
		int n = service.roomdelete(room_num);
		if (n > 0) {
			return "redirect:/business_view/ac/roomsboard";
		} else {
			return "redirect:/business_view/ac/roomsboard";
		}
	}
	//방 상세정보
		@RequestMapping(value = "business_view/selroominfo", method = RequestMethod.GET)
		public ModelAndView selroominfo(int room_num,HttpSession session) {
			List<HashMap<String, Object>> srlist = service.selroominfo(room_num);
			ModelAndView mv = new ModelAndView("business_view/ac/selroom");
			mv.addObject("roominfolist", srlist);
			return mv;
		}
		//방정보 수정
		@RequestMapping(value = "business_view/uproom", method = RequestMethod.GET)
		public ModelAndView uproom(int room_num, HttpSession session) {
			List<HashMap<String, Object>> nlist = service.selroominfo(room_num);
			ModelAndView mv = new ModelAndView("business_view/ac/updateroom");	
			mv.addObject("uproomlist", nlist);
			return mv;
		}
		//방정보 수정체크
		@RequestMapping(value="business_view/updateroomok",method=RequestMethod.POST)
		public String updateroomok(String rcontent,String rname,@RequestParam(required=false) List<MultipartFile> imgIn,int price,int max,int room_num,HttpSession session) throws IOException{
			HashMap<String, Object> irlist= new HashMap<String, Object>();
			irlist.put("rname", rname);
			irlist.put("rcontent",rcontent);
			irlist.put("price", price);
			irlist.put("max", max);
			System.out.println(max);
			//업로드할 폴더의 절대경로 얻어오기
					String uploadPath=
						session.getServletContext().getRealPath("/resources/upload");
					System.out.println(uploadPath);
		try{			
		   for(int j = 0;j<imgIn.size();j++){
			   //전송된 파일명
				String orgfilename=imgIn.get(j).getOriginalFilename();
				irlist.put("orgfilename"+j+1,orgfilename);
				//저장될 파일명(중복되지 않는 이름으로 만들기)
				String savefilename=UUID.randomUUID() +"_" + orgfilename;
				irlist.put("savefilename"+j+1,savefilename);
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
			irlist.put("imgcnt", imgIn.size());
			service.uproom(irlist,room_num);	
			}catch(Exception e){
				e.printStackTrace();
			}
			return "redirect:business_view/ac/roomsboard";		
		}
}
	
	