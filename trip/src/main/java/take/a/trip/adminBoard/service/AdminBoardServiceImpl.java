package take.a.trip.adminBoard.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import take.a.trip.adminBoard.vo.AdminBoardVO;
import take.a.trip.adminBoard.dao.AdminBoardDAO;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {
	Logger logger = LogManager.getLogger(AdminBoardServiceImpl.class);
			
	@Autowired(required=false)
	private AdminBoardDAO adminBoardDAO;
	
	@Override
	public int adminBoardInsert(AdminBoardVO abvo) {
		logger.info("adminBoardInsert 함수 진입 >>> : ");
		return adminBoardDAO.adminBoardInsert(abvo);
	}
	
	@Override
	public List<AdminBoardVO> adminBoardSelectAll(AdminBoardVO abvo) {
	    logger.info("adminBoardSelectAll 함수 진입 >>> : ");
	    return adminBoardDAO.adminBoardSelectAll(abvo);
	}
	

}
