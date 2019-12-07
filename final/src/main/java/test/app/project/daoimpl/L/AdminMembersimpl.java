package test.app.project.daoimpl.L;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.app.project.dao.L.AdminMembersDao;
import test.app.project.vo.MembersVo;

@Repository
public class AdminMembersimpl implements AdminMembersDao{
	@Autowired private SqlSessionTemplate SqlSessionTemplate;
	private final String NAMESPACE="test.app.mybatis.mapperL.PayMapper";
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		SqlSessionTemplate = sqlSessionTemplate;
	}
	@Override
	public List<MembersVo> memberslist() {
		return SqlSessionTemplate.selectList(NAMESPACE+".memberslist");
	}
}





