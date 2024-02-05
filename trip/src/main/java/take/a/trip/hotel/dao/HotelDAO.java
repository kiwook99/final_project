package take.a.trip.hotel.dao;

import java.util.List;
import take.a.trip.hotel.vo.HotelVO;

public interface HotelDAO {

	public List<HotelVO> hotel_main(HotelVO hvo);
	public List<HotelVO> hotelSearch(HotelVO hvo);
	public List<HotelVO> hotelSelect(HotelVO hvo);
	
	public List<HotelVO> hotelOrderForm(HotelVO hvo);
}
