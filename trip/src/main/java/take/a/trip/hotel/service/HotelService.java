package take.a.trip.hotel.service;

import java.util.List;

import take.a.trip.hotel.vo.HotelVO;

public interface HotelService {
	
	public List<HotelVO> hotel_main(HotelVO hvo);
	public List<HotelVO> hotelSearch(HotelVO hvo);
	public List<HotelVO> hotelSelect(HotelVO hvo);
}
