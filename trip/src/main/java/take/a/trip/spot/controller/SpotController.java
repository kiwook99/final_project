package take.a.trip.spot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile; // 최신
import com.oreilly.servlet.MultipartRequest;	// 구


import take.a.trip.spot.service.SpotService;
import take.a.trip.spot.util.CommonUtils;
import take.a.trip.spot.vo.SpotVO;


 

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

@Controller
public class SpotController {
	
	Logger logger = LogManager.getLogger(SpotController.class);
	
	// 의존성 주입
	 @Autowired (required = false)
	 private SpotService spotService;
	
	
	// @RequestMapping("spot")
	// 로그인 전
	@GetMapping("spot/spot")
	public String spot() {
		logger.info("SpotController spot 진입 >>> : ");

		return "spot/spot";
	}
	
	// 로그인 후
	@GetMapping("spot/spot_login")
	public String spot_login() {
		logger.info("SpotController spot_login 진입 >>> : ");
		
		return "spot/spot_login";
	}
	
	
	// 여행지 입력 폼(ISUD)
	@GetMapping("spot/spot_ISUD")
	public String spot_ISUD() {
		logger.info("SpotController spot_ISUD 진입 >>> : ");

		return "spot/spot_IsudForm";
	}	
	

	// 여행지 입력(ISUD)
	@PostMapping("spot/spot_IsudInsert")
	public String spot_IsudInsert(HttpServletRequest req) {
		logger.info("SpotController spot_IsudInsert 진입 >>> : ");


		// 파일 업로드
		String filePath = CommonUtils.SPOT_IMG_UPLOAD_PATH;
		int imgfileSize = CommonUtils.SPOT_IMG_FILE_SIZE;
		String encodeType = CommonUtils.SPOT_ENCODE;
		
		try {
			MultipartRequest mr = new MultipartRequest(req, filePath, imgfileSize, encodeType); 
			 
			SpotVO svo = null;  
			svo = new SpotVO(); 
		
			// 입력한 데이터 값 확인
			svo.setTripname(mr.getParameter("tripname"));
			svo.setTripcatalogue(mr.getParameter("tripcatalogue"));
			svo.setTripcoment(mr.getParameter("tripcoment"));
			svo.setTripregion(mr.getParameter("tripregion"));
			svo.setTripimage(mr.getFilesystemName("tripimage"));
			
			logger.info("spot_IsudInsert svo.setTripname() >>> : " + svo.getTripname());
			logger.info("spot_IsudInsert svo.setTripcatalogue() >>> : " + svo.getTripcatalogue());
			logger.info("spot_IsudInsert svo.setTripcoment() >>> : " + svo.getTripcoment());
			logger.info("spot_IsudInsert svo.setTripregion() >>> : " + svo.getTripregion());
			logger.info("spot_IsudInsert svo.setTripimage() >>> : " + svo.getTripimage());
			
			// 서비스 호출
			int nCnt = spotService.spot_IsudInsert(svo);
			
			if(nCnt > 0) {
				logger.info("nCnt >>> : " + nCnt);
				
				return "spot/spot_IsudInsert";		
			}
		} catch (IOException e) {
			logger.info("파일 업로드 중 에러 발생 >>> : " + e.getMessage());
		}
		return "spot/spot_IsudForm";
	}
	
	
	
