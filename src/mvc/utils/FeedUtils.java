package mvc.utils;
//���ε��� ������ �̹��� ���ϸ� �Ž����� Ŭ����

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
		// ���ϸ� ������ ����
		String uid = UUID.randomUUID().toString().replaceAll("-", "");
		uid = uid.substring(0,15);
		// �̹����� ���ε�� ���
		String savePath = request.getServletContext().getRealPath(path);
		System.out.println(savePath);
		
		makeDir(savePath);
		
		// ���Ͼ��ε�
		System.out.println("�����������");
		for (MultipartFile f : board_img) {
			if (!f.isEmpty()) {
				// �����̸� �ް� Ȯ���� ����
				oriFileName = f.getOriginalFilename();
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				// �̸� ����
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				// �����̸� ����
				reName = sdf.format(new Date()) + "_" + uid + ext;
				// ����
				System.out.println(reName);
				if (FeedUtils.ImgFileBoolean(reName)) {
					try {
						f.transferTo(new File(savePath + File.separator + reName));
						System.out.println("�������� �Ϸ�");
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}else {
					System.out.println("�ش� ������ �̹������ƴմϴ�.");
				}
			}
		}
		return oriFileName;
	}
	
	public static void makeDir(String fileName) {
		// ��ο� ���������� ��� ����
		File dir = new File(fileName);
		System.out.println(!dir.exists());
		if (!dir.exists()) {
			dir.mkdirs();
		}
	}
	
	public static boolean ImgFileBoolean(String reName) {
		String filename = reName;
		String ext = filename.substring(filename.lastIndexOf(".")+1, filename.length());
		System.out.println("Ȯ���ڸ� : "+ext);
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