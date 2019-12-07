package test.app.project.service.L;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import test.app.project.daoimpl.L.AdminMembersimpl;
import test.app.project.vo.MembersVo;

@Service
public class MembersService1 {
	@Autowired private AdminMembersimpl dao;
	public void setDao(AdminMembersimpl dao) {
		this.dao = dao;
	}
	public List<MembersVo> memberslist(){
		return dao.memberslist();
	}
}
