package take.a.trip.spot.vo;

public class SpotVO {

	
	private String tripnum;			// 여행지 번호(시퀀스)
	private String tripname;		// 여행지 이름
	private String tripcatalogue;	// 여행지 카테고리
	private String tripcoment;		// 여행지 소개
	private String tripregion;		// 여행지 지역
	private String tripimage;		// 여행지 이미지
	private String insertdate;		// 등록일자(YYYY-MM-DD)
	private String updatedate;		// 수정일자(YYYY-MM-DD)
	private String deleteyn;		// 삭제여부(여행지삭제여부 / Y:유지중인 데이터 / N:삭제된데이터)
	
	// 페이지 이동
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	
	// 조회수
	private int spothit;
	
	
	// 생성자
	public SpotVO() {
		
	}
	
	// 기본
	public SpotVO(String tripnum, String tripname, String tripcatalogue, String tripcoment, String tripregion, String tripimage, String insertdate, String updatedate, String deleteyn) {
		
		this.tripnum = tripnum;
		this.tripname = tripname;
		this.tripcatalogue = tripcatalogue;
		this.tripcoment = tripcoment;
		this.tripregion = tripregion;
		this.tripimage = tripimage;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.deleteyn = deleteyn;
		
	}
	
	// 페이징
	public SpotVO(String tripnum, String tripname, String tripcatalogue, String tripcoment, String tripregion, String tripimage, String insertdate, String updatedate, String deleteyn, String pageSize, String groupSize, String curPage, String totalCount) {
		
		this.tripnum = tripnum;
		this.tripname = tripname;
		this.tripcatalogue = tripcatalogue;
		this.tripcoment = tripcoment;
		this.tripregion = tripregion;
		this.tripimage = tripimage;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.deleteyn = deleteyn;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;		
		
	}	
	
	// 조회수
	public SpotVO(String tripnum, String tripname, String tripcatalogue, String tripcoment, String tripregion, String tripimage, String insertdate, String updatedate, String deleteyn, String pageSize, String groupSize, String curPage, String totalCount, int spothit) {
		
		this.tripnum = tripnum;
		this.tripname = tripname;
		this.tripcatalogue = tripcatalogue;
		this.tripcoment = tripcoment;
		this.tripregion = tripregion;
		this.tripimage = tripimage;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.deleteyn = deleteyn;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;	
		this.spothit = spothit;
		
	}

	// setter / getter
	public String getTripnum() {
		return tripnum;
	}

	public void setTripnum(String tripnum) {
		this.tripnum = tripnum;
	}

	public String getTripname() {
		return tripname;
	}

	public void setTripname(String tripname) {
		this.tripname = tripname;
	}

	public String getTripcatalogue() {
		return tripcatalogue;
	}

	public void setTripcatalogue(String tripcatalogue) {
		this.tripcatalogue = tripcatalogue;
	}

	public String getTripcoment() {
		return tripcoment;
	}

	public void setTripcoment(String tripcoment) {
		this.tripcoment = tripcoment;
	}

	public String getTripregion() {
		return tripregion;
	}

	public void setTripregion(String tripregion) {
		this.tripregion = tripregion;
	}

	public String getTripimage() {
		return tripimage;
	}

	public void setTripimage(String tripimage) {
		this.tripimage = tripimage;
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

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public String getGroupSize() {
		return groupSize;
	}

	public void setGroupSize(String groupSize) {
		this.groupSize = groupSize;
	}

	public String getCurPage() {
		return curPage;
	}

	public void setCurPage(String curPage) {
		this.curPage = curPage;
	}

	public String getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}

	public int getSpothit() {
		return spothit;
	}

	public void setSpothit(int spothit) {
		this.spothit = spothit;
	}
		
	
	
	
	
}
