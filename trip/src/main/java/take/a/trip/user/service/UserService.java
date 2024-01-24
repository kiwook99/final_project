package take.a.trip.user.service;

import java.util.List;

import take.a.trip.user.vo.UserVO;

public interface UserService {
	public List<UserVO> userLogin(UserVO uvo);
}
