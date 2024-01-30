package take.a.trip.adminBoard.controller;

import javax.servlet.http.HttpServletRequest;
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

import take.a.trip.common.*;
import take.a.trip.adminBoard.vo.AdminBoardVO;
import take.a.trip.adminBoard.service.AdminBoardService;

@Controller
public class AdminBoardController {
	Logger logger = LogManager.getLogger(AdminBoardController.class);
	
    //컨트롤러에서 회원 서비스 연결 
	@Autowired(required=false)
	private AdminBoardService adminBoardService;

	
	@GetMapping("adminBoardSelectAll")
	public String adminBoardSelectAll(AdminBoardVO abvo, Model model) {
		logger.info("adminBoardSelectAll 함수 진입 >>> : ");
		
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
			
			return "adminboard/adminBoardSelectAll";
		}
			
		return "adminboard/adminBoardSelectAll";
	}
	
	
	@GetMapping("adminBoardInsertForm")
    public String adminBoardInsertForm(AdminBoardVO abvo) {
		logger.info("adminBoardInsertForm 함수 진입 >>> : ");
		
        return "adminboard/adminBoardInsertForm";
    }

	// 입력
	@GetMapping("adminBoardInsert")
	public String adminBoardInsert(AdminBoardVO abvo, Model model) {
	    logger.info("adminBoardInsert 함수 진입 >>> : "+ abvo.getAdboardtitle());

	    // Service를 통한 데이터베이스 입력
	    int insertCnt = adminBoardService.adminBoardInsert(abvo);

	    if (insertCnt > 0) {
	        logger.info("adminBoardService nCnt >>> : " + insertCnt);
	        
	        // 모델에 속성 추가: 입력 건수를 뷰로 전달
	        model.addAttribute("insertCnt", insertCnt);
	        logger.info("insertCnt 함수 진입 >>> : " + insertCnt);

	        // 성공 페이지로 이동
	        return "adminboard/adminBoardInsert";
	    }

	    // 입력이 실패한 경우 실패 페이지로 이동
	    return "adminboard/adminBoardSelectAll";
	}
	

}
