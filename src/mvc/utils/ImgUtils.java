package mvc.utils;
//업로드한 파일중 이미지 파일만 거스리는 클래스

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class ImgUtils {
	public static boolean ImgFileBoolean(String reName) {
		String filename = reName;
		String ext = filename.substring(filename.lastIndexOf(".") + 1, filename.length());
		System.out.println("확장자명 : " + ext);
		final String[] file_Boolean = { "png", "jpg", "gif", "jpeg" };

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

	// 이미지 저장.
	public String imgSave(HttpServletRequest request, MultipartFile file) {
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		String forDate = date.format(System.currentTimeMillis());
		String path = "resources\\upload\\" + forDate; // 파일 저장 위치.
		// 파일명 랜덤값 생성
		UUID uid = UUID.randomUUID();

		// 이미지가 업로드될 경로
		savePath = request.getServletContext().getRealPath(path);
		System.out.println(savePath);

		// 파일사이즈 구하는것은 멀티파트에서 파일사이즈 구하는 함수가 있다. 구선생참조 ~

		
		// 파일업로드
		System.out.println("파일저장시작");

		if (!file.isEmpty()) {
			// 파일이름 받고 확장자 저장
			String oriFileName = file.getOriginalFilename();
			String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
			// 이름 변경
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
			// 파일이름 변경
			reName = sdf.format(System.currentTimeMillis()) + "_" + uid + ext;
			// 저장
			System.out.println(reName);

			// vo.setUser_img(reName); // 이미지 파일 이름 저장

			if (ImgUtils.ImgFileBoolean(reName)) {
				try {
					file.transferTo(new File(savePath + "/" + reName)); // 스프링의 transferTo를 호출해서 이미지를 저장장소에 복사
					System.out.println("파일저장 완료");
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				System.out.println("해당 파일은 이미지가아닙니다.");
			}
		} else {
			reName = "defaultimg.jpg";
		}

		return forDate + "/" + reName;

	}

	public void deleteimg() {
		File file = new File(savePath);
		if (file.exists()) {
			file.delete();
		}

	}
}