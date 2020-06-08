package mvc.vo;

//USER_NUM  NOT NULL NUMBER        
//USER_ID   NOT NULL VARCHAR2(50)  
//NICKNAME  NOT NULL VARCHAR2(100) 
//PWD       NOT NULL VARCHAR2(100) 
//NAME      NOT NULL VARCHAR2(50)  
//SEX       NOT NULL CHAR(10)      
//INFO_YEAR NOT NULL NUMBER        
//INFO_MON  NOT NULL NUMBER        
//INFO_DAY  NOT NULL NUMBER        
//INFO_HH            NUMBER        
//INFO_MM            NUMBER        
//USER_IMG           VARCHAR2(50)  
//ILJU               CHAR(6)   

public class MemberVO {
	
	private int user_num, info_year, info_mon, info_day, info_hh, info_mm, cnt;
	private String user_id, nickname, pwd, name, sex, user_img_char, ilju;
	
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public int getInfo_year() {
		return info_year;
	}
	public void setInfo_year(int info_year) {
		this.info_year = info_year;
	}
	public int getInfo_mon() {
		return info_mon;
	}
	public void setInfo_mon(int info_mon) {
		this.info_mon = info_mon;
	}
	public int getInfo_day() {
		return info_day;
	}
	public void setInfo_day(int info_day) {
		this.info_day = info_day;
	}
	public int getInfo_hh() {
		return info_hh;
	}
	public void setInfo_hh(int info_hh) {
		this.info_hh = info_hh;
	}
	public int getInfo_mm() {
		return info_mm;
	}
	public void setInfo_mm(int info_mm) {
		this.info_mm = info_mm;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getUser_img_char() {
		return user_img_char;
	}
	public void setUser_img_char(String user_img_char) {
		this.user_img_char = user_img_char;
	}
	public String getIlju() {
		return ilju;
	}
	public void setIlju(String ilju) {
		this.ilju = ilju;
	}

}
