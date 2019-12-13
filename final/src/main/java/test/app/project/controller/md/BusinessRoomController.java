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
	//����� ��ϵ� ����ü��ȸ
	@RequestMapping(value = "business_view/roomsboards", method = RequestMethod.GET)
	public String allroomlist(Model model) {
		int house_num=10;
		List<HashMap<String,Object>> arlist = service.roomlistAll(house_num);
		model.addAttribute("allroomlist", arlist);
	
		return ".business_view.ac.roomsboard";
	}
	//����
	@RequestMapping(value = "business_view/writeroom", method = RequestMethod.GET)
	public String inroom(){
		return ".business_view.ac.writeroom";
	}
	//���� üũ
	@RequestMapping(value="business_view/writeroomok",method=RequestMethod.POST)
	public String writeroomok(String rcontent,String rname,@RequestParam(required=false) List<MultipartFile> imgIn,int price,int max,HttpSession session) throws IOException{
		HashMap<String, Object> irlist= new HashMap<String, Object>();
		int house_num=10;
		irlist.put("rname", rname);
		irlist.put("rcontent",rcontent);
		irlist.put("price", price);
		irlist.put("max", max);
		//���ε��� ������ ������ ������
				String uploadPath=
					session.getServletContext().getRealPath("/resources/upload");
				System.out.println(uploadPath);
	try{
		
	   for(int j = 0;j<imgIn.size();j++){
		   //���۵� ���ϸ�
			String orgfilename=imgIn.get(j).getOriginalFilename();
			irlist.put("orgfilename"+j+1,orgfilename);
			//����� ���ϸ�(�ߺ����� �ʴ� �̸����� �����)
			String savefilename=UUID.randomUUID() +"_" + orgfilename;
			irlist.put("savefilename"+j+1,savefilename);
			//���۵� ������ �о���� ���� ��Ʈ��
				InputStream fis=imgIn.get(j).getInputStream();
				//���۵� ������ ������ ����ϱ� ���� ��Ʈ��
				FileOutputStream fos=
						new FileOutputStream(uploadPath+"\\" + savefilename);
				//���Ϻ����ϱ�(���ε��ϱ�)
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
	//�� ����
	@RequestMapping(value = "business_view/delroom", method = RequestMethod.GET)
	public String delroom(int room_num, HttpSession session) {
		int n = service.roomdelete(room_num);
		if (n > 0) {
			return "redirect:/business_view/ac/roomsboard";
		} else {
			return "redirect:/business_view/ac/roomsboard";
		}
	}
	//�� ������
		@RequestMapping(value = "business_view/selroominfo", method = RequestMethod.GET)
		public ModelAndView selroominfo(int room_num,HttpSession session) {
			List<HashMap<String, Object>> srlist = service.selroominfo(room_num);
			ModelAndView mv = new ModelAndView("business_view/ac/selroom");
			mv.addObject("roominfolist", srlist);
			return mv;
		}
		//������ ����
		@RequestMapping(value = "business_view/uproom", method = RequestMethod.GET)
		public ModelAndView uproom(int room_num, HttpSession session) {
			List<HashMap<String, Object>> nlist = service.selroominfo(room_num);
			ModelAndView mv = new ModelAndView("business_view/ac/updateroom");	
			mv.addObject("uproomlist", nlist);
			return mv;
		}
		//������ ����üũ
		@RequestMapping(value="business_view/updateroomok",method=RequestMethod.POST)
		public String updateroomok(String rcontent,String rname,@RequestParam(required=false) List<MultipartFile> imgIn,int price,int max,int room_num,HttpSession session) throws IOException{
			HashMap<String, Object> irlist= new HashMap<String, Object>();
			irlist.put("rname", rname);
			irlist.put("rcontent",rcontent);
			irlist.put("price", price);
			irlist.put("max", max);
			System.out.println(max);
			//���ε��� ������ ������ ������
					String uploadPath=
						session.getServletContext().getRealPath("/resources/upload");
					System.out.println(uploadPath);
		try{			
		   for(int j = 0;j<imgIn.size();j++){
			   //���۵� ���ϸ�
				String orgfilename=imgIn.get(j).getOriginalFilename();
				irlist.put("orgfilename"+j+1,orgfilename);
				//����� ���ϸ�(�ߺ����� �ʴ� �̸����� �����)
				String savefilename=UUID.randomUUID() +"_" + orgfilename;
				irlist.put("savefilename"+j+1,savefilename);
				//���۵� ������ �о���� ���� ��Ʈ��
					InputStream fis=imgIn.get(j).getInputStream();
					//���۵� ������ ������ ����ϱ� ���� ��Ʈ��
					FileOutputStream fos=
							new FileOutputStream(uploadPath+"\\" + savefilename);
					//���Ϻ����ϱ�(���ε��ϱ�)
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
	
	