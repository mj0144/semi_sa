package mvc.utils;
//���ε��� ������ �̹��� ���ϸ� �Ž����� Ŭ����

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
		System.out.println("Ȯ���ڸ� : " + ext);
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

	// �̹��� ����.
	public String imgSave(HttpServletRequest request, MultipartFile file) {
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		String forDate = date.format(System.currentTimeMillis());
		String path = "resources\\upload\\" + forDate; // ���� ���� ��ġ.
		// ���ϸ� ������ ����
		UUID uid = UUID.randomUUID();

		// �̹����� ���ε�� ���
		savePath = request.getServletContext().getRealPath(path);
		System.out.println(savePath);

		// ���ϻ����� ���ϴ°��� ��Ƽ��Ʈ���� ���ϻ����� ���ϴ� �Լ��� �ִ�. ���������� ~

		
		// ���Ͼ��ε�
		System.out.println("�����������");

		if (!file.isEmpty()) {
			// �����̸� �ް� Ȯ���� ����
			String oriFileName = file.getOriginalFilename();
			String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
			// �̸� ����
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
			// �����̸� ����
			reName = sdf.format(System.currentTimeMillis()) + "_" + uid + ext;
			// ����
			System.out.println(reName);

			// vo.setUser_img(reName); // �̹��� ���� �̸� ����

			if (ImgUtils.ImgFileBoolean(reName)) {
				try {
					file.transferTo(new File(savePath + "/" + reName)); // �������� transferTo�� ȣ���ؼ� �̹����� ������ҿ� ����
					System.out.println("�������� �Ϸ�");
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				System.out.println("�ش� ������ �̹������ƴմϴ�.");
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