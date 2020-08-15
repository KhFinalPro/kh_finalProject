package com.kh.chickenPeople.common;

import java.io.File;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class SaveFile {

	public SaveFile() {
		
	}
	//상원이꺼
	public static String saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일이 저장될 경로를 설정하는 메소드
		
		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\coupon";
		
		File folder = new File(savePath);
		// java.io.File로 import 하자
		
		if(!folder.exists())
		{
			folder.mkdirs();
		}
		
		// 공지글은 굳이 파일명 중복 제거는 신경쓰지 않고 게시판에서 파일명 rename하는걸 해보자!
//		String filePath = folder + "\\" + file.getOriginalFilename();
		// 실제 저장 될 파일 경로 + 파일명
		
		// 공지사항 때와 다르게 파일을 저장할 때 작성자가 올린 파일명 그대로가 아닌
		// 업로드 시간을 기준으로 파일명을 변경하자.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))
				+"."+originFileName.substring(originFileName.lastIndexOf(".")+1);;
		
		String filePath = folder + "\\" + renameFileName;
		
			try {
				file.transferTo(new File(filePath));
				// 이 상태로는 파일 업로드가 되지 않는다. 왜냐면 파일 제한크기에 대한 설정이 없기 때문에
				// 그래서 파일 크기 지정을 root-context.xml에서 해주자
			} catch(Exception e) {
				System.out.println("파일 전송 에러 : " + e.getMessage());
			}	

		return renameFileName;
	}

	
	//다슬꺼
	public static String saveFile2(MultipartFile files, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\review";
	
		

		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdir();
		}

		// 업로드 시간을 기준으로 파일명을 변경하자
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = files.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

		String filePath = folder + "\\" + renameFileName;

		try {
			files.transferTo(new File(filePath));

		} catch (Exception e) {

			System.out.println("파일 전송 에러 : " + e.getMessage());
		}

		return renameFileName;
	}
	
	// 배동곤
	public static String saveFile3(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\propic";
	
		

		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdir();
		}

		// 업로드 시간을 기준으로 파일명을 변경하자
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
				+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

		String filePath = folder + "\\" + renameFileName;

		try {
			file.transferTo(new File(filePath));

		} catch (Exception e) {

			System.out.println("파일 전송 에러 : " + e.getMessage());
		}

		return renameFileName;
	}

	
}
