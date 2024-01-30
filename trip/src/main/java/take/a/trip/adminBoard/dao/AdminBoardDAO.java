package take.a.trip.adminBoard.dao;

import java.util.List;

import take.a.trip.adminBoard.vo.AdminBoardVO;

public interface AdminBoardDAO {
	
	public int adminBoardInsert(AdminBoardVO abvo);
	
	public List<AdminBoardVO> adminBoardSelectAll(AdminBoardVO abvo);
	/*
	adminBoardSelect(BoardVO bvo);
	adminBoardUpdate(BoardVO bvo);
	adminBoardDelete(BoardVO bvo);
	*/

}
