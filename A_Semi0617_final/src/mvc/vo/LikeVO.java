package mvc.vo;

public class LikeVO {
	private int user_num, liked_user, cnt1, cnt2;
	
	private String like_ox;
	
 
	public int getCnt1() {
		return cnt1;
	}
	public void setCnt1(int cnt1) {
		this.cnt1 = cnt1;
	}
	public int getCnt2() {
		return cnt2;
	}
	public void setCnt2(int cnt2) {
		this.cnt2 = cnt2;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public int getLiked_user() {
		return liked_user;
	}
	public void setLiked_user(int liked_user) {
		this.liked_user = liked_user;
	}
	public String getLike_ox() {
		return like_ox;
	}
	public void setLike_ox(String like_ox) {
		this.like_ox = like_ox;
	}

	

}
