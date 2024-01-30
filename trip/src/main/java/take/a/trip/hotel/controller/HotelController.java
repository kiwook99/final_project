package take.a.trip.hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile; // 최신
import com.oreilly.servlet.MultipartRequest;	// 구

import take.a.trip.hotel.service.HotelService;
import take.a.trip.hotel.util.CommonUtils;
import take.a.trip.hotel.vo.HotelVO;
import take.a.trip.hotel.controller.HotelController;
import take.a.trip.hotel.service.HotelService;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

@Controller
public class HotelController {
	
	Logger logger = LogManager.getLogger(HotelController.class);
	
	// 의존성 주입
	 @Autowired (required = false)
	 private HotelService hotelService;
	 
	 // 숙소페이지
	 @GetMapping("/hotel/hotel_main")
	 public String hotel(HotelVO hvo, Model model) {
		 logger.info("hotel 함수 진입");
		 
		 // 페이징
		 int pageSize = CommonUtils.HOTEL_PAGE_SIZE; 	// 한페이지의 값
		 int groupSize = CommonUtils.HOTEL_GROUP_SIZE;	// 그룹 값
		 int curPage = CommonUtils.HOTEL_CUR_PAGE;		// 현재페이지
		 int totalCount = CommonUtils.HOTEL_TOTAL_COUNT;
		 
		 if(hvo.getCurPage() != null) {
				// parseInt : 문자열 숫자로 변환
				curPage = Integer.parseInt(hvo.getCurPage());
			}
		 
		 hvo.setPageSize(String.valueOf(pageSize));;
		 hvo.setGroupSize(String.valueOf(groupSize));
		 hvo.setCurPage(String.valueOf(curPage));
		 hvo.setTotalCount(String.valueOf(totalCount));
		
		 logger.info("spot_IsudSelectAll svo.setPageSize() >>> : " + hvo.getPageSize());
		 logger.info("spot_IsudSelectAll svo.getGroupSize() >>> : " + hvo.getGroupSize());
		 logger.info("spot_IsudSelectAll svo.getCurPage() >>> : " + hvo.getCurPage());
		 logger.info("spot_IsudSelectAll svo.getTotalCount() >>> : " + hvo.getTotalCount());
		 
		 // 서비스 호출
		 List<HotelVO> listAll = hotelService.hotel_main(hvo);
		 if (listAll.size()>0) {
			 logger.info("hotel listAll.size() => "+listAll.size());
			 
			 model.addAttribute("listAll",listAll);
			 model.addAttribute("pagingHVO",hvo);
			 return "hotel/hotel_main";
			 
		 }
		 
		 return "hotel/hotel_insert";
	 }
	 
	 // 지역별 검색
	 @GetMapping("hotel/hotelSearch")
	 public String hotelSearch(HotelVO hvo, Model model) {
		 logger.info("hotelSearch hvo.getSerachFilter()=> "+ hvo.getSearchFilter());
		 logger.info("hotelSearch hvo.getKeyword()=> "+ hvo.getKeyword());
		 
		 List<HotelVO> searchList = hotelService.hotelSearch(hvo);
		 
		 int nCnt = searchList.size();
		 
		 if (nCnt>0) {
			 logger.info("hotelSearch nCnt = "+nCnt);
			 
			 model.addAttribute("listAll",searchList);
			 
			 return "hotel/hotel_main";
		 }
		 return "hotel/hotel_main";
	 }
	 

}
