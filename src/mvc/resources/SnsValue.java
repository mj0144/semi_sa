package mvc.resources;

import org.apache.commons.lang3.StringUtils;

import com.github.scribejava.apis.GoogleApi20;
import com.github.scribejava.core.builder.api.DefaultApi20;

public class SnsValue implements SnsUrls{

	private String service;
	private String clientId;
	private String clientSecret;
	private String redirectUrl;
	private DefaultApi20 api20Instance;
	
	
	
	public String getService() {
		return service;
	}



	public void setService(String service) {
		this.service = service;
	}



	public String getClientId() {
		return clientId;
	}



	public void setClientId(String clientId) {
		this.clientId = clientId;
	}



	public String getClientSecret() {
		return clientSecret;
	}



	public void setClientSecret(String clientSecret) {
		this.clientSecret = clientSecret;
	}



	public String getRedirectUrl() {
		return redirectUrl;
	}



	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}



	public DefaultApi20 getApi20Instance() {
		return api20Instance;
	}



	public void setApi20Instance(DefaultApi20 api20Instance) {
		this.api20Instance = api20Instance;
	}



	public SnsValue(String service, String cid, String sc, String rurl) {
		this.service = service;
		this.clientId = cid;
		this.clientSecret = sc;
		this.redirectUrl = rurl;
		
		if (StringUtils.equalsIgnoreCase(service, "naver")) {
			this.api20Instance = NaverAPI20.getInstance();
		}else if (StringUtils.equalsIgnoreCase(service, "google")) {
			this.api20Instance = GoogleApi20.instance();
		}
	}
}
