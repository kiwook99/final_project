package take.a.trip.user.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.defaults.DefaultSqlSessionFactory;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import take.a.trip.user.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	Logger logger = LogManager.getLogger(UserDAOImpl.class);
	
	@Autowired(required = false)
	@Resource(name = "sqlSession_oracle")
	private DefaultSqlSessionFactory sqlSession;
	
	public List<UserVO> userLogin(UserVO uvo) {
		return sqlSession.openSession().selectList("userLogin", uvo);
	}
}
