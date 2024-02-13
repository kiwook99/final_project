package take.a.trip.review.service;

import java.util.List;

import take.a.trip.review.vo.ReviewVO;

public interface ReviewService {

	public int reviewInsert(ReviewVO rvo);
	public List<ReviewVO>reviewSelectAll(ReviewVO rvo);
	public int reviewDelete(ReviewVO rvo);
}
