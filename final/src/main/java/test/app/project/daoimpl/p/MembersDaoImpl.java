package test.app.project.daoimpl.p;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.app.project.dao.p.MembersDao;
import test.app.project.vo.CouponVo;
import test.app.project.vo.MembersVo;
import test.app.project.vo.QnaboardVo;
import test.app.project.vo.ReviewVo;

@Repository
public class MembersDaoImpl implements MembersDao{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String NAMESPACE = "test.app.mybatis.mapper.p.MembersMapper";
	
	// 로그인시 회원인지 체크
	@Override
	public boolean isMember(MembersVo vo) {
		
		MembersVo isMember =  sqlSessionTemplate.selectOne(NAMESPACE+".isMember", vo);
		
		return (isMember == null) ? false : true;
		
		
	}
	
	// 회원가입
	@Override
	public int join(MembersVo vo) {
		
		return sqlSessionTemplate.insert(NAMESPACE+".join", vo);
	}
	
	//아이디 중복검사
	@Override
	public MembersVo idCheck(String mid) {
		
		return sqlSessionTemplate.selectOne(NAMESPACE+".idCheck",mid);
		
	}
	
	// 비밀번호 찾기 임시비밀번호 발송
	@Override
	public MembersVo findPwd(HashMap<String, String> map) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".findPwd", map);
	}
	
	// 임시비밀번호로 비밀번호 변경
	@Override
	public int changePwd(MembersVo vo) {
		
		return sqlSessionTemplate.update(NAMESPACE+".changePwd", vo);
	
	}
	
	// 마이페이지에 담고갈 회원정보
	@Override
	public HashMap<String, Object> myinfo(String mid) {
		
		return sqlSessionTemplate.selectOne(NAMESPACE+".myinfo", mid);
		
	}
	
	// 회원의 쿠폰 갯수 구하기
	@Override
	public int cntCoupon(String mid) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".cntCoupon",mid);
	}
	
	// 회원정보 수정
	@Override
	public int myinfoupdate(MembersVo vo) {
		return sqlSessionTemplate.update(NAMESPACE+".myinfoupdate", vo);
	}
	
	// 문의글 등록
	@Override
	public int qnainsert(QnaboardVo vo) {
		return sqlSessionTemplate.insert(NAMESPACE+".qnainsert", vo);
	}
	
	// 문의글 리스트
	@Override
	public java.util.List<HashMap<String, Object>> qnalist(HashMap<String, Object> parameter) {
		
		return sqlSessionTemplate.selectList(NAMESPACE+".qnalist", parameter);
		
	}
	
	// 문의글 상세보기
	@Override
	public HashMap<String, Object> qnaDetail(int qna_num) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".qnaDetail", qna_num);
	}
	
	// 회원의 쿠폰목록 조회
	@Override
	public List<CouponVo> couponList(String mid) {
		return sqlSessionTemplate.selectList(NAMESPACE+".couponList", mid);
	}
	
	// 회원이 문의한 글 갯수 조회
	@Override
	public int qnaListCount(String mid) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".qnaListCount", mid);
	}
	
	//qna리스트 엑셀 출력
	@Override
	public List<HashMap<String, Object>> qnaListAll() {
		return sqlSessionTemplate.selectList(NAMESPACE+".qnaListAll");
	}
	
	// 회원 예약내역 조회
	@Override
	public List<HashMap<String, Object>> bookingList(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList(NAMESPACE+".bookingList", map);
	}
	
	// 회원의 예약 내역 개수
	@Override
	public int bookingCount(String mid) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".bookingCount", mid);
	}
	
	// 회원의 결제내역 조회
	@Override
	public List<HashMap<String, Object>> paymentList(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList(NAMESPACE+".paymentList", map);
	}
	
	// 회원 결제내역 개수
	@Override
	public int paymentCount(String mid) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".paymentCount", mid);
	}
	
	
	// 리뷰 등록하기
	@Override
	public int reviewInsert(ReviewVo vo, HashMap<String, Object> map) {
		return sqlSessionTemplate.insert(NAMESPACE+".reviewInsert", vo);
	}

	// 리뷰 이미지 등록하기
	@Override
	public int reviewImgInsert(HashMap<String, Object> map) {
		return sqlSessionTemplate.insert(NAMESPACE+".reviewImgInsert", map);
	}
	
	// 회원 리뷰목록
	@Override
	public List<HashMap<String, Object>> reviewList(HashMap<String, Object> map){
		return sqlSessionTemplate.selectList(NAMESPACE+".reviewList", map);
	}
	
	// 회원 리뷰 개수
	public int reviewCount(String mid){
		return sqlSessionTemplate.selectOne(NAMESPACE+".reviewCount", mid);
	}
}
