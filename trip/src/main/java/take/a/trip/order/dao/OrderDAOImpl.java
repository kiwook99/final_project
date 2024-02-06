package take.a.trip.order.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import take.a.trip.order.vo.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	Logger logger = LogManager.getLogger(OrderDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;

	@Override
	public int OrderInsert(OrderVO ovo) {
		// TODO Auto-generated method stub
		logger.info("OrderInsert 함수 진입 >>> : ");
		return (Integer)sqlSession.insert("OrderInsert", ovo);
	}

}