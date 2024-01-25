package take.a.trip.mem.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.defaults.DefaultSqlSessionFactory;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import take.a.trip.mem.vo.MemVO;

@Repository
public class MemDAOImpl implements MemDAO {
	Logger logger = LogManager.getLogger(MemDAOImpl.class);
	
	@Autowired(required = false)
	@Resource(name = "sqlSession_oracle")
	private DefaultSqlSessionFactory sqlSession;
	
	public List<MemVO> memLogin(MemVO mvo) {
		return sqlSession.openSession().selectList("memLogin", mvo);
	}
}
