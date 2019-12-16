package test.app.project.service.p;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.app.project.daoimpl.p.HouseDaoImpl;
import test.app.project.vo.HouseVo;
import test.app.project.vo.ReviewJoinVo;
import test.app.project.vo.RoomsImgVo;
import test.app.project.vo.RoomsJoinVo;
import test.app.project.vo.RoomsVo;

@Service
public class HouseService {

	@Autowired
	private HouseDaoImpl houseDaoImpl;

	// 업체 편의시설 가져오기
	public List<HashMap<String, Object>> houseAmen(int house_num) {
		return houseDaoImpl.houseAmen(house_num);
	}

	// 예약 가능한 객실 가져오기
	public List<RoomsVo> foundRoom(HashMap<String, Object> map) {
		return houseDaoImpl.foundRoom(map);
	}

	// 객실 이미지 가져오기
	public List<RoomsImgVo> room_images(HashMap<String, Object> map) {
		return houseDaoImpl.room_images(map);
	}

	// 리뷰 가져오기
	public List<ReviewJoinVo> reviewList(int house_num) {
		return houseDaoImpl.reviewList(house_num);
	}

	// 업체 정보 가져오기
	public HouseVo houseInfo(int house_num) {
		return houseDaoImpl.houseInfo(house_num);
	}
	
	public List<RoomsJoinVo> roomsJoin(HashMap<String, Object> map){
		return houseDaoImpl.roomsJoin(map);
	}
	
	// 리뷰 평균 점수
	public double reviewScore(int house_num){
		return houseDaoImpl.reviewScore(house_num);
	}
	
	// 리뷰 갯수
	public int reviewCount(int house_num){
		return houseDaoImpl.reviewCount(house_num);
	}
}
