package take.a.trip.adminBoard.vo;

public class AdminBoardVO {
	
	private String adboardnum;
	private String memnum;
	private String adboardtitle;
	private String adboardcoment;
	private String adboardimage;
	private String insertdate;
	private String updatedate;
	private String deleteyn;
	
	// 페이징 이동 필드
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
		
		
	// 조회수 필드
	private int adboardhits;
	
	//search 변수
	private String keyword;			// 검색어
	private String searchFilter;	// 검색조건
	
	// 생성자 
	public AdminBoardVO() {
		
	}

	public AdminBoardVO(String adboardnum, String memnum, String adboardtitle, String adboardcoment, String adboardimage, String insertdate,
			String updatedate, String deleteyn) {
		
		this.adboardnum = adboardnum;
		this.memnum = memnum;
		this.adboardtitle = adboardtitle;
		this.adboardcoment = adboardcoment;
		this.adboardimage = adboardimage;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.deleteyn = deleteyn;
	}
	
	public AdminBoardVO(String adboardnum, String memnum, String adboardtitle, String adboardcoment, String adboardimage, String insertdate,
			String updatedate, String deleteyn, String pageSize, String groupSize, String curPage,
			String totalCount) {
		
		this.adboardnum = adboardnum;
		this.memnum = memnum;
		this.adboardtitle = adboardtitle;
		this.adboardcoment = adboardcoment;
		this.adboardimage = adboardimage;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.deleteyn = deleteyn;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
	}
	
	public AdminBoardVO(String adboardnum, String memnum, String adboardtitle, String adboardcoment, String adboardimage, String insertdate,
			String updatedate, String deleteyn, String pageSize, String groupSize, String curPage,
			String totalCount, int adboardhits, String keyword, String searchFilter) {
		
		this.adboardnum = adboardnum;
		this.memnum = memnum;
		this.adboardtitle = adboardtitle;
		this.adboardcoment = adboardcoment;
		this.adboardimage = adboardimage;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.deleteyn = deleteyn;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
		this.adboardhits = adboardhits;
		this.keyword = keyword;
		this.searchFilter = searchFilter;		
	}


	public AdminBoardVO(String adboardnum, String memnum, String adboardtitle, String adboardcoment, String adboardimage, String insertdate,
			String updatedate, String deleteyn, String pageSize, String groupSize, String curPage,
			String totalCount, int adboardhits) {
		
		this.adboardnum = adboardnum;
		this.memnum = memnum;
		this.adboardtitle = adboardtitle;
		this.adboardcoment = adboardcoment;
		this.adboardimage = adboardimage;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.deleteyn = deleteyn;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
		this.adboardhits = adboardhits;
	}
	
	
	
	
	public String getAdboardnum() {
		return adboardnum;
	}

	public void setAdboardnum(String adboardnum) {
		this.adboardnum = adboardnum;
	}

	public String getMemnum() {
		return memnum;
	}

	public void setMemnum(String memnum) {
		this.memnum = memnum;
	}

	public String getAdboardtitle() {
		return adboardtitle;
	}

	public void setAdboardtitle(String adboardtitle) {
		this.adboardtitle = adboardtitle;
	}

	public String getAdboardcoment() {
		return adboardcoment;
	}

	public void setAdboardcoment(String adboardcoment) {
		this.adboardcoment = adboardcoment;
	}

	public String getAdboardimage() {
		return adboardimage;
	}

	public void setAdboardimage(String adboardimage) {
		this.adboardimage = adboardimage;
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
	
	// 페이지 getter / setter
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
	
	// 조회수 getter / setter
	public int getAdboardhits() {
		return adboardhits;
	}
	public void setAdboardhits(int adboardhits) {
		this.adboardhits = adboardhits;
	}
	
	// 검색
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearchFilter() {
		return searchFilter;
	}

	public void setSearchFilter(String searchFilter) {
		this.searchFilter = searchFilter;
	}

}
