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
	private String adboardhits;
	
	// 생성자 
	public AdminBoardVO() {
		
	}
	
	
	public AdminBoardVO(String adboardnum, String memnum, String adboardtitle, String adboardcoment, String adboardimage, String insertdate,
			String updatedate, String deleteyn, String adboardhits) {
		
		this.adboardnum = adboardnum;
		this.memnum = memnum;
		this.adboardtitle = adboardtitle;
		this.adboardcoment = adboardcoment;
		this.adboardimage = adboardimage;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.deleteyn = deleteyn;
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


	public String getAdboardhits() {
		return adboardhits;
	}


	public void setAdboardhits(String adboardhits) {
		this.adboardhits = adboardhits;
	}
	
}
