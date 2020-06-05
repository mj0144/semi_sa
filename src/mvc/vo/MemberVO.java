package mvc.vo;

public class MemberVO {
	private int user_num;
	private String user_id;
	private String nickname;
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	private String pwd;
	private char sex;
	private int info_year;
	private int info_mon;
	private int info_day;
	private int info_hh;
	private int info_mm;
	private String user_img; // 수정해야돼. file로
	private char ilju;
	
	
	
	
	
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
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
	public char getSex() {
		return sex;
	}
	public void setSex(char sex) {
		this.sex = sex;
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
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	public char getIlju() {
		return ilju;
	}
	public void setIlju(char ilju) {
		this.ilju = ilju;
	}
	
	
}
