package mvc.utils;
//���ε��� ������ �̹��� ���ϸ� �Ž����� Ŭ����

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
		System.out.println("Ȯ���ڸ� : " + ext);
		final String[] file_Boolean = { "png", "jpg", "gif", "jpeg", "PNG", "JPG", "GIF" };

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

	// �̹��� ����.
	public String imgSave(HttpServletRequest request, MultipartFile file, String status, String img) {
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		forDate = date.format(System.currentTimeMillis());
		String path = "resources\\upload\\" + forDate; // ���� ���� ��ġ.
		// ���ϸ� ������ ����
		String uid = UUID.randomUUID().toString().replaceAll("-", "");
		uid = uid.substring(0, 10);

		// �̹����� ���ε�� ���
		savePath = request.getServletContext().getRealPath(path);
		FeedUtils.makeDir(savePath);

		System.out.println(savePath);

		// ���Ͼ��ε�
		System.out.println("�����������");
		System.out.println("�̰��̾�� �̾����"+file);
		if (!file.isEmpty()) {
			// �����̸� �ް� Ȯ���� ����
			String oriFileName = file.getOriginalFilename();
			System.out.println("file.getOriginalFilename(); : " + file.getOriginalFilename());
			String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
			// �̸� ����
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS");
			// �����̸� ����
			reName = sdf.format(new Date()) + "_" + uid + ext;
			// ����
			System.out.println("reName:  " + reName);

			// vo.setUser_img(reName); // �̹��� ���� �̸� ����

			if (ImgUtils.ImgFileBoolean(reName)) {
				try {
					file.transferTo(new File(savePath + File.separator + reName)); // �������� transferTo�� ȣ���ؼ� �̹����� ������ҿ�
					// ����
					System.out.println("�������� �Ϸ�");
					savelocal(savePath, reName, file);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			} else {
				System.out.println("�ش� ������ �̹������ƴմϴ�.");
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
		System.out.println("�̹��� ��� : " + imagePath);
		BufferedImage image = null;
		String[] types = { "png", "jpg", "gif", "jpeg", "PNG", "JPG", "GIF" };
		System.out.println("local reName : " + reName);

		try {
			// �ش��ο� �̹����� ������.
			image = ImageIO.read(new File(savePath + "/" + reName));// �̹����� �о�ͼ� BufferedImage�� �ִ´�.
			System.out.println("�̹��� image : " + image);
			File localfile = new File("C:\\ikosmo64\\imgs\\" + reName);
			if (!localfile.exists()) {
				try {
					localfile.mkdirs();
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
			for (String type : types) {
				ImageIO.write(image, type, localfile);
				System.out.println("���� ���� �Ϸ�");
			}
		} catch (IOException e) {
			System.out.println("file not found");
			// TODO: handle exception
		} catch (Exception e) {
			System.out.println("local save error");
			e.printStackTrace();
		}

	}

	public String root_path(HttpServletRequest request, String file_name) {
		String root_path = request.getSession().getServletContext().getRealPath("/");
		String attach_path = "/resources/upload/";
		String result = root_path + attach_path + file_name;
		return result;
	}
}