package take.a.trip.spot.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.defaults.DefaultSqlSessionFactory;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import take.a.trip.spot.vo.ReviewVO;
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
	
	
	// 조회
	@Override
	public List<SpotVO> spot_IsudSelect(SpotVO svo) {
		// TODO Auto-generated method stub
		logger.info("SpotDAOImpl spot_IsudSelect 진입 >>> : ");
		
		return sqlSession.openSession().selectList("spot_IsudSelect", svo);
	}
	
	// 조회 수
	@Override
	public int spot_IsudSpothit(SpotVO svo) {
		// TODO Auto-generated method stub
		logger.info("SpotDAOImpl spot_IsudSpothit 진입 >>> : ");
		
		return sqlSession.openSession().update("spot_IsudSpothit", svo);
	}
	
	// 수정
	@Override
	public int spot_IsudUpdate(SpotVO svo) {
		// TODO Auto-generated method stub
		logger.info("SpotDAOImpl spot_IsudUpdate 진입 >>> : ");
		
		return sqlSession.openSession().update("spot_IsudUpdate", svo);
	}	
	

	// 삭제
	@Override
	public int spot_IsudDelete(SpotVO svo) {
		// TODO Auto-generated method stub
		logger.info("SpotDAOImpl spot_IsudSelectAll 진입 >>> : ");
		
		return sqlSession.openSession().update("spot_IsudDelete", svo);
	}
	
	// 조회 후 수정 폼
	@Override
	public List<SpotVO> spot_IsudSelect_admin(SpotVO svo) {
		// TODO Auto-generated method stub
		logger.info("SpotDAOImpl spot_IsudSelect_admin 진입 >>> : ");
		
		return sqlSession.openSession().selectList("spot_IsudSelect_admin", svo);
	}
		
	// 댓글 ================================================================
	
	// 입력
	@Override
	public int spot_IsudCommentInsert(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("SpotDAOImpl spot_IsudCommentInsert 진입 >>> : ");
		
		return sqlSession.openSession().insert("spot_IsudCommentInsert", rvo);
	}

	// 전체조회
	@Override
	public List<ReviewVO> spot_IsudCommentSelectAll(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("SpotDAOImpl spot_IsudCommentInsert 진입 >>> : ");
		return sqlSession.openSession().selectList("spot_IsudCommentSelectAll", rvo);
	}

	// 삭제
	@Override
	public int spot_IsudCommentDelete(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("SpotDAOImpl spot_IsudCommentInsert 진입 >>> : ");
		return sqlSession.openSession().update("spot_IsudCommentDelete", rvo);
	}
	

	// 검색 ====================================================================
	
	// 검색 
	@Override
	public List<SpotVO> spot_Search(SpotVO svo) {
		// TODO Auto-generated method stub
		logger.info("SpotDAOImpl spot_Search 진입 >>> : ");
		
		return sqlSession.openSession().selectList("spot_Search", svo);		
	}
}
