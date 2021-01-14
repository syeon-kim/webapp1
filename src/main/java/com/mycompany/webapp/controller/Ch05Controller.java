package com.mycompany.webapp.controller;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ch05")
public class Ch05Controller {
	private static final Logger logger = LoggerFactory.getLogger(Ch05Controller.class);
	
	@GetMapping("/content")
	public String content() {
		logger.info("실행");
		return "ch05/content";
	}
	
	@GetMapping("/method1")
	public String method1(@RequestHeader("User-Agent") String userAgent) {
		logger.info("실행");
		//logger.info(userAgent);
		
		if(userAgent.contains("Edg")) {
			logger.info("브라우저의 종류: Edge");
		}else if(userAgent.contains("Chrome")){
			logger.info("브라우저의 종류: Chrome");
		}else if(userAgent.contains("Trident/7.0")){
			logger.info("브라우저의 종류: IE11");
		}else if(userAgent.contains("Trident/7.0")){
			logger.info("브라우저의 종류: IE10 이하");
		}
		
		return "ch05/content"; //상세페이지 그대로 유지하게끔 하는것이지 아 ㄹㅇ 복습 해야하는데
		
	}
	
	
	@GetMapping("/method2")
	public String method2(HttpServletRequest request) {
		logger.info("실행");
		//logger.info(userAgent);
		
		String userAgent = request.getHeader("User-Agent");
		
		if(userAgent.contains("Edg")) {
			logger.info("브라우저의 종류: Edge");
		}else if(userAgent.contains("Chrome")){
			logger.info("브라우저의 종류: Chrome");
		}else if(userAgent.contains("Trident/7.0")){
			logger.info("브라우저의 종류: IE11");
		}else if(userAgent.contains("Trident/7.0")){
			logger.info("브라우저의 종류: IE10 이하");
		}
		
		return "ch05/content"; //상세페이지 그대로 유지하게끔 하는것이지 아 ㄹㅇ 복습 해야하는데
		
	}
	
	@RequestMapping("/method3")//쿠키를 만들어서 브라우저를 보내라
	public String method3(HttpServletRequest request, HttpServletResponse response) {//선언하는데 집중하긔!
		//쿠키 생성하기
		Cookie cookie1 = new Cookie("memberId","winter"); //쿠키 이름 쿠키값
		Cookie cookie2 = new Cookie("loginStatus","ok"); 
		
		//쿠키 => 브라우저에게 보내기
		//쿠키를 응답에 추가해서 클라이언트로 보내기
		response.addCookie(cookie1);
		response.addCookie(cookie2);
		
		//응다 본문을 생성하는 뷰 리턴
		//근대 왜 send 쿠키가 아니고 add쿠키일까?
		//헤더부분에 추가한다고 해서 에드임
		//제에스피는 마지막에 보냄
		
		return "ch05/content";
	}
	
	@RequestMapping("/method4")//쿠키를 만들어서 브라우저를 보내라
	public String method4(HttpServletRequest request, HttpServletResponse response) {//선언하는데 집중하긔!
		//브라우저가 요청 헤더에 보낸 쿠기 읽기
		Cookie[] cookieArr = request.getCookies();
		//쿠키 배열을 리턴함 그래서 쿠키가 아니고 쿠키즈를 리턴함
		for(Cookie cookie: cookieArr) {
			String name = cookie.getName();
			String value = cookie.getValue();
			logger.info(name + ":" +value);
		}
		return "ch05/content";
	}
	
	//얜왜 두개밖에 못읽지
	@RequestMapping("/method5")//쿠키를 만들어서 브라우저를 보내라
	public String method5(
			@CookieValue String memberId,
			@CookieValue String loginStatus){
		//브라우저가 요청 헤더에 보낸 쿠기 읽기
		logger.info("memberId : " + memberId);
		logger.info("loginStatus : " + loginStatus);
	
		//응답 본문을 생성하는 뷰 리턴
		return "ch05/content";
	}
}
