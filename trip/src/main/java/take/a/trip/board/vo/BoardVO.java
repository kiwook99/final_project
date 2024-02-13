package take.a.trip.board.vo;

public class BoardVO {

	String boardnum;//게시판번호 fk 	시퀀스
	String memnum;//멤버테이블이랑 연동
	String boardtitle;//게시글제목
	String boardcoment;//게시글댓글
	String boardimage;//업데이트 이미지 데이터가 들어갈 부분
	String deleteyn;//삭제여부
	String insertdate;//입력일
	String updatedate;//수정일
//	String boardhits;//조회
	
	// search 변수
	private String keyword;			// 검색어
	private String searchFilter;	// 검색조건
	
	// 페이징 이동 필드
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	
	//생성자
	public BoardVO() {
	}

	//field
	//위 멤버변수와, 클래스명 함수()안의 매개변수의 이름이 같으므로 this로 구분해준다
	public BoardVO(String boardnum, String memnum, String boardtitle, String boardcoment, String boardimage,
			String deleteyn, String insertdate, String updatedate) {
		this.boardnum = boardnum;
		this.memnum = memnum;
		this.boardtitle = boardtitle;
		this.boardcoment = boardcoment;
		this.boardimage = boardimage;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}
	
	//검색어 검색조건 String keyword, String searchFilter
	public BoardVO(String boardnum, String memnum, String boardtitle, String boardcoment, String boardimage,
			String deleteyn, String insertdate, String updatedate, String keyword, String searchFilter) {
		
		this.boardnum = boardnum;
		this.memnum = memnum;
		this.boardtitle = boardtitle;
		this.boardcoment = boardcoment;
		this.boardimage = boardimage;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.keyword = keyword;
		this.searchFilter = searchFilter;
	}

	
	//페이징
	public BoardVO(String boardnum, String memnum, String boardtitle, String boardcoment, String boardimage,
			String deleteyn, String insertdate, String updatedate, String keyword, String searchFilter, String pageSize,
			String groupSize, String curPage, String totalCount) {
		
		this.boardnum = boardnum;
		this.memnum = memnum;
		this.boardtitle = boardtitle;
		this.boardcoment = boardcoment;
		this.boardimage = boardimage;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.keyword = keyword;
		this.searchFilter = searchFilter;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
	}

	//getter setter
	public String getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(String boardnum) {
		this.boardnum = boardnum;
	}
	public String getMemnum() {
		return memnum;
	}
	public void setMemnum(String memnum) {
		this.memnum = memnum;
	}
	public String getBoardtitle() {
		return boardtitle;
	}
	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}
	public String getBoardcoment() {
		return boardcoment;
	}
	public void setBoardcoment(String boardcoment) {
		this.boardcoment = boardcoment;
	}
	public String getBoardimage() {
		return boardimage;
	}
	public void setBoardimage(String boardimage) {
		this.boardimage = boardimage;
	}
	public String getDeleteyn() {
		return deleteyn;
	}
	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
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

	
	// search getter / setter
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

	// 페이징 getter / setter
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
}
