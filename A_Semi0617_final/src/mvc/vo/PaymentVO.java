package mvc.vo;

public class PaymentVO {
	private String imp_uid;
	private int product_num;
	private String paid_amount; //���� �� �ݾ�
	private int buyer_num; // ������ ��ȣ
	private int paid_count; // ���� ����
	private String merchant_uid; // �ŷ�id
	private String paid_date; //���ų�¥
	private String expiry_date; //���ᳯ¥
	private String user_id;
	private String product_name; //��ǰ�̸�
	

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getExpiry_date() {
		return expiry_date;
	}

	public void setExpiry_date(String expiry_date) {
		this.expiry_date = expiry_date;
	}

	public String getPaid_date() {
		return paid_date;
	}

	public void setPaid_date(String paid_date) {
		this.paid_date = paid_date;
	}

	public String getMerchant_uid() {
		return merchant_uid;
	}

	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}

	public String getImp_uid() {
		return imp_uid;
	}

	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public String getPaid_amount() {
		return paid_amount;
	}

	public void setPaid_amount(String paid_amount) {
		this.paid_amount = paid_amount;
	}

	public int getBuyer_num() {
		return buyer_num;
	}

	public void setBuyer_num(int buyer_num) {
		this.buyer_num = buyer_num;
	}

	public int getPaid_count() {
		return paid_count;
	}

	public void setPaid_count(int paid_count) {
		this.paid_count = paid_count;
	}
}
