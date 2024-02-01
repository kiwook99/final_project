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
	@GetMapping("loginForm")
	public String loginForm() {
		logger.info("UserController loginForm 진입 >>> : ");
		
		return "mem/loginForm";
	}
	
	@PostMapping("login")
	public String login(Model model, MemVO mvo, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("UserController login 진입 >>> : ");
		
		HttpSession session = request.getSession(true);
		String memid = "";
		String adminyn = "";
		
		logger.info("userid >>> : " + mvo.getMemid());
		logger.info("userpw >>> : " + mvo.getMempw());
		
		List<MemVO> userLogin = memService.memLogin(mvo);
		
		if (userLogin != null && userLogin.size() != 0) {
			
			for (int i=0; i<userLogin.size(); i++) {
				MemVO mvo_1 = userLogin.get(i);
				memid = mvo_1.getMemid();
				adminyn = mvo_1.getAdminyn();
			}


			logger.info("memid >>> : " + memid);
			logger.info("adimnyn >>> : " + adminyn);
			
			model.addAttribute("userLogin", userLogin);
			session.setAttribute("memid", memid);
			
			 try (Jedis jedis = jedisPool.getResource()) {
		        	
				 	// Redis에 데이터 저장
		            jedis.set( memid, adminyn);
		            logger.info("jedis.set >>> : ");
		        }
			 
			 return "mem/login";
		}
		return "mem/loginForm";
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