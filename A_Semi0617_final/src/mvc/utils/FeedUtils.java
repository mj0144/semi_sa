package mvc.utils;
//업로드한 파일중 이미지 파일만 거스리는 클래스

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.springframework.web.multipart.MultipartFile;

public class FeedUtils {
	//확장자명 검사
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
	//로컬에 저장
	public static void savelocal(String savePath, String reName, MultipartFile file) {
		
		String imagePath = savePath + "\\" + reName;
		System.out.println("로컬 이미지 저장 경로  : " + imagePath);
		BufferedImage image = null;
		String[] types = { "png", "jpg", "gif", "jpeg", "PNG" };
		System.out.println("local reName : " + reName);

		try {
			// 해당경로에 이미지를 저장함.
			image = ImageIO.read(new File(savePath + "/" + reName));// 이미지를 읽어와서 BufferedImage에 넣는다.
			System.out.println("이미지 image : " + image);

			for (String type : types) {
				ImageIO.write(image, type, new File("C:\\ikosmo64\\img\\"+ reName));
				System.out.println("로컬 저장 완료");
			}
		} catch (IOException e) {
			System.out.println("file not found");
			// TODO: handle exception
		} catch (Exception e) {
			System.out.println("local save error");
			e.printStackTrace();
		}
	}
	//폴더 검사후 없으면새성
	public static void makeDir(String fileName) {
		// 경로에 폴더가없을 경우 생성
		File dir = new File(fileName);
		System.out.println(!dir.exists());
		if (!dir.exists()) {
			dir.mkdirs();
		}
	}

}