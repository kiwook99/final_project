package take.a.trip.adminBoard.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
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

import com.oreilly.servlet.MultipartRequest;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import take.a.trip.T_Session;
import take.a.trip.adminBoard.common.CommonUtils;
import take.a.trip.adminBoard.vo.AdminBoardVO;
import take.a.trip.adminBoard.service.AdminBoardService;

@Controller
public class AdminBoardController {
	Logger logger = LogManager.getLogger(AdminBoardController.class);
	
    //컨트롤러에서 회원 서비스 연결 
	@Autowired(required=false)
	private AdminBoardService adminBoardService;
	@Autowired
	private JedisPool jedisPool;
	@Autowired
	private T_Session t_Session;
	
	@GetMapping("adminboard/adminBoardSelectAll")
	public String adminBoardSelectAll(AdminBoardVO abvo, Model model, HttpServletRequest request) {
		logger.info("adminBoardSelectAll 함수 진입 >>> : ");
		
		 String sessionId = t_Session.getSession(request);
		
		// 페이징 처리 ====================================================================
				int pageSize = CommonUtils.ADMINBOARD_PAGE_SIZE;
				int groupSize = CommonUtils.ADMINBOARD_GROUP_SIZE;
				int curPage = CommonUtils.ADMINBOARD_CUR_PAGE;
				int totalCount = CommonUtils.ADMINBOARD_TOTAL_COUNT;
				
				if (abvo.getCurPage() !=null){
					curPage = Integer.parseInt(abvo.getCurPage());
				}
				
				abvo.setPageSize(String.valueOf(pageSize));
				abvo.setGroupSize(String.valueOf(groupSize));
				abvo.setCurPage(String.valueOf(curPage));
				abvo.setTotalCount(String.valueOf(totalCount));

				logger.info("abvo.getPageSize() >>> : 	" + abvo.getPageSize());
				logger.info("abvo.getGroupSize() >>> : 	" + abvo.getGroupSize());
				logger.info("abvo.getCurPage() >>> : 	" + abvo.getCurPage());
				logger.info("abvo.getTotalCount() >>> : " + abvo.getTotalCount());
		// 페이징 처리 ======================================================================================
				
		List<AdminBoardVO> listAll = adminBoardService.adminBoardSelectAll(abvo);
		if (listAll.size() > 0) {
			logger.info("adminBoardSelectAll listAll.size() 함수 진입 >>> : " + listAll.size());
			
			model.addAttribute("pagingABVO", abvo);
			model.addAttribute("listAll", listAll);
			
			 try (Jedis jedis = jedisPool.getResource()) {
					
				 String adminyn = jedis.get(sessionId);
				
				 if (adminyn != null) {
				        // 값이 존재하는 경우
				        logger.info("adminyn >>> : " + adminyn);
				        model.addAttribute("adminyn", adminyn);
				        logger.info("jedis.get >>> : ");
				    } else {
				        // 값이 없는 경우
				        logger.info("adminyn is null");
				        }
			 }
			
			return "adminboard/adminBoardSelectAll";
		}
			
		return "adminboard/adminBoardInsertForm";
	}
	
		// 게시글 조회 
		@GetMapping("adminboard/adminBoardSelect")
		public String adminBoardSelect(AdminBoardVO abvo, Model model, HttpServletRequest request) {
			logger.info("adminBoardSelect 함수 진입 >>> : ");
			
			String sessionId = t_Session.getSession(request);
			
			logger.info("adminBoardSelect 함수 진입  abvo.getAdboardnum() >>> : " + abvo.getAdboardnum());
			
			// 서비스 호출
			List<AdminBoardVO> listS = adminBoardService.adminBoardSelect(abvo);		
			if (listS.size() == 1) { 
				logger.info("adminBoardSelect listS.size() >>> : " + listS.size());
				
				// 조회수 업데이트 
				int bhitCnt = adminBoardService.adminBoardHits(abvo);
				logger.info("adminBoardSelect bhitCnt >>> : " + bhitCnt);
						
				model.addAttribute("listS", listS);
				
				try (Jedis jedis = jedisPool.getResource()) {
					
					 String adminyn = jedis.get(sessionId);
					
					 if (adminyn != null) {
					        // 값이 존재하는 경우
					        logger.info("adminyn >>> : " + adminyn);
					        model.addAttribute("adminyn", adminyn);
					        logger.info("jedis.get >>> : ");
					    } else {
					        // 값이 없는 경우
					        logger.info("adminyn is null");
					        }
				 }
				return "adminboard/adminBoardSelect";
			}		
			return "adminboard/adminBoardSelectAll";
		}
	
	
	@GetMapping("adminboard/adminBoardInsertForm")
    public String adminBoardInsertForm(AdminBoardVO abvo, Model model) {
		logger.info("adminBoardInsertForm 함수 진입 >>> : ");
		
			return "adminboard/adminBoardInsertForm";
	}

