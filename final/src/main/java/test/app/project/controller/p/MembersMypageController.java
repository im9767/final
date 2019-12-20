package test.app.project.controller.p;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import test.app.project.service.p.MembersService;
import test.app.project.util.PageUtil;
import test.app.project.vo.MembersVo;
import test.app.project.vo.ReiewImgVo;
import test.app.project.vo.ReviewVo;

@Controller
public class MembersMypageController {
	
	@Autowired
	private MembersService membersService;
	
	// 마이페이지 이동
	@RequestMapping(value="/members/mypage")
	public String mypage(HttpSession session, Model model){
		String mid = (String)session.getAttribute("id");
		HashMap<String, Object> map = membersService.myinfo(mid);
		int cntCoupon = membersService.cntCoupon(mid);
		model.addAttribute("map", map);
		model.addAttribute("cntCoupon",cntCoupon);
		
		return ".members_p.mypage";
	}
	
	// 회원정보 수정페이지 이동
	@RequestMapping(value="/members/infoupdate",method=RequestMethod.GET)
	public String infoupdateForm(HttpSession session,Model model){
		
		String mid = (String) session.getAttribute("id");
		
		HashMap<String, Object> map = membersService.myinfo(mid);
		model.addAttribute("map", map);
		
		MembersVo vo = membersService.idCheck(mid);
		model.addAttribute("vo",vo);
		
		int cntCoupon = membersService.cntCoupon(mid);
		model.addAttribute("cntCoupon",cntCoupon);
		
		return ".members_p.infoupdate";
	}
	
	// 회원정보 수정하기
	@RequestMapping(value="/members/infoupdate",method=RequestMethod.POST)
	public String infoupdate(String mname, String mid, String mpwd, String memail, String mphone, Model model){
		
		MembersVo vo = new MembersVo();
		
		vo.setMname(mname);
		vo.setMid(mid);
		vo.setMpwd(mpwd);
		vo.setMemail(memail);
		vo.setMphone(mphone);
		
		int n = membersService.myinfoupdate(vo);
		
		return "redirect:/members/mypage";
	}
	
	// 회원 예약내역 조회
	@RequestMapping(value="/members/bookingList",method=RequestMethod.GET)
	public String bookingList(@RequestParam(value="pageNum",defaultValue="1")int pageNum, Model model,HttpSession session){
		
		String mid = (String) session.getAttribute("id");
		
		int totalRowCount = membersService.bookingCount(mid);
		
		PageUtil pagination = new PageUtil(pageNum, totalRowCount, 5, 5);
		
		HashMap<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("mid", mid);
		parameter.put("startRow", pagination.getStartRow());
		parameter.put("endRow", pagination.getEndRow());
		
		List<HashMap<String, Object>> bookingList = membersService.bookingList(parameter);
		
		model.addAttribute("bookingList", bookingList);
		model.addAttribute("pagination", pagination);
		
		int cntCoupon = membersService.cntCoupon(mid);
		model.addAttribute("cntCoupon",cntCoupon);
		
		HashMap<String, Object> map = membersService.myinfo(mid);
		
		model.addAttribute("map",map);
		
		return ".members_p.bookingList";
		
	}
	
	// 회원 결제내역 조회
	@RequestMapping(value="/members/paymentList",method=RequestMethod.GET)
	public String paymentList(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model, HttpSession session){
		
		HashMap<String, Object> parameter = new HashMap<String, Object>();
		
		String mid = (String) session.getAttribute("id");
		
		int totalRowCount = membersService.paymentCount(mid);
		
		PageUtil pagination = new PageUtil(pageNum, totalRowCount, 5, 5);
		
		parameter.put("mid", mid);
		parameter.put("startRow", pagination.getStartRow());
		parameter.put("endRow", pagination.getEndRow());
		
		List<HashMap<String, Object>> paymentList = membersService.paymentList(parameter);
		
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("pagination", pagination);
		
		int cntCoupon = membersService.cntCoupon(mid);
		model.addAttribute("cntCoupon",cntCoupon);
		
		HashMap<String, Object> map = membersService.myinfo(mid);
		
		model.addAttribute("map",map);
		
		DecimalFormat dc = new DecimalFormat("###,###,###,###");
		
		model.addAttribute("dc", dc);
		
		Date day1 = null;
		Date day2 = null;
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy/mm/dd");
		
		try{
			for(HashMap<String, Object> h : paymentList){
				
				day1 = format.parse((String) h.get("SDATE"));
				day2 = format.parse((String) h.get("END_DATE"));
				
				int compare = day1.compareTo(day2);
				
				h.put("compare", compare);
				
			}
			for(HashMap<String, Object> h : paymentList){
				System.out.println(h.get("compare"));
			}
			
		}catch(ParseException pe){
			pe.printStackTrace();
		}
		
		return ".members_p.paymentList";
	}
	
