package test.app.project.service.K;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.app.project.daoimpl.K.ProductImpl;
import test.app.project.vo.RoomsVo;
@Service
public class ProductService {
	@Autowired private ProductImpl dao;
	
	public List<RoomsVo> list(HashMap<String, Object> map){
		System.out.println("hhh:" + map);
		return dao.roomsList(map);
	}
}
