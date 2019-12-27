package test.app.project.service.p;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import test.app.project.daoimpl.p.MainDaoImpl;
import test.app.project.vo.EventJoinVo;

@Service
public class MainService {
	
	@Autowired
	private MainDaoImpl mainDaoImpl;
	
	public List<EventJoinVo> event(){
		return mainDaoImpl.event();
	}
	
}
