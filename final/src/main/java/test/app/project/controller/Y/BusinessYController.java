package test.app.project.controller.Y;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import test.app.project.service.Y.BusinessYService;


@Controller
public class BusinessYController {
	@Autowired
	private BusinessYService service;
	public void setService(BusinessYService service) {
		this.service = service;
	}
	//사업자정보 수정페이지 이동
	@RequestMapping(value="business_view/updatebusinessinfo",method=RequestMethod.GET)
	public ModelAndView upinfo(HttpSession session){
		int house_num=(Integer)session.getAttribute("house_num");
		List<HashMap<String,Object>> list = service.biflist(house_num);
		System.out.println(list);
		ModelAndView mv = new ModelAndView("business_view/ac/updatebusinessinfo");
		mv.addObject("businessinfolist", list);
		return mv;
	
	}
	//사업자 정보 수정 체크
	@RequestMapping(value="business_view/updatebusinessinfook",method=RequestMethod.POST)
	public String ubinfook(HttpSession session,String bname,String bcompany,String blicense,String bworkplace,String bcom_tel,String bemail,
			String intro,String bpwd,MultipartFile file){
		try {
		String bid=(String)session.getAttribute("bid");
		HashMap<String, Object> map= new HashMap<String, Object>();
		map.put("bname", bname);
		map.put("bcompany", bcompany);
		map.put("blicense", blicense);
		map.put("bworkplace", bworkplace);
		map.put("bid", bid);
		map.put("bcom_tel", bcom_tel);
		map.put("bemail", bemail);
		map.put("intro", intro);
		map.put("bpwd", bpwd);
		int house_num=(Integer)session.getAttribute("house_num");
		map.put("house_num", house_num);

			String uploadPath=
					session.getServletContext().getRealPath("/resources/upload");
			System.out.println(uploadPath);		
			String savefilename=service.himgsavename(house_num);
			
			File f=new File(uploadPath +"\\" + savefilename);
			if(!f.delete()) {
				new Exception("삭제실패");
				}		
			//업체이미지 원본명
			String house_org_name=file.getOriginalFilename();
			map.put("house_org_name", house_org_name);
			//업체이미지 저장명
			String house_save_name=UUID.randomUUID() +"_" + house_org_name;
			map.put("house_save_name", house_save_name);
			InputStream is=file.getInputStream();
			FileOutputStream fos=new FileOutputStream(uploadPath+"\\"+house_save_name);
			FileCopyUtils.copy(is, fos);
			is.close();
			fos.close();
			
			service.inupbinfo(map);
		} catch (Exception e) {
			e.printStackTrace();
			return "business_view/ac/allfail";
		}
		return ".business";
	}
	
