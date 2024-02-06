package take.a.trip.hotel.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import take.a.trip.hotel.dao.HotelDAO;
import take.a.trip.hotel.vo.HotelVO;

@Service
@Transactional
public class HotelServiceImpl implements HotelService {
	Logger logger = LogManager.getLogger(HotelServiceImpl.class);
	
	@Autowired(required=false)
	private HotelDAO hotelDAO;
	
	@Override
	public List<HotelVO> hotel_main(HotelVO hvo) {
		// TODO Auto-generated method stub
		logger.info("hotel_main 함수 진입");
		return hotelDAO.hotel_main(hvo);
	}
	
	@Override
	public List<HotelVO> hotelSearch(HotelVO hvo){
		logger.info("hotelSearch 함수 진입");
		
		return hotelDAO.hotelSearch(hvo);
	}
	
	@Override
	public List<HotelVO> hotelSelect(HotelVO hvo){
		logger.info("hotelSelect 함수 진입");
		
		return hotelDAO.hotelSelect(hvo);
	}
	

	@Override
	public List<HotelVO> hotelOrder(HotelVO hvo) {
		logger.info("hotelOrderForm 함수 진입 >>> : ");
		
		return hotelDAO.hotelOrder(hvo);
		
	}

	// 여행지 등록
	@Override
	public int hotelInsert(HotelVO hvo) {
		// TODO Auto-generated method stub
		logger.info("SpotServiceImpl spot_IsudInsert 진입 >>> : ");
		
		return hotelDAO.hotelInsert(hvo);
	}
	
	@Override
	public List<HotelVO> hotelUpdateForm(HotelVO hvo){
		logger.info("hotelUpdateForm 함수 진입");
		
		return hotelDAO.hotelUpdateForm(hvo);
	}
	
	@Override
	public int hotelUpdate(HotelVO hvo){
		logger.info("hotelUpdate 함수 진입");
		
		return hotelDAO.hotelUpdate(hvo);

	}
	
	@Override
	public int hotelDelete(HotelVO hvo){
		logger.info("hotelDelete 함수 진입");
		
		return hotelDAO.hotelDelete(hvo);
	}

}
