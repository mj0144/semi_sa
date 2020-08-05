package mvc.vo;

//create table user_info(
//user_num number constraint user_info_user_num_pk PRIMARY KEY,
//user_id varchar2(50)  constraint user_info_user_id_nn not null,
//nickname varchar2(100) constraint user_info_nickname_nn not null,
//pwd varchar2(100) constraint user_info_pwd_nn not null,
//name varchar2(50) constraint user_info_name_nn not null,
//sex char(10) constraint user_info_sex_nn not null,
//email varchar2(50) constraint user_info_email_nn not null,
//user_img varchar2(300),
//birth char(12) constraint user_info_birth_nn not null,
//birth_hh number(2),
//birth_mm number(2),
//user_intro  varchar2(1000),
//saju_year number,
//saju_mon number,
//saju_day number,
//ilju char(6),--foreign key
//approval_status varchar2(50),
//approval_key varchar2(50),

public class MemberVO {
	
	private int user_num, birth_hh, birth_mm;
	private String user_id, nickname, pwd, name, user_img, user_intro, birth;
	private char sex;
	private int saju_year;
	private int saju_mon;
	private int saju_day;;
	private String ilju;
	private String email;
	private int info_year, info_mon, info_day;
	private IljuVO iljuvo;
	private String reason;
	private String user_mbti;
	private String user_height;
	private String user_loc;
	private String user_body;
	private IdealVO idealvo;
	

	public IdealVO getIdealvo() {
		return idealvo;
	}
	public void setIdealvo(IdealVO idealvo) {
		this.idealvo = idealvo;
	}
	public String getUser_height() {
		return user_height;
	}
	public void setUser_height(String user_height) {
		this.user_height = user_height;
	}
	public String getUser_loc() {
		return user_loc;
	}
	public void setUser_loc(String user_loc) {
		this.user_loc = user_loc;
	}
	public String getUser_body() {
		return user_body;
	}
	public void setUser_body(String user_body) {
		this.user_body = user_body;
	}
	public IljuVO getIljuvo() {
		return iljuvo;
	}
	public String getUser_mbti() {
		return user_mbti;
	}
	public void setUser_mbti(String user_mbti) {
		this.user_mbti = user_mbti;
	}
	public IljuVO getIljuVO() {
		return iljuvo;
	}
	public void setIljuvo(IljuVO iljuvo) {
		this.iljuvo = iljuvo;
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
	private String approval_status;
	private String approval_key;
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public int getBirth_hh() {
		return birth_hh;
	}
	public void setBirth_hh(int birth_hh) {
		this.birth_hh = birth_hh;
	}
	public int getBirth_mm() {
		return birth_mm;
	}
	public void setBirth_mm(int birth_mm) {
		this.birth_mm = birth_mm;
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
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	public String getUser_intro() {
		return user_intro;
	}
	public void setUser_intro(String user_intro) {
		this.user_intro = user_intro;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public char getSex() {
		return sex;
	}
	public void setSex(char sex) {
		this.sex = sex;
	}
	public int getSaju_year() {
		return saju_year;
	}
	public void setSaju_year(int saju_year) {
		this.saju_year = saju_year;
	}
	public int getSaju_mon() {
		return saju_mon;
	}
	public void setSaju_mon(int saju_mon) {
		this.saju_mon = saju_mon;
	}
	public int getSaju_day() {
		return saju_day;
	}
	public void setSaju_day(int saju_day) {
		this.saju_day = saju_day;
	}
	public String getIlju() {
		return ilju;
	}
	public void setIlju(String ilju) {
		this.ilju = ilju;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getApproval_status() {
		return approval_status;
	}
	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}
	public String getApproval_key() {
		return approval_key;
	}
	public void setApproval_key(String approval_key) {
		this.approval_key = approval_key;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}

	

}
