package take.a.trip.spot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import take.a.trip.spot.service.SpotService;
import take.a.trip.spot.util.CommonUtils;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

@Controller
public class SpotController {
	
	Logger logger = LogManager.getLogger(SpotController.class);
	
	// 의존성 주입
	 @Autowired (required = false)
	 private SpotService spotService;
	
	
	// @RequestMapping("spot")
	// 로그인 전
	@GetMapping("spot")
	public String spot() {
		logger.info("SpotController spot 진입 >>> : ");

		return "spot/spot";
	}
	
	// 로그인 후
	@GetMapping("spot_login")
	public String spot_login() {
		logger.info("SpotController spot_login 진입 >>> : ");
		
		return "spot/spot_login";
	}
	
	
	// 로그인 전(ISUD)
	@GetMapping("spot_ISUD")
	public String spot_ISUD() {
		logger.info("SpotController spot_ISUD 진입 >>> : ");

		return "spot/spot_IsudForm";
	}	
	

	// 로그인 전(ISUD)
	@PostMapping("spot_IsudInsert")
	public String spot_IsudInsert() {
		logger.info("SpotController spot_IsudInsert 진입 >>> : ");

		return "spot/spot_IsudInsert";
	}	
	
	
	
	// 전체조회(ISUD)
	@PostMapping("spot_IsudSelectAll")
	public String spot_IsudSelectAll() {
		logger.info("SpotController spot_IsudSelectAll 진입 >>> : ");

		return "spot/spot_IsudSelectAll";
	}		
	
	
    @GetMapping("spot_detail/{contentid}")
	//@GetMapping("spot_detail")
	public String spot_detail() {
		logger.info("SpotController spot_detail 진입 >>> : ");
		
		return "spot/spot_detail";
	}	
}
