package take.a.trip.order.vo;

public class OrderVO {
	
	private String obnum;
	private String hotelnum; 
	private String hotelname; 
	private String pbcnt; 
	private String pbprice;  
	private String pbpricesum;
	private String ooderivary;
	private String oozone; 
	private String ooroad; 
	private String ooroad2; 
	private String oojibun;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	//생성자
	public OrderVO() {
		
	}
	
	public OrderVO(String obnum, String hotelnum, String hotelname, String pbcnt, String pbprice, String pbpricesum,
			String cbnum, String cbmid, String cbmname, String cbmhp, String cbmemail, String ooderivary, String oozone,
			String ooroad, String ooroad2, String oojibun, String deleteyn, String insertdate,
			String updatedate) {
		
		this.obnum = obnum;
		this.hotelnum = hotelnum;
		this.hotelname = hotelname;
		this.pbcnt = pbcnt;
		this.pbprice = pbprice;
		this.pbpricesum = pbpricesum;
		this.ooderivary = ooderivary;
		this.oozone = oozone;
		this.ooroad = ooroad;
		this.ooroad2 = ooroad2;
		this.oojibun = oojibun;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}

	public String getObnum() {
		return obnum;
	}

	public void setObnum(String obnum) {
		this.obnum = obnum;
	}

	public String getHotelnum() {
		return hotelnum;
	}

	public void setHotelnum(String hotelnum) {
		this.hotelnum = hotelnum;
	}

	public String getHotelname() {
		return hotelname;
	}

	public void setHotelname(String hotelname) {
		this.hotelname = hotelname;
	}

	public String getPbcnt() {
		return pbcnt;
	}

	public void setPbcnt(String pbcnt) {
		this.pbcnt = pbcnt;
	}

	public String getPbprice() {
		return pbprice;
	}

	public void setPbprice(String pbprice) {
		this.pbprice = pbprice;
	}

	public String getPbpricesum() {
		return pbpricesum;
	}

	public void setPbpricesum(String pbpricesum) {
		this.pbpricesum = pbpricesum;
	}

	public String getOoderivary() {
		return ooderivary;
	}

	public void setOoderivary(String ooderivary) {
		this.ooderivary = ooderivary;
	}

	public String getOozone() {
		return oozone;
	}

	public void setOozone(String oozone) {
		this.oozone = oozone;
	}

	public String getOoroad() {
		return ooroad;
	}

	public void setOoroad(String ooroad) {
		this.ooroad = ooroad;
	}

	public String getOoroad2() {
		return ooroad2;
	}

	public void setOoroad2(String ooroad2) {
		this.ooroad2 = ooroad2;
	}

	public String getOojibun() {
		return oojibun;
	}

	public void setOojibun(String oojibun) {
		this.oojibun = oojibun;
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

	

}
