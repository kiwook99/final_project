package take.a.trip.review.vo;

public class ReviewVO {
	
	String breviewnum; // 시퀀스 
	String memnum; // 로그인한사람 이름 , 덧글 쓴 사람	 
	String tripnum; // 제목 
	String breviewcoment; // 덧글 내용
	String insertdate; // 덧글 입력한 일자 

	// 생성자 
	public ReviewVO() {
	
	}

	public ReviewVO(String breviewnum, String memnum, String tripnum, String reviewcoment, String insertdate) {
		
		this.breviewnum = breviewnum;
		this.memnum = memnum;
		this.tripnum = tripnum;
		this.breviewcoment = breviewcoment;
		this.insertdate = insertdate;
	}
		
	// getter / setter 
	public String getBreviewnum() {
		return breviewnum;
	}
	public void setBreviewnum(String breviewnum) {
		this.breviewnum = breviewnum;
	}
	public String getMemnum() {
		return memnum;
	}
	public void setMemnum(String memnum) {
		this.memnum = memnum;
	}
	public String getTripnum() {
		return tripnum;
	}
	public void setTripnum(String tripnum) {
		this.tripnum = tripnum;
	}
	public String getBreviewcoment() {
		return breviewcoment;
	}
	public void setBreviewcoment(String breviewcoment) {
		this.breviewcoment = breviewcoment;
	}
	public String getInsertdate() {
		return insertdate;
	}
	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}
}
