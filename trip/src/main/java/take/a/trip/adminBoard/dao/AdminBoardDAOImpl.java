package take.a.trip.adminBoard.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import take.a.trip.adminBoard.vo.*;
import take.a.trip.spot.vo.SpotVO;

@Repository
public class AdminBoardDAOImpl implements AdminBoardDAO {
	Logger logger = LogManager.getLogger(AdminBoardDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int adminBoardInsert(AdminBoardVO abvo) {
		// TODO Auto-generated method stub
		logger.info("adminBoardInsert 함수 진입 >>> : ");	
		
		return sqlSession.insert("adminBoardInsert", abvo);
	}
	
	@Override
    public List<AdminBoardVO> adminBoardSelectAll(AdminBoardVO abvo) {
		logger.info("adminBoardSelectAll 함수 진입 >>> : ");
        // adminBoardSelectAll 메소드의 구현 내용 작성
        return sqlSession.selectList("adminBoardSelectAll");
    }
	
	@Override
	public List<AdminBoardVO> adminBoardSelect(AdminBoardVO abvo) {
		// TODO Auto-generated method stub
		logger.info("adminBoardSelect 함수 진입 >>> : ");	
		
		return sqlSession.selectList("adminBoardSelect", abvo);
	}
	
	@Override
	public int adminBoardHits(AdminBoardVO abvo) {
		// TODO Auto-generated method stub
		logger.info("adminBoardHits 함수 진입 >>> : ");	
		
		return sqlSession.update("adminBoardHits", abvo);
	}

	@Override
	public int adminBoardUpdate(AdminBoardVO abvo) {
		// TODO Auto-generated method stub
		logger.info("adminBoardUpdate 함수 진입 >>> : ");	
		
		return sqlSession.update("adminBoardUpdate", abvo);
	}

	@Override
	public int adminBoardDelete(AdminBoardVO abvo) {
		// TODO Auto-generated method stub
		logger.info("adminBoardDelete 함수 진입 >>> : ");	
		
		return sqlSession.update("adminBoardDelete", abvo);
	}
	
	@Override
	public List<AdminBoardVO> adminBoardUpdateForm(AdminBoardVO abvo) {
		// TODO Auto-generated method stub
		logger.info("adminBoardUpdateForm 함수 진입 >>> : ");	
		
		return sqlSession.selectList("adminBoardUpdateForm", abvo);
	}
	
	// 검색 
	@Override
	public List admin_SearchSelect(AdminBoardVO abvo) {
		// TODO Auto-generated method stub
		logger.info("AdminBoardDAOImpl admin_SearchSelect 진입 >>> : ");
		
		return sqlSession.selectList("admin_SearchSelect", abvo);		
	}

}
