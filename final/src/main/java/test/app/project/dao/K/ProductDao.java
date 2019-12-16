package test.app.project.dao.K;

import java.util.HashMap;
import java.util.List;

import test.app.project.vo.RoomsVo;

public interface ProductDao {
	List<RoomsVo> roomsList(HashMap<String, Object> map);
}
