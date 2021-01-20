package com.mycompany.webapp.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

//root에서 쓸거면 루트에서 사용이 가능한 anntotaion을 붙여야 한다.
@Service //conponent scan의 대상이 댐
public class Ch13Service2 {
	private static final Logger logger = LoggerFactory.getLogger(Ch13Service2.class);
	
	public void method() {
		logger.info("실행");
	}
}
