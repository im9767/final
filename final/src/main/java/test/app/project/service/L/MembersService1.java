package test.app.project.service.L;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import test.app.project.daoimpl.L.AdminMembersimpl;
import test.app.project.vo.CouponVo;
import test.app.project.vo.MembersVo;
import test.app.project.vo.RoomsVo;

@Service
public class MembersService1 {
	@Autowired private AdminMembersimpl dao;
	public void setDao(AdminMembersimpl dao) {
		this.dao = dao;
	}
	public List<MembersVo> memberslist(){
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
}
