package test.app.project.controller.p;

import org.springframework.stereotype.Controller;

@Controller
public class Scheduled {
	
	@org.springframework.scheduling.annotation.Scheduled(cron="0/3 * * * * *")
	public void test(){
		System.out.println("스케쥴러 테스트...");
	}
	
	@org.springframework.scheduling.annotation.Scheduled(cron="10 * * * * *")
	public void test2(){
		System.out.println("스케쥴러 테스트222...");
	}
	
}
