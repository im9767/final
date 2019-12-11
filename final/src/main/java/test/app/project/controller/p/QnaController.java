package test.app.project.controller.p;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import test.app.project.service.p.MembersService;
import test.app.project.util.PageUtil;
import test.app.project.vo.QnaboardVo;

@Controller
public class QnaController {
	@Autowired
	private MembersService membersService;

	// Q&A 문의 작성 페이지로 이동
	@RequestMapping(value = "/members/qna", method = RequestMethod.GET)
	public String qnaForm(HttpSession session, Model model) {

		String mid = (String) session.getAttribute("id");
		HashMap<String, Object> map = membersService.myinfo(mid);
		int cntCoupon = membersService.cntCoupon(mid);
		model.addAttribute("map", map);
		model.addAttribute("cntCoupon", cntCoupon);

		return ".members_p.qna";

	}

	// Q&A 문의 작성글 등록하기
	@RequestMapping(value = "/members/qna", method = RequestMethod.POST)
	public String qna(String qna_title, String qna_content, int qna_category_num, HttpSession session, Model model) {

		String mid = (String) session.getAttribute("id");

		HashMap<String, Object> map = membersService.myinfo(mid);
		int cntCoupon = membersService.cntCoupon(mid);
		model.addAttribute("map", map);
		model.addAttribute("cntCoupon", cntCoupon);

		System.out.println("qna_title:" + qna_title);
		System.out.println("qna_content:" + qna_content);
		System.out.println("qna_category_num:" + qna_category_num);

		QnaboardVo vo = new QnaboardVo(0, mid, qna_category_num, qna_title, qna_content, null, null, null);

		int n = membersService.qnainsert(vo);

		if (n > 0) {
			return "redirect:/members/mypage";
		} else {
			return "redirect:/members/qna";
		}
	}

	// 회원 본인이 작성한 문의글 리스트 페이지 이동
	@RequestMapping(value="/members/qnalist",method=RequestMethod.GET)
	public String qnalist(@RequestParam(value="pageNum",defaultValue="1")int pageNum,Model model,HttpSession session){
		
		String mid = (String) session.getAttribute("id");
		
		HashMap<String, Object> map = membersService.myinfo(mid);
		
		int cntCoupon = membersService.cntCoupon(mid);
		
		int totalRowCount = membersService.qnaListCount(mid);
		
		PageUtil pagination = new PageUtil(pageNum, totalRowCount, 10, 5);
		
		HashMap<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("startRow", pagination.getStartRow());
		parameter.put("endRow", pagination.getEndRow());
		parameter.put("mid", mid);
		
		
		model.addAttribute("map", map);
		model.addAttribute("cntCoupon",cntCoupon);
		
		model.addAttribute("pagination",pagination);
		
		List<HashMap<String, Object>> qnalist = membersService.qnalist(parameter);
		System.out.println(qnalist.toString());
		model.addAttribute("qnalist", qnalist);
		
		return ".members_p.qnalist";
	}

	// 문의글 상세보기
	@RequestMapping(value = "/members/qnaDetail", method = RequestMethod.GET)
	public String qnaDetail(int qna_num, Model model, HttpSession session) {

		String mid = (String) session.getAttribute("id");

		HashMap<String, Object> map = membersService.myinfo(mid);
		int cntCoupon = membersService.cntCoupon(mid);
		model.addAttribute("map", map);
		model.addAttribute("cntCoupon", cntCoupon);

		HashMap<String, Object> qnaDetail = membersService.qnaDetail(qna_num);

		model.addAttribute("qnaDetail", qnaDetail);

		return ".members_p.qnaDetail";

	}
	
}
