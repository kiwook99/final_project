package take.a.trip.spot.service;


import java.util.List;
import take.a.trip.spot.vo.SpotVO;

public interface SpotService {

	
	// 여행지 등록
	public int spot_IsudInsert(SpotVO svo);
	
	// 전체조회
	public List<SpotVO> spot_IsudSelectAll(SpotVO svo);
	
	// 조회
	public List<SpotVO> spot_IsudSelect(SpotVO svo);
	
	// 조회 수
	public int spot_IsudSpothit(SpotVO svo);
	
	// 수정
	public int spot_IsudUpdate(SpotVO svo);
	
	// 삭제
	public int spot_IsudDelete(SpotVO svo);	
}
