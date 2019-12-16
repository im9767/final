package test.app.project.controller.l;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import test.app.project.service.L.MembersService1;
import test.app.project.vo.HouseImgVo;

@Controller
public class HouseImgController {
	@Autowired private MembersService1 service;
	
	@RequestMapping(value="/house/image",method=RequestMethod.GET)
	public String houseuploadForm(){
		return "business_view/ac/sampleform";
	}
	
	@RequestMapping(value="/house/image",method=RequestMethod.POST)
	public String HouseImgUpload(MultipartFile file,HttpSession session){
		String uploadPath=
				session.getServletContext().getRealPath("/resources/upload");
		System.out.println(uploadPath);
		//사업자 아이디 가져오기
		String bid=(String)session.getAttribute("bid");
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("bid", bid);
		//업체식별키 얻어오기
		int house_num=service.getBnum(map).getHouse_Num();
		//업체이미지 원본명
		String house_org_name=file.getOriginalFilename();
		//업체이미지 저장명
		String house_save_name=UUID.randomUUID() +"_" + house_org_name;
		HouseImgVo hvo=new HouseImgVo(0, house_num, house_org_name, house_save_name);
		try{
			InputStream is=file.getInputStream();
			FileOutputStream fos=new FileOutputStream(uploadPath+"\\"+house_save_name);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			//업체이미지 테이블에 데이터 등록
			service.houseImgInsert(hvo);
		}catch(IOException io){
			io.printStackTrace();
		}
		
		return null;
	}
}




