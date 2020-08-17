package mvc.vo;

public class ChatVO {
	private int chatRoomNum;
	private int chatNum;
	private int chatuser;
	private String ChatContent;
	private String ChatDate;
	private int chatRoom;
	
	public int getChatRoomNum() {
		return chatRoomNum;
	}
	public void setChatRoomNum(int chatRoomNum) {
		this.chatRoomNum = chatRoomNum;
	}
	public int getChatNum() {
		return chatNum;
	}
	public void setChatNum(int chatNum) {
		this.chatNum = chatNum;
	}
	public int getChatuser() {
		return chatuser;
	}
	public void setChatuser(int chatuser) {
		this.chatuser = chatuser;
	}
	public String getChatContent() {
		return ChatContent;
	}
	public void setChatContent(String chatContent) {
		ChatContent = chatContent;
	}
	public String getChatDate() {
		return ChatDate;
	}
	public void setChatDate(String chatDate) {
		ChatDate = chatDate;
	}
	public int getChatRoom() {
		return chatRoom;
	}
	public void setChatRoom(int chatRoom) {
		this.chatRoom = chatRoom;
	}
}
