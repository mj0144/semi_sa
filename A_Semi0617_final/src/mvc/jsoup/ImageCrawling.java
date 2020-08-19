package mvc.jsoup;
import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Repository;

@Repository
public class ImageCrawling {
	
	   public void imgage(HashMap<String, Object> mylist ,HttpServletRequest request) throws Exception{
		
		String msg = (String) mylist.get("LOOKLIKE");
		
		System.out.println("11111111111msg:"+msg);
        
		String wtUrl = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query="+msg;

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
                
                String root_path = request.getSession().getServletContext().getRealPath("/");
        		String attach_path = "/resources/upload/";
        		String result = root_path + attach_path;
        		
                FileOutputStream out = new FileOutputStream(result+"\\IMAG01_" + (i + 1) + ".jpg");
                ImageIO.write(img, "jpg", out);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}

