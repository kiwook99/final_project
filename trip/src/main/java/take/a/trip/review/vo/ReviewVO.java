package take.a.trip.review.vo;

public class ReviewVO {
	
	String reviewnum; // 시퀀스 
	String memnum; // 로그인한사람 이름 , 덧글 쓴 사람	 
	String tripnum; // 제목 
	String reviewcoment; // 덧글 내용
	String insertdate; // 덧글 입력한 일자 

	// 생성자 
	public ReviewVO() {
	
	}

	public ReviewVO(String reviewnum, String memnum, String tripnum, String reviewcoment, String insertdate) {
		
		this.reviewnum = reviewnum;
		this.memnum = memnum;
		this.tripnum = tripnum;
		this.reviewcoment = reviewcoment;
		this.insertdate = insertdate;
	}
		
	// getter / setter 
	public String getReviewnum() {
		return reviewnum;
	}
	public void setReviewnum(String reviewnum) {
		this.reviewnum = reviewnum;
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
	public String getReviewcoment() {
		return reviewcoment;
	}
	public void setReviewcoment(String reviewcoment) {
		this.reviewcoment = reviewcoment;
	}
	public String getInsertdate() {
		return insertdate;
	}
	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}
}
