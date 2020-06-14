package mvc.vo;

import java.util.List;

public class IljuVO {
	private int gabjanum, ilju_sky_num,ilju_land_num;
	private String ilju, ilju_sky, ilju_sky_five, ilju_land, ilju_land_five,
	result_animal,result_keyword, result_basic,  result_man, result_woman, result_influ, result_img;
	private List<MemberVO> mem;
	public int getGabjanum() {
		return gabjanum;
	}
	public List<MemberVO> getMem() {
		return mem;
	}
	public void setMem(List<MemberVO> mem) {
		this.mem = mem;
	}
	public void setGabjanum(int gabjanum) {
		this.gabjanum = gabjanum;
	}
	public int getIlju_sky_num() {
		return ilju_sky_num;
	}
	public void setIlju_sky_num(int ilju_sky_num) {
		this.ilju_sky_num = ilju_sky_num;
	}
	public int getIlju_land_num() {
		return ilju_land_num;
	}
	public void setIlju_land_num(int ilju_land_num) {
		this.ilju_land_num = ilju_land_num;
	}
	public String getIlju() {
		return ilju;
	}
	public void setIlju(String ilju) {
		this.ilju = ilju;
	}
	public String getIlju_sky() {
		return ilju_sky;
	}
	public void setIlju_sky(String ilju_sky) {
		this.ilju_sky = ilju_sky;
	}
	public String getIlju_sky_five() {
		return ilju_sky_five;
	}
	public void setIlju_sky_five(String ilju_sky_five) {
		this.ilju_sky_five = ilju_sky_five;
	}
	public String getIlju_land() {
		return ilju_land;
	}
	public void setIlju_land(String ilju_land) {
		this.ilju_land = ilju_land;
	}
	public String getIlju_land_five() {
		return ilju_land_five;
	}
	public void setIlju_land_five(String ilju_land_five) {
		this.ilju_land_five = ilju_land_five;
	}
	public String getResult_animal() {
		return result_animal;
	}
	public void setResult_animal(String result_animal) {
		this.result_animal = result_animal;
	}
	public String getResult_keyword() {
		return result_keyword;
	}
	public void setResult_keyword(String result_keyword) {
		this.result_keyword = result_keyword;
	}
	public String getResult_basic() {
		return result_basic;
	}
	public void setResult_basic(String result_basic) {
		this.result_basic = result_basic;
	}
	public String getResult_man() {
		return result_man;
	}
	public void setResult_man(String result_man) {
		this.result_man = result_man;
	}
	public String getResult_woman() {
		return result_woman;
	}
	public void setResult_woman(String result_woman) {
		this.result_woman = result_woman;
	}
	public String getResult_influ() {
		return result_influ;
	}
	public void setResult_influ(String result_influ) {
		this.result_influ = result_influ;
	}
	public String getResult_img() {
		return result_img;
	}
	public void setResult_img(String result_img) {
		this.result_img = result_img;
	}
	
}
