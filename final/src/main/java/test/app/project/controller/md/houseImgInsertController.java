package test.app.project.controller.md;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import test.app.project.service.md.BusinessService;
import test.app.project.vo.AmenitiesVo;
import test.app.project.vo.HouseImgVo;

@Controller
public class houseImgInsertController {
	@Autowired
	private BusinessService service;
	public void setService(BusinessService service) {
		this.service = service;
	}	
	
	//업소 이미지 등록
	@RequestMapping(value="business_view/houseimginsert",method=RequestMethod.GET)
	public String houseImg(HttpSession session){
		return "/business_view/houseimginsert";
	}
	
	@RequestMapping(value="/business_view/houseimginsertok",method=RequestMethod.POST)
	public String writenoticeok(String house_img_num,String house_num,MultipartFile imgIn,HttpSession session){
		String uploadPath=
				session.getServletContext().getRealPath("/resources/upload");
			System.out.println(uploadPath);
			String house_org_name=imgIn.getOriginalFilename();
			String house_save_name=UUID.randomUUID() +"_" + house_org_name;
			try{
				InputStream fis=imgIn.getInputStream();
				FileOutputStream fos=
						new FileOutputStream(uploadPath+"\\" + house_save_name);
				FileCopyUtils.copy(fis, fos);
				fis.close();
				fos.close();
				HouseImgVo vo=new HouseImgVo();
			
				return ".busienss";
	   }catch(IOException io){
		   io.printStackTrace();
	   }
			return ".busienss";
	}
	
	
}
