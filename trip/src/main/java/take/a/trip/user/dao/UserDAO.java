package take.a.trip.user.dao;

import java.util.List;

import take.a.trip.user.vo.UserVO;

public interface UserDAO {
	public List<UserVO> userLogin(UserVO uvo);
}
