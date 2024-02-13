package take.a.trip.review.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile; // 최신
import com.oreilly.servlet.MultipartRequest;	// 구

import take.a.trip.review.service.ReviewServiceImpl;
import take.a.trip.review.vo.ReviewVO;

@Controller
public class ReviewController {
	Logger logger = LogManager.getLogger(ReviewController.class);
	
	// 컨트롤러에서 댓글 서비스 연결 
	@Autowired(required=false)
	private ReviewServiceImpl reviewService;
	
	// 댓글 글쓰기 폼
	@PostMapping("review/reviewForm")
	public String reviewForm() {
		logger.info("reviewForm 함수 진입 >>> : ");
		
		return "board/reviewForm";
	}
	
	// 댓글 등록
	@PostMapping("review/reviewInsert")
	@ResponseBody
	public String reviewInsert(ReviewVO rvo) {	
		logger.info("reviewInsert >>> : ");
		logger.info("reviewInsert rvo.getMemnum() >>> : " + rvo.getMemnum());
							
		logger.info("rvo.getMemnum() >>> : " + rvo.getMemnum());
		logger.info("rvo.getTripnum() >>> : " + rvo.getTripnum());
		logger.info("rvo.getReviewcoment() >>> : " + rvo.getReviewcoment());		
		
		int nCnt = reviewService.reviewInsert(rvo);
		logger.info("reviewInsert nCnt >>> : " + nCnt);
		
		if (1 == nCnt) { return "GOOD"; }
		else { return "BAD"; }
	}
	
	// 댓글 전체 조회	
	@PostMapping("review/reviewSelectAll")
	@ResponseBody
	public String reviewSelectAll(ReviewVO rvo) {	
		logger.info("reviewSelectAll >>> : ");

		logger.info("reviewSelectAll rvo.getMemnum() >>> : " +rvo.getMemnum());
		
		List<ReviewVO> list  = reviewService.reviewSelectAll(rvo);
		logger.info("reviewSelectAll list >>> : " + list);
		
		String ss = "";
		String listStr = "";
		for (int i=0; i < list.size(); i++) {
			ReviewVO _rvo = list.get(i);
			String s0 = _rvo.getReviewnum();
			String s1 = _rvo.getTripnum();
			String s2 = _rvo.getReviewcoment();
			String s3 = _rvo.getInsertdate();
			
			try {
				ss = 	s0+","
						//+s1+","
						//+s2+","
					    + URLEncoder.encode(s1, "UTF-8") + ","
					    + URLEncoder.encode(s2, "UTF-8") + ","
						+s3;
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			listStr += ss+"&";
			logger.info("listStr >>> : " + listStr);
		}
		return listStr;
	}
	
	// 댓글 삭제	
	@PostMapping("review/reviewDelete")
	@ResponseBody
	public String reviewDelete(ReviewVO rvo) {	
		logger.info("reviewDelete >>> : ");
		logger.info("reviewDelete rvo.getMemnum() >>> : " + rvo.getMemnum());
	
		int nCnt  = reviewService.reviewDelete(rvo);
		logger.info("reviewDelete nCnt >>> : " + nCnt);
		
		if (1 == nCnt) { return "GOOD"; }
		else { return "BAD"; }
	}
}
