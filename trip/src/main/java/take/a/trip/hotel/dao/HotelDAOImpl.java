package take.a.trip.hotel.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.apache.ibatis.session.defaults.DefaultSqlSessionFactory;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import take.a.trip.hotel.vo.HotelVO;

@Repository//("HotelDAO")
public class HotelDAOImpl implements HotelDAO {
	
	Logger logger = LogManager.getLogger(HotelDAOImpl.class);
	
	// 의존성 주입
	@Autowired(required = false)
	@Resource(name = "sqlSession_oracle")
	private DefaultSqlSessionFactory sqlSession;
	
	@Override
	public List<HotelVO> hotel_main(HotelVO hvo) {
		// TODO Auto-generated method stub
		logger.info("hotel_main 함수 진입");
		
		return sqlSession.openSession().selectList("hotel_main",hvo);
	}

	@Override
	public List<HotelVO> hotelSearch(HotelVO hvo){
		logger.info("hotelSearch 함수 진입");
		
		return sqlSession.openSession().selectList("hotelSearch",hvo);
	}
	
	@Override
	public List<HotelVO> hotelSelect(HotelVO hvo){
		logger.info("hotelSelect 함수 진입");
		
		return sqlSession.openSession().selectList("hotelSelect",hvo);
	}
	
	// 숙소 등록
	@Override
	public int hotelInsert(HotelVO hvo) {
		// TODO Auto-generated method stub
		logger.info("hotelInsert 함수 진입");
		
		return sqlSession.openSession().insert("hotelInsert", hvo);
	}
	
	@Override
	public List<HotelVO> hotelUpdateForm(HotelVO hvo){
		logger.info("hotelUpdateForm 함수 진입");
		
		return sqlSession.openSession().selectList("hotelUpdateForm",hvo);
	}
	
	@Override
	public int hotelUpdate(HotelVO hvo){
		logger.info("hotelUpdate 함수 진입");
		
		return sqlSession.openSession().update("hotelUpdate",hvo);
	}
	
	@Override
	public int hotelDelete(HotelVO hvo){
		logger.info("hotelDelete 함수 진입");
		
		return sqlSession.openSession().update("hotelDelete",hvo);
	}
	
}
