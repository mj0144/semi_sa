package mvc.utils;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FeedImgUpload {

	// �̹������ε�
	public static String imgUpload(MultipartFile[] board_img, HttpServletRequest request) {

		String reName = null;
		String oriFileName = null;
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		String forDate = date.format(System.currentTimeMillis());
		String path = "resources\\upload\\" + forDate;
		System.out.println(path);
		// ���ϸ� ������ ����
		String uid = UUID.randomUUID().toString().replaceAll("-", "");
		uid = uid.substring(0, 10);
		// �̹����� ���ε�� ���
		String savePath = request.getServletContext().getRealPath(path);
		FeedUtils.makeDir(savePath);

		// ���Ͼ��ε�
		System.out.println("�����������");
		for (MultipartFile f : board_img) {
			if (!f.isEmpty()) {
				// �����̸� �ް� Ȯ���� ����
				oriFileName = f.getOriginalFilename();
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				// �̸� ����
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
				// �����̸� ����
				reName = sdf.format(new Date()) + "_" + uid + ext;
				// ����
				System.out.println(reName);
				if (FeedUtils.ImgFileBoolean(reName)) {
					try {
						f.transferTo(new File(savePath + File.separator + reName));
						System.out.println("�������� �Ϸ�");
						FeedUtils.savelocal(savePath, reName, f);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				} else {
					System.out.println("�ش� ������ �̹������ƴմϴ�.");
				}
			}
		}
		//return reName;
		return forDate + "/" + reName;
	}
}
