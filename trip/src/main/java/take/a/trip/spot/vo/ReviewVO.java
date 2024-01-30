package take.a.trip.spot.vo;

public class ReviewVO {

	private String reviewnum;
	private String tripnum;
	private String memnum;
	private String reviewcoment;
	private String insertdate;
	private String updatedate;
	private String deleteyn;
	
	
	
	// 생성자
	public ReviewVO() {
		
	}
	
	public ReviewVO(String reviewnum, String tripnum, String memnum, String reviewcoment, String insertdate, String updatedate, String deleteyn) {
		
		this.reviewnum = reviewnum;
		this.tripnum = tripnum;
		this.memnum = memnum;
		this.reviewcoment = reviewcoment;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.deleteyn = deleteyn;	
	}

	
	// setter / getter
	public String getReviewnum() {
		return reviewnum;
	}

	public void setReviewnum(String reviewnum) {
		this.reviewnum = reviewnum;
	}

	public String getTripnum() {
		return tripnum;
	}

	public void setTripnum(String tripnum) {
		this.tripnum = tripnum;
	}

	public String getMemnum() {
		return memnum;
	}

	public void setMemnum(String memnum) {
		this.memnum = memnum;
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

	public String getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

	public String getDeleteyn() {
		return deleteyn;
	}

	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}
	
	
	
}
