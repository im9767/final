package test.app.project.controller.md;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
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
import org.springframework.web.multipart.MultipartFile;

import test.app.project.service.Y.AdminService;
import test.app.project.service.md.BusinessService;
import test.app.project.vo.AmenitiesVo;


@Controller
public class BusinessAmenitiesController {
	@Autowired
	private BusinessService service;
	public void setService(BusinessService service) {
		this.service = service;
	}
	//편의시설 등록작성이동
	@RequestMapping(value="business_view/writeamenities",method=RequestMethod.GET)
	public String amenitiesForm(){
		
		return "business_view/ac/writeamenities";
	}
	//편의시설 작성체크				
		@RequestMapping(value="business_view/writeamenitiesok",method=RequestMethod.POST)
		public String writenoticeok(String aname,String acontent,MultipartFile imgIn,HttpSession session){
			String uploadPath=
					session.getServletContext().getRealPath("/resources/upload");
				System.out.println(uploadPath);
				String orgfilename=imgIn.getOriginalFilename();
				String savefilename=UUID.randomUUID() +"_" + orgfilename;
				try{
					InputStream fis=imgIn.getInputStream();
					FileOutputStream fos=
							new FileOutputStream(uploadPath+"\\" + savefilename);
					FileCopyUtils.copy(fis, fos);
					fis.close();
					fos.close();
					AmenitiesVo vo=new AmenitiesVo(0,aname,acontent,orgfilename,savefilename);
					service.writeamenities(vo);
					return ".business";
		   }catch(IOException io){
			   io.printStackTrace();
		   }
				return ".business";
		}
}
	
	