package test.app.project.service.L;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import test.app.project.daoimpl.L.AdminMembersimpl;
import test.app.project.vo.CouponVo;
import test.app.project.vo.HouseImgVo;
import test.app.project.vo.HouseVo;
import test.app.project.vo.MembersVo;
import test.app.project.vo.RoomsVo;

@Service
public class MembersService1 {
	@Autowired private AdminMembersimpl dao;
	public void setDao(AdminMembersimpl dao) {
		this.dao = dao;
	}
	public List<HashMap<String, Object>> memberslist(){
		return dao.memberslist();
	}
	public int couponInsert(CouponVo vo){
		return dao.couponInsert(vo);
	}
	public int countMembers(HashMap<String, Object> map){
		return dao.countMembers(map);
	}
	public List<MembersVo> membersId(HashMap<String, Object> map){
		return dao.membersId(map);
	}
	public List<RoomsVo> roomsList(HashMap<String, Object> map){
		return dao.roomsList(map);
	}
	//사업자아이디를 통해 해당업체 식별키 얻어오기
	public HouseVo getBnum(HashMap<String, Object> map){
		return dao.getBnum(map);
	}
	//업체이미지 등록하는 메소드
	public int houseImgInsert(HouseImgVo vo){
		return dao.houseImgInsert(vo);
	}
}




