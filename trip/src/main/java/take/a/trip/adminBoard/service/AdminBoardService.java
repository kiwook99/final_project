package take.a.trip.adminBoard.service;

import java.util.List;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import take.a.trip.adminBoard.controller.AdminBoardController;
import take.a.trip.adminBoard.vo.AdminBoardVO;

public interface AdminBoardService {
	
	public int adminBoardInsert(AdminBoardVO abvo);
	
	public List<AdminBoardVO> adminBoardSelectAll(AdminBoardVO abvo);

}
