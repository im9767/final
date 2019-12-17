package test.app.project.dao.L;

import java.util.HashMap;
import java.util.List;

import test.app.project.vo.HouseVo;
import test.app.project.vo.MembersVo;

public interface PaymentDao {
	int monthsale(HashMap<String, Object> map);
	int periodsale(HashMap<String, Object> map);
	int companycount(HashMap<String, Object> map);
	//차트를 위한 메소드
	List<HashMap<String, Object>> piechart();
	//연도,월별 통계를 위한 메소드
	List<HashMap<String, Object>> statics(HashMap<String, Object> map);
	//사업자 월매출 확인 메소드
	int businessMonthsale(HashMap<String, Object> map);
	//사업자 기간별 매출 메소드
	int businessPeriodsale(HashMap<String, Object> map);
	//사업자 업종 갯수 구하기 메소드
	int businesscount(HashMap<String, Object> map);
	//사업자 년,월 매출액 구하기 메소드
	List<HashMap<String, Object>> businessStatics(HashMap<String, Object> map);
}








