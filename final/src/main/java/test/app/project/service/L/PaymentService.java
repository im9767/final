package test.app.project.service.L;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.app.project.daoimpl.L.Paymentimpl;
import test.app.project.vo.MembersVo;

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
}


