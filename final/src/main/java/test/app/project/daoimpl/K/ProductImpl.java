package test.app.project.daoimpl.K;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.app.project.dao.K.ProductDao;
import test.app.project.vo.RoomsVo;

@Repository
public class ProductImpl implements ProductDao {
	@Autowired private SqlSessionTemplate sqlSessionTemplate;
	private final String NAMESPACE="test.app.mybatis.mapper.k.productMapper";
	@Override
	public List<RoomsVo> roomsList(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList(NAMESPACE+".roomsList", map);
	}

}
