package com.mycompany.webapp.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//패키지가 다르니까 import
import com.mycompany.webapp.service.Ch13Service1;
import com.mycompany.webapp.service.Ch13Service2;
import com.mycompany.webapp.service.Ch13Service3;
import com.mycompany.webapp.service.Ch13Service4;
import com.mycompany.webapp.service.Ch13Service5;
import com.mycompany.webapp.service.Ch13Service6;
import com.mycompany.webapp.service.Ch13Service7;

@Controller("ch13Controller")
@RequestMapping("/ch13")
public class Ch13Controller {
	private static final Logger logger = LoggerFactory.getLogger(Ch13Controller.class);
	
	//방법1
	@Resource
	private Ch13Service1 service1;
	// =new Ch13Service1(); 되긴하지만 잘못된 방법
	//자식 객체를 대입할수 있음
	
	@Resource
	private Ch13Service2 service2;
	//관리 객체로 되어있으면 주입이 된다
	
	//resource안붙었음 Setter주입 할것임
	private Ch13Service3 service3;
	private Ch13Service4 service4;
	
	@Resource
	private Ch13Service5 service5;
	@Resource
	private Ch13Service6 service6;
	
	@Resource
	private Ch13Service7 service7;
	
	
	
	//Constructor-------------------------------------------------------------------
	//방법2
	/*
	@Autowired
	public Ch13Controller(Ch13Service1 service1) {
		this.service1 = service1;
	}
	*/
	
	//2개다 주입하는 방법
	/*
	@Autowired
	public Ch13Controller(Ch13Service1 service1, Ch13Service2 service2) {
		this.service1 = service1;
	}
	//*/
	
	//method-------------------------------------------------------------------------	
	//방법3
	/*
	@Autowired
	public void setService1(Ch13Service1 service1) {
		logger.info("실행");
		this.service1 = service1;
		//배치가 되면
	}
	
	
	
	@Autowired
	public void setService2(Ch13Service2 service2) {
		logger.info("실행");
		this.service2 = service2;
	}
	
	
	//*/
	
	
	public void setService3(Ch13Service3 service3) {
		logger.info("실행");
		this.service3 = service3;
		//배치가 되면
	}
	
	public void setService4(Ch13Service4 service4) {
		logger.info("실행");
		this.service4 = service4;
		//배치가 되면
	}
	
	
	
	@GetMapping("/content")
	public String content() {
		logger.info("실행");
		return "ch13/content";
	}

	@GetMapping("/service1")
	public String service1() {
		logger.info("실행");
		service1.method();
		return "redirect:/ch13/content";
		//ch13/content -jsp 보여주기 메소드 실행의 결과
		//redirect는 저 주소로 이동하기
	}
	
	
	@GetMapping("/service2")
	public String service2() {
		logger.info("실행");
		service2.method();
		return "redirect:/ch13/content";
	}
	
	
	@GetMapping("/service3")
	public String service3() {
		logger.info("실행");
		service3.method();
		return "redirect:/ch13/content";
	}
	
	
	@GetMapping("/service4")
	public String service4() {
		logger.info("실행");
		service4.method();
		return "redirect:/ch13/content";
	}
	@GetMapping("/service5")
	public String service5() {
		logger.info("실행");
		service5.method();
		return "redirect:/ch13/content";
	}
	
	@GetMapping("/service6")
	public String service6() {
		logger.info("실행");
		service6.method();
		return "redirect:/ch13/content";
	}
	
	
	
	@GetMapping("/fileupload")
	public String fileupload(@Value("${fileupload}") String saveDirPath) {
		logger.info("실행");
		logger.info("fileupload: controller " + saveDirPath);
		service7.method();
		return "redirect:/ch13/content";
	}
	
}
