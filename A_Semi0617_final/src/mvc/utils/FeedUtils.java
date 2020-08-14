package mvc.utils;
//���ε��� ������ �̹��� ���ϸ� �Ž����� Ŭ����

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.springframework.web.multipart.MultipartFile;

public class FeedUtils {
	//Ȯ���ڸ� �˻�
	public static boolean ImgFileBoolean(String reName) {
		String filename = reName;
		String ext = filename.substring(filename.lastIndexOf(".")+1, filename.length());
		System.out.println("Ȯ���ڸ� : "+ext);
		final String[] file_Boolean = {"png","jpg","gif","jpeg","PNG"};
		
		int len = file_Boolean.length;
		for(int i=0; i<len; i++) {
			if(ext.equals(file_Boolean[i])) {
				return true;
			}else {

			}
		}
		return false;
	}
	//���ÿ� ����
	public static void savelocal(String savePath, String reName, MultipartFile file) {
		
		String imagePath = savePath + "\\" + reName;
		System.out.println("���� �̹��� ���� ���  : " + imagePath);
		BufferedImage image = null;
		String[] types = { "png", "jpg", "gif", "jpeg", "PNG" };
		System.out.println("local reName : " + reName);

		try {
			// �ش��ο� �̹����� ������.
			image = ImageIO.read(new File(savePath + "/" + reName));// �̹����� �о�ͼ� BufferedImage�� �ִ´�.
			System.out.println("�̹��� image : " + image);

			for (String type : types) {
				ImageIO.write(image, type, new File("C:\\ikosmo64\\img\\"+ reName));
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
	//���� �˻��� ���������
	public static void makeDir(String fileName) {
		// ��ο� ���������� ��� ����
		File dir = new File(fileName);
		System.out.println(!dir.exists());
		if (!dir.exists()) {
			dir.mkdirs();
		}
	}

}