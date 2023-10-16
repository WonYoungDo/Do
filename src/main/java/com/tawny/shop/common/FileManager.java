package com.tawny.shop.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManager {
	
	public static final String FILE_UPLOAD_PATH = "/home/ec2-user/upload_goodsImage";
	
	private static Logger logger = LoggerFactory.getLogger(FileManager.class);
	
	// 파일 저장 -> 경로 리턴 
	public static String saveFile(MultipartFile file) {
		
		
		if(file == null) {
			logger.error("saveFile :: 파일없음");
			return null;
		}
		

		String directoryName = "/" + System.currentTimeMillis() + "/";
		
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(directoryPath);
		
		if(!directory.mkdir()) {
			logger.error("saveFile :: 디렉토리 생성 에러 - 경로 : " + directoryPath);
			return null;
		}
		
		String filePath = null;
		try {
			byte[] byytes = file.getBytes();
			
			filePath = directoryPath + file.getOriginalFilename();
			
			Path path = Paths.get(filePath);
			
			Files.write(path, byytes);
			
		} catch (IOException e) {
			e.printStackTrace();
			
			// 파일 저장 실패 
			logger.error("saveFile :: 파일 저장 실패 - 경로" + filePath);
			return null;
		}
				
		return "/images" + directoryName + file.getOriginalFilename();
	}
	
	public static boolean removeFile(String filePath) { 
		
		// 파일 정보가 없는경우 
		if(filePath == null) {
			return false;
		}
		
		
		String fullFilePath = FILE_UPLOAD_PATH + filePath.replace("/images", "");
		
		Path path = Paths.get(fullFilePath);
		
		// 파일이 존재하는지 
		if(Files.exists(path)) {
			
			try {
				Files.delete(path);
			} catch (IOException e) {
				
				e.printStackTrace();
				return false;	
			}
		}
		
		Path dirPath = path.getParent();
		
		if(Files.exists(dirPath)) {
			
			try {
				Files.delete(dirPath);
			} catch (IOException e) {
				
				e.printStackTrace();
				
				return false;
			}
		}
		return true;	
	}
	
	
}
