package take.a.trip;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

@Component
public class T_Session {
	Logger logger = LogManager.getLogger(T_Session.class);

	private static final String K_SESSION_ID = "USER";
	
//	private static K_Session kSession = null;
//	public static K_Session getInstance() {
//		if(kSession == null) {
//			kSession = new K_Session();
//		}
//		return kSession;
//	}
	
	// 싱글톤 패턴 : Singleton pattern
	private static class LazyHolder{
		public static final T_Session SESSIONLISTENER_INSTANCE = new T_Session();
	}	
	
	public static T_Session getInstance(){
		return LazyHolder.SESSIONLISTENER_INSTANCE;
	}

	public T_Session(){
		super();
	}
	
	public void killSession(final HttpServletRequest hReq){
			
		HttpSession hSession = hReq.getSession(false);			
		if (hSession !=null) {
			hSession.removeAttribute(K_SESSION_ID);
			hSession.invalidate();
		}
	}
	
	public boolean setSession(final HttpServletRequest hReq, final String userID) {
		
		HttpSession hSession = hReq.getSession();
		String k_session_val = (String)hSession.getAttribute(K_SESSION_ID);
		int nCnt = 0;
		
		if (k_session_val !=null) {
			boolean b1 = k_session_val.equals(userID);
			
			if (b1) { 
				nCnt++; 
			}else {
				logger.info("세션 없음 >>> : ");
			}
		}else {
			logger.info("세션 없음 >>> : ");
		}
		
		if (nCnt == 0) {
//			hSession.invalidate();
			hSession.setAttribute(K_SESSION_ID, userID);
			hSession.setMaxInactiveInterval(60*60*9); // 9시간 
			
			return false;
		}		
		return true;
	}
	
	public String getSession(final HttpServletRequest hReq){
		
		String strSession = "";		
		HttpSession hSession = hReq.getSession(false);		
		if (hSession !=null) {
			strSession = (String)hSession.getAttribute(K_SESSION_ID);
		}							
		return strSession;
	}
}
