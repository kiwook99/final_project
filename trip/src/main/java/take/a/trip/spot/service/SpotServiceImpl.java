package take.a.trip.spot.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import take.a.trip.spot.dao.SpotDAO;
import take.a.trip.spot.vo.SpotVO;

@Service
@Transactional
public class SpotServiceImpl implements SpotService {

	Logger logger = LogManager.getLogger(SpotServiceImpl.class);
	
	// 의존성 주입
	@Autowired(required = false)
	private SpotDAO spotDAO;
	
	// 여행지 등록
	@Override
	public int spot_IsudInsert(SpotVO svo) {
		// TODO Auto-generated method stub
		logger.info("SpotServiceImpl spot_IsudInsert 진입 >>> : ");
		
		return spotDAO.spot_IsudInsert(svo);
	}

	// 전체조회
	@Override
	public List<SpotVO> spot_IsudSelectAll(SpotVO svo) {
		// TODO Auto-generated method stub
		logger.info("SpotServiceImpl spot_IsudSelectAll 진입 >>> : ");
		
		return spotDAO.spot_IsudSelectAll(svo);
	}

}
