package take.a.trip.mem.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import take.a.trip.mem.service.MemService;
import take.a.trip.mem.vo.MemVO;


@Controller
public class MemController {
	
	@Autowired
	private JedisPool jedisPool;
	
	// Logger 객체 생성
	Logger logger = LogManager.getLogger(MemController.class);
	
	@Autowired(required = false)
	private MemService memService;
	
	//로그인 폼
	@GetMapping("mem/loginForm")
	public String loginForm() {
		logger.info("UserController loginForm 진입 >>> : ");
		
		return "mem/loginForm";
	}
	
	@PostMapping("mem/login")
	public String login(Model model, MemVO mvo, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("UserController login 진입 >>> : ");
		
		HttpSession session = request.getSession(true);		// HttpServletRequest에서 세션을 가져오거나 새로 생성
		String sessionId = session.getId(); 		// 세션에서 고유한 세션 아이디 가져오기
		String adminyn = "";
		
		logger.info("userid >>> : " + mvo.getMemid());
		logger.info("userpw >>> : " + mvo.getMempw());
		
		List<MemVO> userLogin = memService.memLogin(mvo);
		
		if (userLogin != null && userLogin.size() != 0) {
			
			// List<MemVO> userLogin 에서 adminyn 값 추출
			for (int i=0; i<userLogin.size(); i++) {
				MemVO mvo_1 = userLogin.get(i);
				adminyn = mvo_1.getAdminyn();
			}

			logger.info("sessionId >>> : " + sessionId);
			logger.info("adimnyn >>> : " + adminyn);
			
			// 모델객체에 로그인정보 담기
			model.addAttribute("userLogin", userLogin);
			
			 try (Jedis jedis = jedisPool.getResource()) {
		        	
				 	// Redis에 데이터 저장
		            jedis.set( sessionId, adminyn);
		            // Redis 만료 시간 설정 (3600=1시간)
		            jedis.expire(sessionId, 3600*24);
		            logger.info("jedis.set >>> : ");
		        }
			 
			 return "mem/login";
		}
		return "mem/loginForm";
	}
	
	@GetMapping("mem/kakaoLogin")
	public String kakaoLogin() {
		logger.info("UserController kakaoLogin 진입 >>> : ");
		
		return "mem/login";
	}
	
	// 회원가입 폼
    @GetMapping("mem/insertForm")
    public String insertForm() {
        logger.info("UserController insertForm 진입 >>> : ");

        return "mem/insertForm";
    }

    @PostMapping("mem/insert")
	public String insert(MemVO mvo) {
		logger.info("UserController insert 진입 >>> : ");
		
		logger.info("userid >>> : " + mvo.getMemid());
		logger.info("userpw >>> : " + mvo.getMempw());

		int userinsert = memService.memInsert(mvo);
		
		
		return "mem/loginForm";
	}
    
    //===================================================
	@GetMapping("main")
	public String main() {
		logger.info("UserController main 진입 >>> : ");
		
		return "main";
	}
	//===================================================
		
}