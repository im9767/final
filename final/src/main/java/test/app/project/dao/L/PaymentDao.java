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
}
