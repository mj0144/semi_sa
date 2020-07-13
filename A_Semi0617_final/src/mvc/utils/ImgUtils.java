package mvc.utils;
//업로드한 파일중 이미지 파일만 거스리는 클래스

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class ImgUtils {
	public static boolean ImgFileBoolean(String reName) {
		String filename = reName;
		String ext = filename.substring(filename.lastIndexOf(".") + 1, filename.length());
		System.out.println("확장자명 : " + ext);
		final String[] file_Boolean = { "png", "jpg", "gif", "jpeg", "PNG" };

		int len = file_Boolean.length;
		for (int i = 0; i < len; i++) {
			if (ext.equals(file_Boolean[i])) {
				return true;
			} else {

			}
		}
		return false;
	}

	public static String reName;
	public static String savePath;
	public static String forDate;

	// 이미지 저장.
	public String imgSave(HttpServletRequest request, MultipartFile file, String status, String img) {
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		forDate = date.format(System.currentTimeMillis());
		String path = "resources\\upload\\" + forDate; // 파일 저장 위치.
		// 파일명 랜덤값 생성
		String uid = UUID.randomUUID().toString().replaceAll("-", "");
		uid = uid.substring(0, 10);

		// 이미지가 업로드될 경로
		savePath = request.getServletContext().getRealPath(path);
		FeedUtils.makeDir(savePath);

		System.out.println(savePath);

		// 파일업로드
		System.out.println("파일저장시작");

		if (!file.isEmpty()) {
			// 파일이름 받고 확장자 저장
			String oriFileName = file.getOriginalFilename();
			System.out.println("file.getOriginalFilename(); : " + file.getOriginalFilename());
			String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
			// 이름 변경
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
			// 파일이름 변경
			reName = sdf.format(new Date()) + "_" + uid + ext;
			// 저장
			System.out.println("reName:  " + reName);

			// vo.setUser_img(reName); // 이미지 파일 이름 저장

			if (ImgUtils.ImgFileBoolean(reName)) {
				try {
					file.transferTo(new File(savePath + File.separator + reName)); // 스프링의 transferTo를 호출해서 이미지를 저장장소에
																					// 복사
					System.out.println("파일저장 완료");
					savelocal(savePath, reName, file);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				System.out.println("해당 파일은 이미지가아닙니다.");
			}
		} else {
			if (status.equals("change")) {

				return img;
			} else {

				reName = "default.png";
				return reName;
			}
		}

		return forDate + "/" + reName;

	}

	public void deleteimg() {
		File file = new File(savePath);
		if (file.exists()) {
			file.delete();
		}

	}

	public void savelocal(String savePath, String reName, MultipartFile file) {

		String imagePath = savePath + "\\" + reName;
		System.out.println("이미지 경로 : " + imagePath);
		BufferedImage image = null;
		String[] types = { "png", "jpg", "gif", "jpeg", "PNG" };
		System.out.println("local reName : " + reName);

		try {
			// 해당경로에 이미지를 저장함.
			image = ImageIO.read(new File(savePath + "/" + reName));// 이미지를 읽어와서 BufferedImage에 넣는다.
			System.out.println("이미지 image : " + image);

			for (String type : types) {
				ImageIO.write(image, type, new File("C:\\ikosmo64\\img\\" + reName));
				System.out.println("로컬 저장 완료");
			}
		} catch (IOException e) {
			System.out.println("file not found");
			// TODO: handle exception
		} catch (Exception e) {
			System.out.println("local save error");
			e.printStackTrace();
		}

// 출처: https://jp1020.tistory.com/entry/java-image-저장 [메모하는 습관]
	}

}