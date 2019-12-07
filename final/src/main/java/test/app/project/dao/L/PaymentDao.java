package test.app.project.dao.L;

import java.util.HashMap;
import java.util.List;

import test.app.project.vo.MembersVo;

public interface PaymentDao {
	int monthsale(HashMap<String, Object> map);
	int periodsale(HashMap<String, Object> map);
}
