package mvc.utils;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FeedImgUpload {

	// 이미지업로드
	public static String imgUpload(MultipartFile[] board_img, HttpServletRequest request) {

		String reName = null;
		String oriFileName = null;
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		String forDate = date.format(System.currentTimeMillis());
		String path = "resources\\upload\\" + forDate;
		System.out.println(path);
		// 파일명 랜덤값 생성
		String uid = UUID.randomUUID().toString().replaceAll("-", "");
		uid = uid.substring(0, 10);
		// 이미지가 업로드될 경로
		String savePath = request.getServletContext().getRealPath(path);
		FeedUtils.makeDir(savePath);

		// 파일업로드
		System.out.println("파일저장시작");
		for (MultipartFile f : board_img) {
			if (!f.isEmpty()) {
				// 파일이름 받고 확장자 저장
				oriFileName = f.getOriginalFilename();
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				// 이름 변경
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
				// 파일이름 변경
				reName = sdf.format(new Date()) + "_" + uid + ext;
				// 저장
				System.out.println(reName);
				if (FeedUtils.ImgFileBoolean(reName)) {
					try {
						f.transferTo(new File(savePath + File.separator + reName));
						System.out.println("파일저장 완료");
						FeedUtils.savelocal(savePath, reName, f);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				} else {
					System.out.println("해당 파일은 이미지가아닙니다.");
				}
			}
		}
		//return reName;
		return forDate + "/" + reName;
	}
}
