package test.app.project.dao.L;

import java.util.HashMap;
import java.util.List;

import test.app.project.vo.CouponVo;
import test.app.project.vo.HouseImgVo;
import test.app.project.vo.HouseVo;
import test.app.project.vo.MembersVo;
import test.app.project.vo.RoomsVo;

public interface AdminMembersDao {
	//가입회원 조회
	List<HashMap<String, Object>> memberslist();
	//쿠폰등록메소드
	int couponInsert(CouponVo vo);
	//등급별 회원수 구하기
	int countMembers(HashMap<String, Object> map);
	//등급별 회원아이디 추출하기
	List<MembersVo> membersId(HashMap<String, Object> map);
	//선택한 업체의 모든 객실정보 얻어오는 메소드
	List<RoomsVo> roomsList(HashMap<String, Object> map);
	
	//사업자 아이디를 통해 해당 업체식별키 얻어오는 메소드
	HouseVo getBnum(HashMap<String, Object> map);
	//업체이미지 추가하는 메소드
	int houseImgInsert(HouseImgVo vo);
	//업체전체 갯수 구하는 메소드
	int allCnt();
}









