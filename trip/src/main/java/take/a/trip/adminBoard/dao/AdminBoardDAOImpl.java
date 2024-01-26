package take.a.trip.adminBoard.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import take.a.trip.adminBoard.vo.*;

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
	

}
