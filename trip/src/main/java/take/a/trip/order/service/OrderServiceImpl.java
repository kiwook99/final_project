package take.a.trip.order.service;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Qualifier;

import take.a.trip.order.dao.OrderDAO;
import take.a.trip.order.vo.OrderVO;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
	Logger logger = LogManager.getLogger(OrderServiceImpl.class);
	
	@Autowired(required=false)
	@Qualifier("orderDAOImpl")
	private OrderDAO OrderDAO;

	@Override
	public int Orderinsert(OrderVO ovo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
