package test.app.project.dao.p;

import java.util.HashMap;
import java.util.List;

import test.app.project.vo.HouseImgVo;
import test.app.project.vo.HouseVo;
import test.app.project.vo.ReviewJoinVo;
import test.app.project.vo.RoomsImgVo;
import test.app.project.vo.RoomsJoinVo;
import test.app.project.vo.RoomsVo;

public interface HouseDao {
	
	// 업체 편의시설 가져오기
	public List<HashMap<String, Object>> houseAmen(int house_num);
	
	// 예약 가능한 객실 가져오기
	public List<RoomsVo> foundRoom(HashMap<String, Object> map);
	
	// 객실 이미지 가져오기
	public List<RoomsImgVo> room_images(HashMap<String, Object> map);
	
	// 리뷰 가져오기
	public List<ReviewJoinVo> reviewList(int house_num);
	
	// 업체 정보 가져오기
	public HouseVo houseInfo(int house_num);
	
	// 객실 정보, 객실 이미지 조인
	public List<RoomsJoinVo> roomsJoin(HashMap<String, Object> map);
	
	// 업체 리뷰 평균 점수 얻어오기
	public double reviewScore(int house_num);
	
	// 업체 리뷰 갯수 구하기
	public int reviewCount(int house_num);
	
	// 업체 이미지 가져오기
	public HouseImgVo houseImg(int house_num);
}