	// 회원 리뷰작성 페이지 이동
	@RequestMapping(value="/members/reviewWrite",method=RequestMethod.GET)
	public String reviewForm(String house_save_name,int room_num,String roomname,String company,Model model,HttpSession session){
		
		String mid = (String) session.getAttribute("id");
		
		int cntCoupon = membersService.cntCoupon(mid);
		model.addAttribute("cntCoupon",cntCoupon);
		
		HashMap<String, Object> map = membersService.myinfo(mid);
		
		model.addAttribute("map",map);
		
		model.addAttribute("house_save_name", house_save_name);
		model.addAttribute("room_num", room_num);
		model.addAttribute("roomname", roomname);
		model.addAttribute("company", company);
		
		return ".members_p.reviewWrite";
		
	}
	
	// 회원 리뷰 등록하기
	@RequestMapping(value="/members/reviewWrite",method=RequestMethod.POST)
	public String reviewInsert(@RequestParam(value="file1",required=false) List<MultipartFile> multipartFile,HttpSession session,String review_title,
			String review_content,@RequestParam(value="kindness",defaultValue="1") int kindness,@RequestParam(value="clean",defaultValue="1")int clean,
			@RequestParam(value="convenience",defaultValue="1")int convenience,int room_num){
		
		String mid = (String) session.getAttribute("id");
		
		ReviewVo review = new ReviewVo(0, room_num, mid, review_title, review_content, null, kindness, clean, convenience);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(multipartFile != null){
				
			String path = session.getServletContext().getRealPath("/resources/upload");
			
			System.out.println("path:"+path);
			
			InputStream is = null;
			FileOutputStream fos = null;
			
			List<ReiewImgVo> img = new ArrayList<ReiewImgVo>();
			
			for(int i = 0; i< multipartFile.size(); i++){
				
				String review_org_name = multipartFile.get(i).getOriginalFilename();
				
				String review_save_name = System.currentTimeMillis() + "_" + review_org_name;
				
				
				try{
					
					is = multipartFile.get(i).getInputStream();
					
					fos = new FileOutputStream(path + "\\" + review_save_name);
					
					FileCopyUtils.copy(is, fos);
					
					ReiewImgVo vo = new ReiewImgVo();
					vo.setReview_org_name(review_org_name);
					vo.setReview_save_name(review_save_name);
					img.add(vo);
					
				}catch(IOException ie){
					ie.printStackTrace();
					return "error";
				}finally{
					try {
						fos.close();
						is.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
					
				}
				
			}
			map.put("img", img);
		}
		membersService.reviewInsert(review, map);
		
		return "redirect:/";
		
	}
	
	// 회원 후기 목록
	@RequestMapping(value="/members/reviewList",method=RequestMethod.GET)
	public String reviewList(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model,HttpSession session){
		
		HashMap<String, Object> parameter = new HashMap<String, Object>();
		
		String mid = (String) session.getAttribute("id");
		
		int totalRowCount = membersService.reviewCount(mid);
		
		PageUtil pagination = new PageUtil(pageNum, totalRowCount, 10, 5);
		
		parameter.put("mid", mid);
		parameter.put("startRow", pagination.getStartRow());
		parameter.put("endRow", pagination.getEndRow());
		
		List<HashMap<String, Object>> reviewList = membersService.reviewList(parameter);
		
		HashMap<String, Object> map = membersService.myinfo(mid);
		
		model.addAttribute("map",map);
		
		
		model.addAttribute("reviewList", reviewList);
		
		model.addAttribute("pagination", pagination);
		
		return ".members_p.reviewList";
		
	}
}
