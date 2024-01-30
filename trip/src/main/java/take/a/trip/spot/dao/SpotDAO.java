package take.a.trip.spot.dao;

import java.util.List;

import take.a.trip.spot.vo.ReviewVO;
import take.a.trip.spot.vo.SpotVO;

public interface SpotDAO {

	
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
	
	// 댓글 ============================================
	
	// 입력
	public int spot_IsudCommentInsert(ReviewVO rvo);
	
	// 전체 조회
	public List<ReviewVO>spot_IsudCommentSelectAll(ReviewVO rvo);
	
	// 삭제
	public int spot_IsudCommentDelete(ReviewVO rvo);
	
	// 검색 ==============================================
	
	// 검색
	public List<SpotVO> spot_Search(SpotVO svo);
}
