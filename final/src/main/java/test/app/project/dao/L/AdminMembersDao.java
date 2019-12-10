package test.app.project.dao.L;

import java.util.HashMap;
import java.util.List;

import test.app.project.vo.CouponVo;
import test.app.project.vo.MembersVo;

public interface AdminMembersDao {
	List<MembersVo> memberslist();
	//쿠폰등록메소드
	int couponInsert(CouponVo vo);
	//등급별 회원수 구하기
	int countMembers(HashMap<String, Object> map);
	//등급별 회원아이디 추출하기
	List<MembersVo> membersId(HashMap<String, Object> map);
}
