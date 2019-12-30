package test.app.project.service.p;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import test.app.project.daoimpl.p.MembersDaoImpl;
import test.app.project.vo.CouponVo;
import test.app.project.vo.MembersVo;
import test.app.project.vo.QnaboardVo;
import test.app.project.vo.ReiewImgVo;
import test.app.project.vo.ReviewVo;

@Service
public class MembersService {
	@Autowired
	private MembersDaoImpl membersDaoImpl;
	
	// 로그인
	public boolean isMember(MembersVo vo){
		return membersDaoImpl.isMember(vo);
	}
	
	//회원가입
	public int join(MembersVo vo){
		return membersDaoImpl.join(vo);
	}
	
	//아이디 중복검사
	public MembersVo idCheck(String mid){
		
		return membersDaoImpl.idCheck(mid);
		
	}
	
	// 임시비밀번호 발송
	public MembersVo findPwd(HashMap<String, String> map){
		
		return membersDaoImpl.findPwd(map);
		
	}
	
	// 임시비밀번호로 변경
	public int changePwd(MembersVo vo){
		return membersDaoImpl.changePwd(vo);
	}
	
	// 마이페이지에 담고갈 회원정보
	public HashMap<String, Object> myinfo(String mid){
		
		return membersDaoImpl.myinfo(mid);
		
	}
	
	// 회원의 쿠폰 갯수 구하기
	public int cntCoupon(String mid){
		return membersDaoImpl.cntCoupon(mid);
	}
	
	// 회원 정보 수정
	public int myinfoupdate(MembersVo vo){
		return membersDaoImpl.myinfoupdate(vo);
	}
	
	// 문의글 작성
	public int qnainsert(QnaboardVo vo){
		return membersDaoImpl.qnainsert(vo);
	}

	// 문의글 리스트
	public List<HashMap<String, Object>> qnalist(HashMap<String, Object> parameter){
		return membersDaoImpl.qnalist(parameter);
	}
	
	// 문의글 상세보기
	public HashMap<String, Object> qnaDetail(int qna_num){
		return membersDaoImpl.qnaDetail(qna_num);
	}
	
	// 회원 쿠폰목록 조회
	public List<CouponVo> couponList(String mid){
		return membersDaoImpl.couponList(mid);
	}
	
	// 회원 문의글 갯수 얻어오기
	public int qnaListCount(String mid){
		return membersDaoImpl.qnaListCount(mid);
	}
	// 회원 문의 내역 조회
	public List<HashMap<String, Object>> qnaListAll(){
		return membersDaoImpl.qnaListAll();
	}
	// 회원 예약내역 조회
	public List<HashMap<String, Object>> bookingList(HashMap<String, Object> map){
		return membersDaoImpl.bookingList(map);
	}
	
	// 회원 예약내역 갯수
	public int bookingCount(String mid){
		return membersDaoImpl.bookingCount(mid);
	}
	
	// 회원 결제내역 조회
	public List<HashMap<String, Object>> paymentList(HashMap<String, Object> map){
		return membersDaoImpl.paymentList(map);
	}
	
	// 회원 결제내역 개수
	public int paymentCount(String mid){
		return membersDaoImpl.paymentCount(mid);
	}
	
	// 리뷰 등록하기
	@Transactional
	public int reviewInsert(ReviewVo vo, HashMap<String,  Object> map){
		
		membersDaoImpl.reviewInsert(vo, map);
		
		System.out.println("review_num:"+vo.getReview_num());
		String org_name = ((List<ReiewImgVo>) map.get("img")).get(0).getReview_org_name();
		map.put("review_num", vo.getReview_num());
		if(map.size() > 1 && org_name != null && org_name != ""){
			int n = membersDaoImpl.reviewImgInsert(map);
			System.out.println("n:"+n);
		}
		return 1;
		
	}
	
	// 회원 리뷰 목록
	public List<HashMap<String, Object>> reviewList(HashMap<String, Object> map){
		return membersDaoImpl.reviewList(map);
	}
	// 회원 리뷰 개수
	public int reviewCount(String mid){
		return membersDaoImpl.reviewCount(mid);
	}
	
	public boolean naverLogin(MembersVo vo){
		return membersDaoImpl.naverLogin(vo);
	}
	
	public int naverLoginInsert(MembersVo vo){
		return membersDaoImpl.naverLoginInsert(vo);
	}
	
	//리뷰페이지 이동시 파라미터
	public HashMap<String, Object> reviewParameter(HashMap<String, Object> parameter){
		return membersDaoImpl.reviewParameter(parameter);
	}
	
}
