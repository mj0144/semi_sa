package mvc.utils;
//업로드한 파일중 이미지 파일만 거스리는 클래스

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FeedUtils {
	
	public static String imgUpload(MultipartFile[] board_img, HttpServletRequest request) {
		String reName = null;
		String oriFileName = null;
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		String forDate = date.format(System.currentTimeMillis());
		String path = "feed/feedimg/"+forDate;
		System.out.println(path);
		// 파일명 랜덤값 생성
		String uid = UUID.randomUUID().toString().replaceAll("-", "");
		uid = uid.substring(0,15);
		// 이미지가 업로드될 경로
		String savePath = request.getServletContext().getRealPath(path);
		System.out.println(savePath);
		
		makeDir(savePath);
		
		// 파일업로드
		System.out.println("파일저장시작");
		for (MultipartFile f : board_img) {
			if (!f.isEmpty()) {
				// 파일이름 받고 확장자 저장
				oriFileName = f.getOriginalFilename();
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				// 이름 변경
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				// 파일이름 변경
				reName = sdf.format(new Date()) + "_" + uid + ext;
				// 저장
				System.out.println(reName);
				if (FeedUtils.ImgFileBoolean(reName)) {
					try {
						f.transferTo(new File(savePath + File.separator + reName));
						System.out.println("파일저장 완료");
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}else {
					System.out.println("해당 파일은 이미지가아닙니다.");
				}
			}
		}
		return oriFileName;
	}
	
	public static void makeDir(String fileName) {
		// 경로에 폴더가없을 경우 생성
		File dir = new File(fileName);
		System.out.println(!dir.exists());
		if (!dir.exists()) {
			dir.mkdirs();
		}
	}
	
	public static boolean ImgFileBoolean(String reName) {
		String filename = reName;
		String ext = filename.substring(filename.lastIndexOf(".")+1, filename.length());
		System.out.println("확장자명 : "+ext);
		final String[] file_Boolean = {"png","jpg","gif","jpeg"};
		
		int len = file_Boolean.length;
		for(int i=0; i<len; i++) {
			if(ext.equals(file_Boolean[i])) {
				return true;
			}else {

			}
		}
		return false;
	}
}