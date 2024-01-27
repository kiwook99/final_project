package take.a.trip.hotel.vo;

public class HotelVO {
	
	private String hotelnum;			// 여행지 번호(시퀀스)
	private String regionid;		// 여행지 이름
	private String hotelname;	// 여행지 카테고리
	private String hoteltel;		// 여행지 소개
	private String hotelimage;		// 여행지 지역
	private String hotelprice;		// 여행지 이미지
	private String hotelcoment;		// 여행지 이미지
	private String hoteladress;		// 여행지 이미지
	private String hotelmapx;		// 여행지 이미지
	private String hotelmapy;		// 여행지 이미지
	private String hotelcheckin;		// 여행지 이미지
	private String hotelcheckout;		// 여행지 이미지
	private String insertdate;		// 등록일자(YYYY-MM-DD)
	private String updatedate;		// 수정일자(YYYY-MM-DD)
	private String deleteyn;		// 삭제여부(여행지삭제여부 / Y:유지중인 데이터 / N:삭제된데이터)
	
	// 페이지 이동
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	
	// 조회수
	private int hotelhis;
	
	
	public HotelVO() {
		
	}
	
	// 기본 
	public HotelVO(String hotelnum, String regionid, String hotelname, String hoteltel, String hotelimage, String hotelprice, String hotelcoment, String hoteladress, String hotelmapx, String hotelmapy
					,String hotelcheckin, String hotelcheckout, String insertdate, String updatedate, String deleteyn) {
		
		this.hotelnum = hotelnum;
		this.regionid = regionid;
		this.hotelname = hotelname;
		this.hoteltel = hoteltel;
		this.hotelimage = hotelimage;
		this.hotelprice = hotelprice;
		this.hotelcoment = hotelcoment;
		this.hoteladress = hoteladress;
		this.hotelmapx = hotelmapx;
		this.hotelmapy = hotelmapy;
		this.hotelcheckin = hotelcheckin;
		this.hotelcheckout = hotelcheckout;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.deleteyn = deleteyn;
		
	}
	
	// 페이징
	public HotelVO(String hotelnum, String regionid, String hotelname, String hoteltel, String hotelimage, String hotelprice, String hotelcoment, String hoteladress, String hotelmapx, String hotelmapy
					,String hotelcheckin, String hotelcheckout, String insertdate, String updatedate, String deleteyn, String pageSize, String groupSize, String curPage, String totalCount) {
		
		this.hotelnum = hotelnum;
		this.regionid = regionid;
		this.hotelname = hotelname;
		this.hoteltel = hoteltel;
		this.hotelimage = hotelimage;
		this.hotelprice = hotelprice;
		this.hotelcoment = hotelcoment;
		this.hoteladress = hoteladress;
		this.hotelmapx = hotelmapx;
		this.hotelmapy = hotelmapy;
		this.hotelcheckin = hotelcheckin;
		this.hotelcheckout = hotelcheckout;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.deleteyn = deleteyn;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;	
		
	}
	
	// 조회수
	public HotelVO(String hotelnum, String regionid, String hotelname, String hoteltel, String hotelimage, String hotelprice, String hotelcoment, String hoteladress, String hotelmapx, String hotelmapy
					,String hotelcheckin, String hotelcheckout, String insertdate, String updatedate, String deleteyn, String pageSize, String groupSize, String curPage, String totalCount, int hotelhis) {
		
		this.hotelnum = hotelnum;
		this.regionid = regionid;
		this.hotelname = hotelname;
		this.hoteltel = hoteltel;
		this.hotelimage = hotelimage;
		this.hotelprice = hotelprice;
		this.hotelcoment = hotelcoment;
		this.hoteladress = hoteladress;
		this.hotelmapx = hotelmapx;
		this.hotelmapy = hotelmapy;
		this.hotelcheckin = hotelcheckin;
		this.hotelcheckout = hotelcheckout;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.deleteyn = deleteyn;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;	
		this.hotelhis = hotelhis;
		
	}

	public String getHotelnum() {
		return hotelnum;
	}

	public void setHotelnum(String hotelnum) {
		this.hotelnum = hotelnum;
	}

	public String getRegionid() {
		return regionid;
	}

	public void setRegionid(String regionid) {
		this.regionid = regionid;
	}

	public String getHotelname() {
		return hotelname;
	}

	public void setHotelname(String hotelname) {
		this.hotelname = hotelname;
	}

	public String getHoteltel() {
		return hoteltel;
	}

	public void setHoteltel(String hoteltel) {
		this.hoteltel = hoteltel;
	}

	public String getHotelimage() {
		return hotelimage;
	}

	public void setHotelimage(String hotelimage) {
		this.hotelimage = hotelimage;
	}

	public String getHotelprice() {
		return hotelprice;
	}

	public void setHotelprice(String hotelprice) {
		this.hotelprice = hotelprice;
	}

	public String getHotelcoment() {
		return hotelcoment;
	}

	public void setHotelcoment(String hotelcoment) {
		this.hotelcoment = hotelcoment;
	}

	public String getHoteladress() {
		return hoteladress;
	}

	public void setHoteladress(String hoteladress) {
		this.hoteladress = hoteladress;
	}

	public String getHotelmapx() {
		return hotelmapx;
	}

	public void setHotelmapx(String hotelmapx) {
		this.hotelmapx = hotelmapx;
	}

	public String getHotelmapy() {
		return hotelmapy;
	}

	public void setHotelmapy(String hotelmapy) {
		this.hotelmapy = hotelmapy;
	}

	public String getHotelcheckin() {
		return hotelcheckin;
	}

	public void setHotelcheckin(String hotelcheckin) {
		this.hotelcheckin = hotelcheckin;
	}

	public String getHotelcheckout() {
		return hotelcheckout;
	}

	public void setHotelcheckout(String hotelcheckout) {
		this.hotelcheckout = hotelcheckout;
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

	public int getHotelhis() {
		return hotelhis;
	}

	public void setHotelhis(int hotelhis) {
		this.hotelhis = hotelhis;
	}

	
	
}
