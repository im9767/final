package test.app.project.service.L;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.app.project.daoimpl.L.Paymentimpl;

@Service
public class PaymentService {
	@Autowired
	private Paymentimpl dao;
	public void setDao(Paymentimpl dao) {
		this.dao = dao;
	}
	public int monthsale(HashMap<String, Object> map){
		return dao.monthsale(map);
	}
	public int periodsale(HashMap<String, Object> map){
		return dao.periodsale(map);
	}
	public int companycount(HashMap<String, Object> map){
		return dao.companycount(map);
	}
	public List<HashMap<String, Object>> piechart(){
		return dao.piechart();
	}
	public List<HashMap<String, Object>> statics(HashMap<String, Object> map){
		return dao.statics(map);
	}
	//사업자 월별 매출 구하기
	public int businessMonthsale(HashMap<String, Object> map){
		return dao.businessMonthsale(map);
	}
	//사업자 기간별 매출 구하기
	public int businessPeriodSale(HashMap<String, Object> map){
		return dao.businessPeriodsale(map);
	}
	//사업자 업종별 갯수 구하기
	public int businesscount(HashMap<String, Object> map){
		return dao.businesscount(map);
	}
	//사업자 년,월에 대한 매출액 구하기
	public List<HashMap<String, Object>> businessStatics(HashMap<String, Object> map){
		return dao.businessStatics(map);
	}
	//사업자모드 pie차트 업종별 갯수 구하기
	public List<HashMap<String, Object>> businesschart(HashMap<String, Object> map){
		return dao.businessPiechart(map);
	}
}










