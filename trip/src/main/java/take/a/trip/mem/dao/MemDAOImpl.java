package take.a.trip.mem.dao;

import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
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
    	logger.info("MemDAOImpl memLogin >>> : ");
        return sqlSession.openSession().selectList("memLogin", mvo);
    }
    
    public List<MemVO> memIdSearch(MemVO mvo) {
    	logger.info("MemDAOImpl memIdSearch >>> : ");
    	return sqlSession.openSession().selectList("memIdSearch", mvo);
    }

    public int memInsert(MemVO mvo) {
        return sqlSession.openSession().insert("memInsert", mvo);
    }
    
    public int memPwSearch(MemVO mvo) {
    	return sqlSession.openSession().update("memPwSearch", mvo);
    }
    
}