package com.mycompany.webapp.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.dto.Ch09User;


@Controller
@RequestMapping("/ch09")
public class Ch09Controller {
	private static final Logger logger = LoggerFactory.getLogger(Ch09Controller.class);
	
	@GetMapping("/content")
	public String content() {
		logger.info("실행");
		return "ch09/content";
	}

	/*
	 * @PostMapping("/fileupload") public String fileupload(String title, String
	 * desc, MultipartFile attach) { return "redirect:/ch09/content"; }
	 */
	@PostMapping("/photoupload")
	public String photoUpload(Ch09User user) {
		//문자 파트 정보 얻기
		/*
		 * String title =photo.getTitle(); String desc = photo.getDesc(); logger.info(
		 * "title : "+ title); logger.info("desc :" + desc);
		 */
		String uid =user.getUid();
		String uname = user.getUname();
		String upassword = user.getUpassword();
		
		logger.info( "title : "+ uid);
		logger.info( "title : "+ uname);
		logger.info( "title : "+ upassword);
		
		//파일 파트 정보 얻기
		MultipartFile uphoto =user.getUphoto();
		
		if(!uphoto.isEmpty()) {
			String originalFileName = uphoto.getOriginalFilename();
			String contentType = uphoto.getContentType();
			long size = uphoto.getSize();
			
			logger.info("originalFileName: " +originalFileName);
			logger.info("contentType: "+ contentType);
			logger.info("size : "+ size);
			
			//파일경로
			String saveDirPath ="D:/MyWorkspace/uploadfiles/";
			
			//파일이름
			String fileName = new Date().getTime()+"-"+ originalFileName;
			String filePath = saveDirPath +fileName;
			File file = new File(filePath);
			try {
				uphoto.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/ch09/content";
	}
	
	@GetMapping("/photolist")
	public String photoList( Model model) {
		String saveDirPath = "D:/MyWorkspace/uploadfiles/";
		File dir = new File(saveDirPath);
		String[] fileNames = dir.list();
		model.addAttribute("fileNames", fileNames);
		return "ch09/photolist";
			
	}
	
	@GetMapping("/photodownload")
	public void photodownload(String photo, HttpServletResponse response) { //똑같은 이름으로 설정해야지 값이 들어와서 쓸수 있다
		//그림을 읽고 보내주는 기능을 하게 해주는거임
		//값을 가져와라인데 응답이 없고 그냥 끝남
		//브라우저는 응답이 올때까지 기다림 
		
		//response.setContentType("text/html; charset= UTF-8");
		//내가 지금 보내는게 뭐다 라고 말해주는거
		/*
		try {
			PrintWriter pw = response.getWriter();
			pw.println("<html>");
			pw.println("	<body>");
			pw.println("		photodownload의 응답");
			pw.println("	<body>");
			pw.println("<html>");
			pw.flush();
			pw.close();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		*/
		
		String saveDirPath = "D:/MyWorkspace/uploadfiles/";
		String filePath = saveDirPath + photo;
		
		//응답 본문 데이터의 종류를 응답 헤더에 추가
		response.setContentType("image/jpg"); //포토 업로드 content type집어넣어
		
		//응답 본문 데이터를 파일로 다운로드 할수 있도록 응답 헤더에 추가ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ
		try {
			//HTTP규약에 '따라ㅓㅅ 헤더에는 한글을 못넣음 
			//그래서 UTF-8을 다시"ISO-8859-1"인코딩해야함
			
			photo = new String(photo.getBytes("UTF-8"), "ISO-8859-1");
		} catch (Exception e1) {
			
			e1.printStackTrace();
		}
		response.setHeader("Content-Disposition", "attachment; filename=\""+photo+".jpg\"");
		
		
		try {
			OutputStream os = response.getOutputStream();
			InputStream is =new FileInputStream(filePath);
			
			/*
			  byte[] data = new byte[1024];
			  
			  while(true) { int readByteNum = is.read(data); if(readByteNum ==-1)break;
			  os.write(data,0,readByteNum);
			  
			  }
			 */
			
			FileCopyUtils.copy(is, os);
			os.flush();
			os.close();
			is.close();
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}
	
}
