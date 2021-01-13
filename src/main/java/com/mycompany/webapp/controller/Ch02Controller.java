package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/ch02")
public class Ch02Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(Ch02Controller.class);
	
	@RequestMapping("/content")
	public String Content(){
		logger.info("실행");
		return "ch02/content";
	}
	
	//@RequestMapping("/request1")//GET POST 둘다 지원 속성값이 하나만 있을땐 앞에 안붙여줘도 된다.
	//@RequestMapping(value = "/request1", method = RequestMethod.POST) //속성값을 여러개를 지원하는 경우에는 나눠서 써야한다
	//@RequestMapping(value = "/getMethod", method = RequestMethod.GET)
	@GetMapping("/getmethod")
	public String getMethod(){
		logger.info("GET실행");
		return "ch02/content";
	}
	
	@PostMapping("/postMethod")
	public String postMethod() {
		logger.info("POST실행");
		return "ch02/content";
	}
	
   @RequestMapping(value="/join", method=RequestMethod.GET)
   public String joinForm() {
      logger.info("회원가입 양식을 보냄");
      return "ch02/joinForm";
   }
   
   @RequestMapping(value="/joinAsync", method=RequestMethod.GET)
   public String joinFormAsync() {
      logger.info("회원가입 양식을 보냄");
      return "ch02/joinFormAsync";
   }
   
   @RequestMapping(value="/join", method=RequestMethod.POST)
   public String join() {
      logger.info("회원가입 처리함");
      return "ch02/content";
   }
}
