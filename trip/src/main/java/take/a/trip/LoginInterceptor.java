package take.a.trip;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private JedisPool jedisPool;
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
    	
    	HttpSession session = request.getSession();		// HttpServletRequest에서 세션을 가져오거나 새로 생성
		String sessionId = session.getId(); 		// 세션에서 고유한 세션 아이디 가져오기
		String jds="";
		
		try (Jedis jedis = jedisPool.getResource()) {       	
  			 // Redis에 데이터 검색
  	         	jds = jedis.get(sessionId);
  	        }
		
        if (request.getRequestURI().startsWith("/resources/")) {
            return true; // /login은 인터셉터를 거치지 않고 계속 진행
        }
        
        // main은 예외 처리
        if (request.getRequestURI().startsWith("/trip/main")) {
            return true; // /login은 인터셉터를 거치지 않고 계속 진행
        }
        
        // mem으로 시작하는 경로는 예외 처리
        if (request.getRequestURI().startsWith("/trip/mem")) {
            return true; // mem/* 은 인터셉터를 거치지 않고 계속 진행
        }
        
        // adminBoard는 관리자 확인
        if (request.getRequestURI().startsWith("/trip/adminBoard")) {
    		//adminBoard는 Redis에 값을 조회후 Y일 경우에만 진행
        	if (jds != null && jds.equals("Y")) {
        		return true;
        	}
        	return false;
        }
        
        if (jds == null) {
        	response.sendRedirect("/trip/mem/loginForm");
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        // postHandle 메서드는 컨트롤러 메서드 실행 후, 뷰가 렌더링되기 전에 실행됩니다.
        // 필요에 따라 후처리 작업을 수행할 수 있습니다.
    }

}
