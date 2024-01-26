package take.a.trip.spot.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.defaults.DefaultSqlSessionFactory;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import take.a.trip.spot.vo.SpotVO;

@Repository //("SpotDAO")
public class SpotDAOImpl implements SpotDAO {

	Logger logger = LogManager.getLogger(SpotDAOImpl.class);

	// 의존성 주입
	@Autowired(required = false)
	@Resource(name = "sqlSession_oracle")
	private DefaultSqlSessionFactory sqlSession;
	
	
	// 여행지 등록
	@Override
	public int spot_IsudInsert(SpotVO svo) {
		// TODO Auto-generated method stub
		logger.info("SpotDAOImpl spot_IsudInsert 진입 >>> : ");
		
		return sqlSession.openSession().insert("spot_IsudInsert", svo);
	}

	
	// 전체조회
	@Override
	public List<SpotVO> spot_IsudSelectAll(SpotVO svo) {
		// TODO Auto-generated method stub
		logger.info("SpotDAOImpl spot_IsudSelectAll 진입 >>> : ");
		
		return sqlSession.openSession().selectList("spot_IsudSelectAll", svo);
	}

}
