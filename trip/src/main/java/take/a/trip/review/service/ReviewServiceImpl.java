package take.a.trip.review.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import take.a.trip.review.dao.ReviewDAO;
import take.a.trip.review.vo.ReviewVO;

@Service
@Transactional
public class ReviewServiceImpl implements ReviewService {
	Logger logger = LogManager.getLogger(ReviewServiceImpl.class);
	
	// 서비스에서 DAO 연결하기 
	// 필드 @Autowired 어노테이션으로  DI (의존성 주입하기)
	@Autowired(required=false)	
	private ReviewDAO reviewDAO;

	@Override
	public int reviewInsert(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("reviewInsert 함수 진입 >>> : ");			
		return reviewDAO.reviewInsert(rvo);
	}

	@Override
	public List<ReviewVO> reviewSelectAll(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("reviewSelectAll 함수 진입 >>> : ");			
		return reviewDAO.reviewSelectAll(rvo);
	}

	@Override
	public int reviewDelete(ReviewVO rvo) {
		// TODO Auto-generated method stub
		logger.info("reviewDelete 함수 진입 >>> : ");			
		return reviewDAO.reviewDelete(rvo);
	}

}
