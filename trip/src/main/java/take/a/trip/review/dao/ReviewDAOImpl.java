package take.a.trip.review.dao;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import take.a.trip.review.vo.ReviewVO;

@Repository
//@Repository: 해당 클래스가 스프링의 Bean으로 등록되어 Component Scan을 통해 자동으로 인식
public class ReviewDAOImpl implements ReviewDAO {
	Logger logger = LogManager.getLogger(ReviewDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSessionTemplate sqlSession;

	@Override
	public int reviewInsert(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("reviewInsert 함수 진입 >>> : ");			
		return sqlSession.insert("reviewInsert", rvo);
	}

	@Override
	public List<ReviewVO> reviewSelectAll(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("reviewSelectAll 함수 진입 >>> : ");			
		return sqlSession.selectList("reviewSelectAll", rvo);
	}

	@Override
	public int reviewDelete(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("reviewDelete 함수 진입 >>> : ");			
		return sqlSession.insert("reviewDelete", rvo);
	}

}
