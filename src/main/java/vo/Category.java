package vo;

public class Category {

	private int no;
	private String name;
	
	public Category() {
	}
	public Category(int no) {
		super();
		this.no = no;
	}
	public Category(int no, String name) {
		super();
		this.no = no;
		this.name = name;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}