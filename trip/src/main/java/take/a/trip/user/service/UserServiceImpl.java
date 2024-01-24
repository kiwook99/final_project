package take.a.trip.user.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import take.a.trip.user.dao.UserDAO;
import take.a.trip.user.vo.UserVO;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	Logger logger = LogManager.getLogger(UserServiceImpl.class);
	
	@Autowired
	private UserDAO userDAO;
	
	public List<UserVO> userLogin(UserVO uvo) {
		return userDAO.userLogin(uvo);
	}
}
