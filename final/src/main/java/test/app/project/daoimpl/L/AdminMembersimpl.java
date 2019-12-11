package test.app.project.daoimpl.L;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.app.project.dao.L.AdminMembersDao;
import test.app.project.vo.CouponVo;
import test.app.project.vo.MembersVo;
import test.app.project.vo.RoomsVo;

@Repository
public class AdminMembersimpl implements AdminMembersDao{
	@Autowired private SqlSessionTemplate SqlSessionTemplate;
	private final String NAMESPACE="test.app.mybatis.mapperL.PayMapper";
	private final String NAMESPACE1="test.app.mybatis.mapperL.CouponMapper";
	private final String NAMESPACE2="test.app.mybatis.mapperL.RoomlistMapper";
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		SqlSessionTemplate = sqlSessionTemplate;
	}
	@Override
	public List<HashMap<String, Object>> memberslist() {
		return SqlSessionTemplate.selectList(NAMESPACE+".memberslist");
	}
	@Override
	public int couponInsert(CouponVo vo) {
		return SqlSessionTemplate.insert(NAMESPACE1+".couponinsert",vo);
	}
	@Override
	public int countMembers(HashMap<String, Object> map) {
		return SqlSessionTemplate.selectOne(NAMESPACE1+".countmembers",map);
	}
	@Override
	public List<MembersVo> membersId(HashMap<String, Object> map) {
		return SqlSessionTemplate.selectList(NAMESPACE1+".gradeId",map);
	}
	@Override
	public List<RoomsVo> roomsList(HashMap<String, Object> map) {
		return SqlSessionTemplate.selectList(NAMESPACE2+".adminrooms",map);
	}
	
}