	// 입력
	@PostMapping("adminboard/adminBoardInsert")
	public String adminBoardInsert(HttpServletRequest req) {
	    logger.info("adminBoardInsert 함수 진입 >>> : "+ req);
	    
	    	// 파일 업로드
	 		String filePath = CommonUtils.ADMINBOARD_IMG_UPLOAD_PATH;
	 		int imgfileSize = CommonUtils.ADMINBOARD_IMG_FILE_SIZE;
	 		String encodeType = CommonUtils.ADMINBOARD_ENCODE;
	 		
	 		try {
				MultipartRequest mr = new MultipartRequest(req, filePath, imgfileSize, encodeType); 
				 
				AdminBoardVO abvo = null;  
				abvo = new AdminBoardVO(); 
			
				// 입력한 데이터 값 확인
				abvo.setAdboardtitle(mr.getParameter("adboardtitle"));
				abvo.setAdboardcoment(mr.getParameter("adboardcoment"));
				abvo.setAdboardimage(mr.getFilesystemName("adboardimage"));
				abvo.setMemnum(mr.getParameter("memnum"));
				
				logger.info("abvo.setAdboardtitle() >>> : " + abvo.getAdboardtitle());
				logger.info("abvo.setAdboardcoment() >>> : " + abvo.getAdboardcoment());
				logger.info("abvo.setAdboardimage() >>> : " + abvo.getAdboardimage());
				logger.info("abvo.setMemnum() >>> : " + abvo.getMemnum());
				
				// 서비스 호출
				int nCnt = adminBoardService.adminBoardInsert(abvo);
				
				if(nCnt > 0) {
					logger.info("nCnt >>> : " + nCnt);
					
					return "adminboard/adminBoardInsert";
				}
					
				}catch (IOException e) {
					logger.info("파일 업로드 중 에러 발생 >>> : " + e.getMessage());
				}
	        return "adminboard/adminBoardSelectAll";
	    }

	
		// 게시글 수정 
		@GetMapping("adminboard/adminBoardUpdateForm")
		public String adminBoardUpdateForm(AdminBoardVO abvo, Model model) {
			logger.info("adminBoardUpdateForm 함수 진입 >>> : ");
			
			// 서비스 호출
			List<AdminBoardVO> listU = adminBoardService.adminBoardUpdateForm(abvo);		
			if (listU.size() == 1) { 
				logger.info("adminBoardUpdateForm listU.size() >>> : " + listU.size());

				model.addAttribute("listU", listU);
				return "adminboard/adminBoardUpdateForm";
			}		
			return "adminboard/adminBoardSelect";
		}
	
		// 게시글 수정 
		@GetMapping("adminboard/adminBoardUpdate")
		public String adminBoardUpdate(AdminBoardVO abvo, Model model) {
			logger.info("adminBoardUpdate 함수 진입 >>> : ");
			
			
			logger.info("adminBoardUpdate 함수 진입 abvo.getAdboardnum() >>> : " + abvo.getAdboardnum());

			int nCnt = adminBoardService.adminBoardUpdate(abvo);
			
			if (nCnt > 0) { 
				logger.info("adminBoardUpdate nCnt >>> : " + nCnt);
				return "adminboard/adminBoardUpdate";
			}
			return "adminboard/adminBoardSelectAll";		
		}
		
		// 게시글 삭제
		@GetMapping("adminboard/adminBoardDelete")
		public String adminBoardDelete(AdminBoardVO abvo, Model model) {
			logger.info("adminBoardDelete 함수 진입 >>> : ");
			logger.info("adminBoardDelete 함수 진입 abvo.getAdboardnum() >>> : " + abvo.getAdboardnum());
			
			int nCnt = adminBoardService.adminBoardDelete(abvo);
			
			if (nCnt > 0) { 
				logger.info("adminBoardDelete nCnt >>> : " + nCnt);
				return "adminboard/adminBoardDelete";
			}
			return "#";		
		}


}