	//사업자 업체 편의시설
		@RequestMapping(value = "business_view/updatehouseamenities", method = RequestMethod.GET)
		public ModelAndView selham() {
			List<HashMap<String,Object>> list = service.selamenities();
			ModelAndView mv = new ModelAndView("business_view/ac/updatehouseamenities");
			mv.addObject("selam", list);
			return mv;
		}
	//사업자 업체 편의시설 수정체크
		@RequestMapping(value="business_view/updateamenitiesok",method=RequestMethod.POST)
		public String upamok(String[] sublist,HttpSession sesson){
			int hnum=(Integer) sesson.getAttribute("house_num");
			HashMap<String, Object> map= new HashMap<String, Object>();
			for (int i = 0; i < sublist.length; i++) {
				map.put("baname"+i,sublist[i]);
			}
			try {
				service.upba(map,hnum);
			} catch (Exception e) {
				e.printStackTrace();
				return "business_view/ac/allfail";
			}
			return ".business";
		}
		//사업자 회원가입 id,pwd,email
		@RequestMapping(value = "business_view/insertbusiness", method = RequestMethod.GET)
		public String inbusiness() {
			return "business_view/ac/insertbusiness";
		}
		//사업자 회원가입 체크
				@RequestMapping(value = "business_view/insertbusinessok", method = RequestMethod.POST)
				public String inbusinessok(String bid,String bpwd,String bemail) {
					HashMap<String, Object> map= new HashMap<String, Object>();
					map.put("bid", bid);
					map.put("bpwd", bpwd);
					map.put("bemail", bemail);
					int a=service.joinbusiness(map);
					if(a>0){
					return "business_view/ac/login";
							}else{
								return "business_view/ac/insertbusiness";
							}
				}
		//사업자 아이디체크
		@RequestMapping(value="business_view/idCheck",produces="application/json;charset=utf-8")
		@ResponseBody
		public String bidCheck(String bid){	
			String using = service.bidCheck(bid);
			JSONObject json = new JSONObject();
			
			if(using!=null){
				json.put("using",true);
			}else{
				json.put("using", false);
			}
			return json.toString();		
		}
		//업체등록
				@RequestMapping(value = "business_view/inserthouse", method = RequestMethod.GET)
					public ModelAndView inhouse() {
						List<HashMap<String,Object>> list = service.selamenities();
						ModelAndView mv = new ModelAndView("business_view/ac/inserthouse");
						mv.addObject("selam2", list);
						return mv;
				}
		//업체등록체크
				@RequestMapping(value = "business_view/inserthouseok", method = RequestMethod.POST)
				public String inhouseok2(int bnum,String intro,String checkintime,String checkouttime,String company,String license,String ceo,String orgaddr,
						String workplace,String com_tel,String[] sublist,MultipartFile file,HttpSession session) {
					HashMap<String, Object> map=new HashMap<String, Object>();
					map.put("bnum", bnum);
					map.put("intro", intro);
					map.put("checkintime", checkintime);
					map.put("checkouttime", checkouttime);
					map.put("company", company);
					map.put("license", license);
					map.put("ceo", ceo);
					map.put("orgaddr", orgaddr);
					map.put("workplace", workplace);
					map.put("com_tel", com_tel);
					String bid=(String) session.getAttribute("bid");
					map.put("bid", bid);
					int anum=sublist.length;
					map.put("anum", anum);
					for(int a=0;a<sublist.length;a++){
						map.put("sl"+a,sublist[a]);
					}
					//이미지 재업로드
					try {
					String uploadPath=
							session.getServletContext().getRealPath("/resources/upload");
					System.out.println(uploadPath);
					/*
					String savefilename=service.himgsavename(house_num);
					
					File f=new File(uploadPath +"\\" + savefilename);
					if(!f.delete()) {
						new Exception("삭제실패");
						}		
					System.out.println(uploadPath);		

					map.put("bid", bid);
					*/
					//업체이미지 원본명
					String house_org_name=file.getOriginalFilename();
					map.put("house_org_name", house_org_name);
					//업체이미지 저장명
					String house_save_name=UUID.randomUUID() +"_" + house_org_name;
					map.put("house_save_name", house_save_name);
					InputStream is=file.getInputStream();
					FileOutputStream fos=new FileOutputStream(uploadPath+"\\"+house_save_name);
					FileCopyUtils.copy(is, fos);
					is.close();
					fos.close();
					//업체등록+편의시설
						service.inhouse(map);
					} catch (Exception e) {
						e.printStackTrace();
						return "business_view/ac/allfail";
					}														
					return ".business_view.ac.main_sub";
			}
				//업체재등록
				@RequestMapping(value = "business_view/updatehouse", method = RequestMethod.GET)
					public ModelAndView uphouse() {
						List<HashMap<String,Object>> list = service.selamenities();
						ModelAndView mv = new ModelAndView("business_view/ac/inserthouse2");
						mv.addObject("selam2", list);
						return mv;
				}
				
				//업체 재등록체크
				@RequestMapping(value = "business_view/updatehouseok", method = RequestMethod.POST)
				public String uphouseok2(int bnum,String intro,String checkintime,String checkouttime,String company,String license,String ceo,String orgaddr,
						String workplace,String com_tel,String[] sublist,MultipartFile file,HttpSession session) {
					HashMap<String, Object> map=new HashMap<String, Object>();
					map.put("bnum", bnum);
					map.put("intro", intro);
					map.put("checkintime", checkintime);
					map.put("checkouttime", checkouttime);
					map.put("company", company);
					map.put("license", license);
					map.put("ceo", ceo);
					map.put("orgaddr", orgaddr);
					map.put("workplace", workplace);
					map.put("com_tel", com_tel);
					String bid=(String) session.getAttribute("bid");
					map.put("bid", bid);
					int anum=sublist.length;
					map.put("anum", anum);
					for(int a=0;a<sublist.length;a++){
						map.put("sl"+a,sublist[a]);
						System.out.println(sublist[a]);
					}
					//이미지업로드
					try {
					String uploadPath=
							session.getServletContext().getRealPath("/resources/upload");
					System.out.println(uploadPath);

					map.put("bid", bid);
					//업체이미지 원본명
					String house_org_name=file.getOriginalFilename();
					map.put("house_org_name", house_org_name);
					//업체이미지 저장명
					String house_save_name=UUID.randomUUID() +"_" + house_org_name;
					map.put("house_save_name", house_save_name);
					InputStream is=file.getInputStream();
					FileOutputStream fos=new FileOutputStream(uploadPath+"\\"+house_save_name);
					FileCopyUtils.copy(is, fos);
					is.close();
					fos.close();
					//업체등록+편의시설
						service.rehouse(map);
					} catch (Exception e) {
						e.printStackTrace();
						return "business_view/ac/allfail";
					}														
					return ".business_view.ac.main_sub";
			}
				//예약 확인 페이지이동
				@RequestMapping(value = "business_view/bookingstauts", method = RequestMethod.GET)
				public ModelAndView gobooking(HttpSession session) {
					int house_num=(Integer)session.getAttribute("house_num");
					List<HashMap<String,Object>> list = service.allbooking(house_num);
					ModelAndView mv = new ModelAndView(".business_view.ac.bookingstauts");
					mv.addObject("allbooking", list);
					return mv;
			}
}
	
	