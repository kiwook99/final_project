package take.a.trip.adminBoard.service;

import java.util.List;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import take.a.trip.adminBoard.controller.AdminBoardController;
import take.a.trip.adminBoard.vo.AdminBoardVO;

public interface AdminBoardService {
	
	public int adminBoardInsert(AdminBoardVO abvo);
	
	public List<AdminBoardVO> adminBoardSelectAll(AdminBoardVO abvo);
	public List<AdminBoardVO> adminBoardSelect(AdminBoardVO abvo);
	public List<AdminBoardVO> adminBoardUpdateForm(AdminBoardVO abvo);
	
	// 게시글 조회 수 
	public int adminBoardHits(AdminBoardVO abvo);
	
	public int adminBoardUpdate(AdminBoardVO abvo);
	public int adminBoardDelete(AdminBoardVO abvo);

}
