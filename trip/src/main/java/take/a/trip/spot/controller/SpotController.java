package take.a.trip.spot.controller;

import org.springframework.stereotype.Controller;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

@Controller
public class SpotController {
	
	Logger logger = LogManager.getLogger(SpotController.class);
	
	// @Autowired (required = false)
	// SpotSerivce spotSerivce
	
	
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
	
	
    @GetMapping("spot_detail/{contentid}")
	//@GetMapping("spot_detail")
	public String spot_detail() {
		logger.info("SpotController spot_detail 진입 >>> : ");
		
		return "spot/spot_detail";
	}	
}
