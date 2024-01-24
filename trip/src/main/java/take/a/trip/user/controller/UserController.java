package take.a.trip.user.controller;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import take.a.trip.user.service.UserService;
import take.a.trip.user.vo.UserVO;


@Controller
public class UserController {
	
	// Logger 객체 생성
	Logger logger = LogManager.getLogger(UserController.class);
	
	@Autowired(required = false)
	private UserService userService;
	
	//로그인 폼
	@GetMapping("loginForm")
	public String loginForm() {
		logger.info("UserController loginForm 진입 >>> : ");
		
		return "user/loginForm";
	}
	
	@PostMapping("login")
	public String login(UserVO uvo) {
		logger.info("UserController login 진입 >>> : ");
		
		logger.info("userid >>> : " + uvo.getUSERID());
		logger.info("userpw >>> : " + uvo.getUSERPW());
		
		List<UserVO> userLogin = userService.userLogin(uvo);
		
		
		return "user/login";
	}
	
}
