package take.a.trip.adminBoard.vo;

public class AdminBoardVO {
	
	private String ADBOARDNUM;
	private String USERNUM;
	private String TITLE;
	private String COMENT;
	private String IMAGE;
	private String DELETEYN;
	private String INSERTDATE;
	private String UPDATEDATE;
	private String VIEW;
	
	// 생성자
	public AdminBoardVO() {
		
	}

	public String getADBOARDNUM() {
		return ADBOARDNUM;
	}

	public void setADBOARDNUM(String aDBOARDNUM) {
		ADBOARDNUM = aDBOARDNUM;
	}

	public String getUSERNUM() {
		return USERNUM;
	}

	public void setUSERNUM(String uSERNUM) {
		USERNUM = uSERNUM;
	}

	public String getTITLE() {
		return TITLE;
	}

	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}

	public String getCOMENT() {
		return COMENT;
	}

	public void setCOMENT(String cOMENT) {
		COMENT = cOMENT;
	}

	public String getIMAGE() {
		return IMAGE;
	}

	public void setIMAGE(String iMAGE) {
		IMAGE = iMAGE;
	}

	public String getDELETEYN() {
		return DELETEYN;
	}

	public void setDELETEYN(String dELETEYN) {
		DELETEYN = dELETEYN;
	}

	public String getINSERTDATE() {
		return INSERTDATE;
	}

	public void setINSERTDATE(String iNSERTDATE) {
		INSERTDATE = iNSERTDATE;
	}

	public String getUPDATEDATE() {
		return UPDATEDATE;
	}

	public void setUPDATEDATE(String uPDATEDATE) {
		UPDATEDATE = uPDATEDATE;
	}

	public String getVIEW() {
		return VIEW;
	}

	public void setVIEW(String vIEW) {
		VIEW = vIEW;
	}

}
