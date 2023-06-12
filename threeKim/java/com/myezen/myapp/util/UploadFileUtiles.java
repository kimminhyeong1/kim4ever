package com.myezen.myapp.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtiles {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtiles.class);
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		
		// 파일 이름에 UUID를 추가하여 저장할 고유한 이름 생성
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		
		// 저장할 경로 계산
		String savedPath = calcPath(uploadPath);
		
		// 저장할 파일 객체 생성
		File target = new File(uploadPath + savedPath, savedName);
		
		// 파일 데이터를 타겟 파일로 복사
		FileCopyUtils.copy(fileData, target);
		
		// 파일 확장자 추출
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);
		
		String uploadedFileName = null;
		
		// 이미지 파일인 경우 썸네일 생성, 아니면 기본 아이콘 생성
		/*
		if (MediaUtils.getMediaType(formatName) != null) {
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} else {
		}
		*/
		uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
				
		// 업로드된 파일명 반환 (예: 2023/06/12/s-dssddssf-2323423.jpg)
		return uploadedFileName;
	}	

	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception {
		
		// 아이콘 파일의 경로와 이름 생성
		String iconName = uploadPath + path + File.separator + fileName;
		
		// 업로드된 아이콘 파일의 상대 경로 반환 (예: /2023/06/12/s-dssddssf-2323423.jpg)
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	private static String calcPath(String uploadPath) {	
		
		// 현재 시간을 기준으로 저장할 경로 계산
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
			
		// 저장할 경로에 디렉토리 생성
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		logger.info(datePath);
		
		// 날짜별 경로 반환 (예: /2023/06/12)
		return datePath;
	}
	
	private static void makeDir(String uploadPath, String... paths) {
			
		// 최종 경로가 이미 존재하는지 확인하고 존재하면 그대로 반환
		if (new File(uploadPath + paths[paths.length - 1]).exists())
			return;
		
		// 경로에 해당하는 디렉토리 생성
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);	
			
			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
	
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		
		// 업로드된 이미지 파일 읽어오기
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		
		// 이미지를 80%로 리사이즈
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.AUTOMATIC, (int) (sourceImg.getWidth() * 0.8), (int) (sourceImg.getHeight() * 0.8));
		
		// 썸네일 파일의 경로와 이름 생성
		String thumbnailName = uploadPath + path + File.separator + "s-" + fileName;
		
		File newFile = new File(thumbnailName);
		
		// 썸네일 이미지를 해당 경로에 저장
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		boolean flag = ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
		System.out.println("생성된 썸네일 flag: " + flag);
		
		// 업로드된 썸네일 파일의 상대 경로 반환 (예: /2023/06/12/s-dssddssf-2323423.jpg)
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}	
}