	// 전체조회(ISUD)
	@GetMapping("spot/spot_IsudSelectAll")
	public String spot_IsudSelectAll(SpotVO svo, Model model) {
		logger.info("SpotController spot_IsudSelectAll 진입 >>> : ");

		// 페이징
		int pageSize = CommonUtils.SPOT_PAGE_SIZE;  // 페이지에 나올 값
		int groupSize = CommonUtils.SPOT_GROUP_SIZE;	// 그룹으로 묶을 값
		int curPage = CommonUtils.SPOT_CUR_PAGE;	// 현재 페이지 
		int totalCount = CommonUtils.SPOT_TOTAL_COUNT;		
		
		// 페이지가 null이 아닐때 실행
		if(svo.getCurPage() != null) {
			// parseInt : 문자열 숫자로 변환
			curPage = Integer.parseInt(svo.getCurPage());
			
		}
		
		// 메모리에 올림
		svo.setPageSize(String.valueOf(pageSize));;
		svo.setGroupSize(String.valueOf(groupSize));
		svo.setCurPage(String.valueOf(curPage));
		svo.setTotalCount(String.valueOf(totalCount));
		
		logger.info("spot_IsudSelectAll svo.setPageSize() >>> : " + svo.getPageSize());
		logger.info("spot_IsudSelectAll svo.getGroupSize() >>> : " + svo.getGroupSize());
		logger.info("spot_IsudSelectAll svo.getCurPage() >>> : " + svo.getCurPage());
		logger.info("spot_IsudSelectAll svo.getTotalCount() >>> : " + svo.getTotalCount());
		
		
		// 서비스 호출
		List<SpotVO> listAll = spotService.spot_IsudSelectAll(svo);
		if(listAll.size() > 0) {
			logger.info("spot_IsudSelectAll listAll.size() >>> : " + listAll.size());
			
			model.addAttribute("pagingSVO", svo);
			model.addAttribute("listAll", listAll);
			
			return "spot/spot_IsudSelectAll";
		}
			
		return "spot/spot_IsudForm";
	}		
	
	// 여행지 조회
	@GetMapping("spot/spot_IsudSelect")
	public String spot_IsudSelect(SpotVO svo, Model model) {
		logger.info("SpotController spot_IsudSelect 진입 >>> : ");
		logger.info("spot_IsudSelect 함수 진입 obvo.getTripnum() >>> : " + svo.getTripnum());
		
		// 서비스 호출
		List<SpotVO> listS = spotService.spot_IsudSelect(svo);
		
		if(listS.size() == 1) {
			logger.info("spot_IsudSelect listS.size() >>> : " + listS.size());
			
			// 조회수 업데이트
			int spotCnt = spotService.spot_IsudSpothit(svo);
			logger.info("spot_IsudSelect spotCnt >>> : " + spotCnt);
			
			model.addAttribute("listS", listS);
			
			return "spot/spot_IsudSelect";
		}
		return "spot/spot_IsudSelectAll";
	}
	
	
	// 여행지 수정
	@GetMapping("spot/spot_IsudUpdate")
	public String spot_IsudUpdate(SpotVO svo, Model model) {
		logger.info("SpotController spot_IsudUpdate 진입 >>> : ");
		logger.info("spot_IsudUpdate 함수 진입 obvo.getTripnum() >>> : " + svo.getTripnum());
		
		int nCnt = spotService.spot_IsudUpdate(svo);
		
		if (nCnt > 0) {
			logger.info("spot_IsudUpdate nCnt >>> : " + nCnt);
			
			return "spot/spot_IsudUpdate";
		}
		return "spot/spot_IsudSelectAll";
	}
	
	// 여행지 삭제
	@GetMapping("spot/spot_IsudDelete")
	public String spot_IsudDelete(SpotVO svo, Model model) {
		logger.info("SpotController spot_IsudDelete 진입 >>> : ");
		logger.info("spot_IsudDelete 함수 진입 svo.getTripnum() >>> : " + svo.getTripnum()); 
		
		int nCnt = spotService.spot_IsudDelete(svo); 
		
		if (nCnt > 0) {
			logger.info("spot_IsudDelete nCnt >>> : " + nCnt);
			
			return "spot/spot_IsudDelete";
		}
		return "spot/spot_IsudSelectAll";
	}	
	
	// 상세정보
    @GetMapping("spot/pot_detail/{contentid}")
	//@GetMapping("spot_detail")
	public String spot_detail() {
		logger.info("SpotController spot_detail 진입 >>> : ");
		
		return "spot/spot_detail";
	}	
}
