package vo;

import java.util.Date;

public class Review {

	private int no;
	private String content;
	private Date createDate;
	private Product product;	// productNo
	private Customer customer;	// custId
	
	public Review() {
	}
	public Review(int no, String content, Date createDate, Product product, Customer customer) {
		super();
		this.no = no;
		this.content = content;
		this.createDate = createDate;
		this.product = product;
		this.customer = customer;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
}
