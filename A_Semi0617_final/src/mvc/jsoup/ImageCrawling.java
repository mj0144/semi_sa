package mvc.jsoup;
import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ImageCrawling {
	
	@RequestMapping(value = "/image")
	
	   public void imgage(HttpSession session) throws Exception{
		
		String msg = "ÀÌ¿¤";
        
		String wtUrl = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=";

        try {
            Document webtoonPage = Jsoup.connect(wtUrl).get();

            //System.out.println(webtoonPage.select(".wt_viewer > img"));

            Elements imgUrl = webtoonPage.select("#people_info_z > div.cont_noline > div > div > a:nth-child(1) > img");

            for (int i = 0; i < imgUrl.size(); i++) {
                System.out.println(imgUrl.get(i).attr("src"));
                String src = imgUrl.get(i).attr("src");

                URL url = new URL(src);
                HttpURLConnection conn = (HttpURLConnection)url.openConnection();

                conn.setRequestProperty("Referer", src);
                BufferedImage img = ImageIO.read(conn.getInputStream());

                FileOutputStream out = new FileOutputStream("C:\\Users\\user\\Desktop\\img\\IMAG01_" + (i + 1) + ".jpg");
                ImageIO.write(img, "jpg", out);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}

