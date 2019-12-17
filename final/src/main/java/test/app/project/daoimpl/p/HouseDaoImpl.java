package test.app.project.daoimpl.p;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import test.app.project.dao.p.HouseDao;
import test.app.project.vo.HouseImgVo;
import test.app.project.vo.HouseVo;
import test.app.project.vo.ReviewJoinVo;
import test.app.project.vo.RoomsImgVo;
import test.app.project.vo.RoomsJoinVo;
import test.app.project.vo.RoomsVo;
@Repository
public class HouseDaoImpl implements HouseDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String NAMESPACE = "test.app.mybatis.mapper.p.HouseMapper";
	
	// 업체 편의시설 가져오기
	@Override
	public List<HashMap<String, Object>> houseAmen(int house_num) {
		return sqlSessionTemplate.selectList(NAMESPACE+".houseAmen", house_num);
	}

	// 예약 가능한 객실 가져오기
	@Override
	public List<RoomsVo> foundRoom(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList(NAMESPACE+".foundRoom", map);
	}
	
	// 객실 이미지 가져오기
	@Override
	public List<RoomsImgVo> room_images(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList(NAMESPACE+".room_images", map);
	}

	// 리뷰 가져오기
	@Override
	public List<ReviewJoinVo> reviewList(int house_num) {
		return sqlSessionTemplate.selectList(NAMESPACE+".houseReview", house_num);
	}

	// 업체 정보 가져오기
	@Override
	public HouseVo houseInfo(int house_num) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".houseInfo", house_num);
	}

	// 객실 정보와 객실 이미지 정보 얻어오기
	@Override
	public List<RoomsJoinVo> roomsJoin(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList(NAMESPACE+".roomsJoinSelect", map);
	}
	
	// 리뷰 점수구해오기
	@Override
	public double reviewScore(int house_num) {
		
		return (Double) ((sqlSessionTemplate.selectOne(NAMESPACE+".reviewScore", house_num) == null) ? 0.0 : sqlSessionTemplate.selectOne(NAMESPACE+".reviewScore", house_num)) ;
		
		
	}
	
	// 리뷰 갯수 구해오기
	@Override
	public int reviewCount(int house_num) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".reviewCount", house_num);
	}
	
	// 업체 이미지 구해오기
	@Override
	public HouseImgVo houseImg(int house_num) {
		return sqlSessionTemplate.selectOne(NAMESPACE+".houseImg", house_num);
	}
	
	// 날짜 null일때 날짜 구해오기
	@Override
	public HashMap<String, Object> getDate() {
		return sqlSessionTemplate.selectOne(NAMESPACE+".getDate");
	}




}
