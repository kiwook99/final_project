package take.a.trip.hotel.dao;

import java.util.List;
import take.a.trip.hotel.vo.HotelVO;
import take.a.trip.spot.vo.SpotVO;

public interface HotelDAO {

	public List<HotelVO> hotel_main(HotelVO hvo);
	public List<HotelVO> hotelSearch(HotelVO hvo);
	public List<HotelVO> hotelSelect(HotelVO hvo);
	// 숙소 등록
	public int hotelInsert(HotelVO hvo);
	// 숙소 수정
	public List<HotelVO> hotelUpdateForm(HotelVO hvo);
	// 숙소 수정
	public int hotelUpdate(HotelVO hvo);
}
