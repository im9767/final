package test.app.project.service.p;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.app.project.daoimpl.p.MembersDaoImpl;
import test.app.project.vo.MembersVo;
import test.app.project.vo.QnaboardVo;

@Service
public class MembersService {
	@Autowired
	private MembersDaoImpl membersDaoImpl;
	
	// 로그인
	public MembersVo isMember(MembersVo vo){
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
	public List<HashMap<String, Object>> qnalist(String mid){
		return membersDaoImpl.qnalist(mid);
	}
	
	// 문의글 상세보기
	public HashMap<String, Object> qnaDetail(int qna_num){
		return membersDaoImpl.qnaDetail(qna_num);
	}
}
