package test.app.project.daoimpl.L;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.app.project.dao.L.PaymentDao;
import test.app.project.vo.HouseVo;

@Repository
public class Paymentimpl implements PaymentDao{
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="test.app.mybatis.mapperL.PayMapper";
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	@Override
	public int monthsale(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectOne(NAMESPACE + ".monthsale",map);
	}
	@Override
	public int periodsale(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".periodsale",map);
	}
	@Override
	public int companycount(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".companycount",map);
	}
	@Override
	public List<HashMap<String, Object>> piechart() {
		return sqlSessionTemplate.selectList(NAMESPACE+".chartcount");
	}
	@Override
	public List<HashMap<String, Object>> statics(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList(NAMESPACE+".statics",map);
	}
}
