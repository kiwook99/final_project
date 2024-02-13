package take.a.trip.review.dao;

import java.util.List;

import take.a.trip.review.vo.ReviewVO;

public interface ReviewDAO {

	public int reviewInsert(ReviewVO rvo);
	public List<ReviewVO>reviewSelectAll(ReviewVO rvo);
	public int reviewDelete(ReviewVO rvo);
}
