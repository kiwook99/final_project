package take.a.trip.spot.service;


import java.util.List;
import take.a.trip.spot.vo.SpotVO;

public interface SpotService {

	
	// 여행지 등록
	public int spot_IsudInsert(SpotVO svo);
	
	// 전체조회
	public List<SpotVO> spot_IsudSelectAll(SpotVO svo);
}
