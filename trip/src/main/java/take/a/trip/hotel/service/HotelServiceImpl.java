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

}
