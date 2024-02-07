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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import take.a.trip.mem.common.GooglePwMail;
import take.a.trip.mem.common.PasswordUtil;
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
	
	// 로그인 폼
	@GetMapping("mem/loginForm")
	public String loginForm(Model model, HttpServletRequest request) {
		logger.info("MemController loginForm 진입 >>> : ");
	
		
		return "mem/loginForm";
	}
	
	// 로그인
	@PostMapping("mem/login")
	public String login(Model model, MemVO mvo, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("MemController login 진입 >>> : ");
		
		HttpSession session = request.getSession();	// HttpServletRequest에서 세션을 가져오거나 새로 생성
		String sessionId = session.getId(); 		// 세션에서 고유한 세션 아이디 가져오기
		session.setAttribute("memid", mvo.getMemid()); // memid라는 새션키에 memid값을 넣음
		String adminyn = "";
		
		logger.info("userid >>> : " + mvo.getMemid());
		logger.info("userpw >>> : " + mvo.getMempw());
		
		List<MemVO> userLogin = memService.memLogin(mvo);
		logger.info("userLogin >>> : " + userLogin.size());
		
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
			 
			 return "redirect:/spot/spot_IsudSelectAll";
		}
		return "mem/loginForm";
	}
	
	// 카카오 로그인
	@PostMapping("mem/kakaoLogin")
	public String kakaoLogin(@RequestParam("memid") String memid, HttpServletRequest request) {
		logger.info("UserController kakaoLogin 진입 >>> : ");		
		try {
            HttpSession session = request.getSession();
            session.setAttribute("memid", memid);
            String adminyn = "N";
            String msg = "";
            // Redis에 데이터 저장
            try (Jedis jedis = jedisPool.getResource()) {
                jedis.set(session.getId(), adminyn);
                jedis.expire(session.getId(), 3600 * 24);
            }
            String path = request.getContextPath();
            // 요청 성공 시 이동할 페이지 반환
            return "mem/loginForm";
        } catch (Exception e) {
            e.printStackTrace();
            // 오류 응답 생성
            return "error";
        }
    }
	
		// 네이버 로그인
		@PostMapping("mem/naverLogin")
		public String neverLogin(@RequestParam("memid") String memid, HttpServletRequest request) {
			logger.info("UserController naverLogin 진입 >>> : ");		
			try {
	            HttpSession session = request.getSession();
	            session.setAttribute("memid", memid);
	            String adminyn = "N";
	            String msg = "";
	            // Redis에 데이터 저장
	            try (Jedis jedis = jedisPool.getResource()) {
	                jedis.set(session.getId(), adminyn);
	                jedis.expire(session.getId(), 3600 * 24);
	            }
	            // 요청 성공 시 이동할 페이지 반환
	            return "redirect:/spot/spot_IsudSelectAll";
	        } catch (Exception e) {
	            e.printStackTrace();
	            // 오류 응답 생성
	            return "error";
	    }
	}
	
	// 회원가입 폼
    @GetMapping("mem/insertForm")
    public String insertForm() {
        logger.info("UserController insertForm 진입 >>> : ");

        return "mem/insertForm";
    }
    
    // 회원가입
    @PostMapping("mem/insert")
	public String insert(MemVO mvo) {
		logger.info("UserController insert 진입 >>> : ");
		
		logger.info("userid >>> : " + mvo.getMemid());
		logger.info("userpw >>> : " + mvo.getMempw());

		int userinsert = memService.memInsert(mvo);
		
		
		return "mem/loginForm";
	}
    
    // 아이디 찾기폼 (구글)
    @GetMapping("mem/idSearchForm")
    public String idSearchForm() {
    	logger.info("idSearchForm() 함수 진입 >>> :");
    	
    	return "mem/searchForm";
    }
    
    // 아이디 찾기 (구글)
    @PostMapping("mem/idSearch")
    @ResponseBody
    public String memidSearch(MemVO mvo) {
    	logger.info("memidSearch() 함수 진입 >>> :");
    	logger.info("mvo.getMememail()  >>> :" + mvo.getMememail());
    	String mememail = mvo.getMememail();
    	String sendMsg = "<h2 style='color:blue'> ID찾기 결과 </h2>";
    	String sendId = "";
    	
    	List<MemVO> lsit = memService.memIdSearch(mvo);
    	
    	if (lsit != null && lsit.size() !=0) {
			for(int i=0; i<lsit.size(); i++) {	
				MemVO mvo_1 = lsit.get(i);
				sendId = mvo_1.getMemid();
				logger.info("sendId  >>> :" + sendId);
			}
			return "{\"result\": \"" + sendId + "\"}";
    	}
    	return "false";
    }
    
    //비밀번호 찾기
	@PostMapping("mem/pwSearch")
	@ResponseBody
	public String mempwSearch(MemVO mvo){
		logger.info(" mempwSearch() 함수진입>>> : ");
		logger.info(" mvo.getMemid() >>> : " + mvo.getMemid());
		logger.info(" mvo.getMememail() >>> : " + mvo.getMememail());
		String sendId =  mvo.getMemid();
		String tempPw = PasswordUtil.randomPW(6);
		String sendMsg = "<h2 style='color:blue'> 임시비밀번호:  " + tempPw + "</h2>";
		String mememail = mvo.getMememail();
		String msg = "";
		mvo.setMempw(tempPw);
		
		logger.info(" sendId() >>> : "+ sendId);
		logger.info(" tempPw() >>> : " + tempPw);
		logger.info(" sendMsg() >>> : " + sendMsg);
		logger.info(" mememail() >>> : " + mememail);
		logger.info(" msg() 함수진입>>> : " + msg);

		int cnt = memService.memPwSearch(mvo);
		logger.info(" cnt() >>> : " + cnt);
		
		if(cnt == 0) {msg ="false";}
		else { msg = "success";}

		try {
			GooglePwMail gms = new GooglePwMail();
			gms.pwMail(mememail, sendMsg);
		}catch(Exception e) {
			logger.info(" GooglePwMail() 에러 >>> : " + e);
		}
		
		return msg;
	}
    
    //로그아웃
	@GetMapping("mem/logout")
	public String logout(HttpSession session,HttpServletRequest request) {
		logger.info("UserController logout 진입 >>> : ");
		
		session = request.getSession();	// HttpServletRequest에서 세션을 가져오거나 새로 생성
		String sessionId = session.getId(); 		// 세션에서 고유한 세션 아이디 가져오기
		logger.info("sessionId >>> : "+ sessionId);
		
		//래디스 연결
		try (Jedis jedis = jedisPool.getResource()) {

	            // 키를 삭제합니다.
	            Long deletedKeysCount = jedis.del(sessionId);
	        }
		// 세션을 무효화하여 삭제
		session.invalidate();
		
		return "redirect:/spot/spot_IsudSelectAll";
	}
	
	//네이버 로그인 콜백함수
    @GetMapping("mem/callback")
    public String callback() {
    	 
    	return "mem/callback";
    }


	
	//아이디중복체크
		@PostMapping("mem/idCheck")
		@ResponseBody
		public Object idCheck(MemVO mvo) {
			logger.info("idCheck 함수 진입 >>> :");		
			logger.info("idCheck ovo.getmid()() >>> : " + mvo.getMemid());
			
			List<MemVO> list = memService.idCheck(mvo);
			logger.info("idCheck list.size() >>> :" + list.size());
			
			String msg = "";
			if(list.size() == 0) {msg = "ID_YES";}
			else { msg = "ID_NO";}
			
			return msg;
		}


		
}