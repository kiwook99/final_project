package take.a.trip.mem.controller;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import take.a.trip.mem.service.MemService;
import take.a.trip.mem.vo.MemVO;


@Controller
public class MemController {
	
	// Logger 객체 생성
	Logger logger = LogManager.getLogger(MemController.class);
	
	@Autowired(required = false)
	private MemService memService;
	
	//로그인 폼
	@GetMapping("loginForm")
	public String loginForm() {
		logger.info("UserController loginForm 진입 >>> : ");
		
		return "mem/loginForm";
	}
	
	@PostMapping("login")
	public String login(MemVO mvo) {
		logger.info("UserController login 진입 >>> : ");
		
		logger.info("userid >>> : " + mvo.getMemid());
		logger.info("userpw >>> : " + mvo.getMempw());
		
		List<MemVO> userLogin = memService.memLogin(mvo);
		
		
		return "mem/login";
	}
	
	@GetMapping("kakaoLogin")
	public String kakaoLogin() {
		logger.info("UserController kakaoLogin 진입 >>> : ");
		
		return "mem/login";
	}
	
	// 회원가입 폼
    @GetMapping("insertForm")
    public String insertForm() {
        logger.info("UserController insertForm 진입 >>> : ");

        return "mem/insertForm";
    }

    @PostMapping("insert")
	public String insert(MemVO mvo) {
		logger.info("UserController insert 진입 >>> : ");
		
		logger.info("userid >>> : " + mvo.getMemid());
		logger.info("userpw >>> : " + mvo.getMempw());

		int userinsert = memService.memInsert(mvo);
		
		
		return "mem/loginForm";
	}
		
}