package take.a.trip.order.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import take.a.trip.order.service.OrderService;
import take.a.trip.order.vo.OrderVO;
import take.a.trip.hotel.util.NumUtil;

@Controller
public class OrderController {
    Logger logger = LogManager.getLogger(OrderController.class);

    @Autowired(required=false)
    private OrderService orderService;

    // 주문 입력 폼
    @RequestMapping(value="OrderInsertForm", method=RequestMethod.GET)
    public String orderInsertForm(OrderVO ovo, Model model) {
        logger.info("OrderController OrderInsertForm 함수 진입 >>> : ");   
        
        logger.info("ovo.getHotelnum() >>> : " + ovo.getHotelnum());
        logger.info("ovo.getHotelname() >>> : " + ovo.getHotelname());
        logger.info("ovo.getPbcnt() >>> : " + ovo.getPbcnt());
        ovo.setPbprice(NumUtil.comma_replace(ovo.getPbprice()));
        logger.info("ovo.getPbprice() >>> : " + ovo.getPbprice());
        ovo.setPbpricesum(NumUtil.comma_replace(ovo.getPbpricesum()));
        logger.info("ovo.getPbpricesum() >>> : " + ovo.getPbpricesum());
        logger.info("ovo.getObnum() >>> : " + ovo.getObnum());
        logger.info("ovo.getOoderivary() >>> : " + ovo.getOoderivary());
        logger.info("ovo.getOozone() >>> : " + ovo.getOozone());
        logger.info("ovo.getOoroad() >>> : " + ovo.getOoroad());
        logger.info("ovo.getOoroad2() >>> : " + ovo.getOoroad2());
        logger.info("ovo.getOojibun() >>> : " + ovo.getOojibun());
        
        // 서비스 호출
        
        return "order/sOrderInsertForm";
    }
    
    // 주문하기  
    @RequestMapping(value="OrderInsert", method=RequestMethod.POST)
    public String orderInsert(HttpServletRequest req) {   
        logger.info("OrderController OrderInsert 함수 진입 >>> : ");   
        
        // 채번 구하기
        
        // 서비스 호출
        int nCnt = 0;
        
        
        return "hotel/hotelSelect";
    }   
}
