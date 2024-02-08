package take.a.trip.hotel.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile; // 최신
import com.oreilly.servlet.MultipartRequest;	// 구

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import take.a.trip.hotel.service.HotelService;
import take.a.trip.hotel.util.CommonUtils;
import take.a.trip.hotel.util.NumUtil;
import take.a.trip.hotel.vo.HotelVO;
import take.a.trip.order.vo.OrderVO;
import take.a.trip.spot.vo.SpotVO;
import take.a.trip.hotel.controller.HotelController;
import take.a.trip.hotel.service.HotelService;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

@Controller
public class HotelController {
	
	Logger logger = LogManager.getLogger(HotelController.class);
	
	// 의존성 주입
	 @Autowired (required = false)
	 private HotelService hotelService;
	 
	 @Autowired
	 private JedisPool jedisPool;
		
	 
	 // 숙소페이지
	 @GetMapping("/hotel/hotel_main")
	 public String hotel(HotelVO hvo, Model model, HttpServletRequest request) {
		 logger.info("hotel 함수 진입");
		 
		 HttpSession session = request.getSession();		// HttpServletRequest에서 세션을 가져오거나 새로 생성
		 String sessionId = session.getId(); 		// 세션에서 고유한 세션 아이디 가져오기
		 logger.info("spot_IsudSelectAll sessionId >>> : " + sessionId);
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
		
		 logger.info("spot_IsudSelectAll hvo.getPageSize() >>> : " + hvo.getPageSize());
		 logger.info("spot_IsudSelectAll hvo.getGroupSize() >>> : " + hvo.getGroupSize());
		 logger.info("spot_IsudSelectAll hvo.getCurPage() >>> : " + hvo.getCurPage());
		 logger.info("spot_IsudSelectAll hvo.getTotalCount() >>> : " + hvo.getTotalCount());
		 
		 // 서비스 호출
		 List<HotelVO> listAll = hotelService.hotel_main(hvo);
		 if (listAll.size()>0) {
			 logger.info("hotel listAll.size() => "+listAll.size());
			 
			 model.addAttribute("listAll",listAll);
			 model.addAttribute("pagingHVO",hvo);
			 
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
			 return "hotel/hotel_main";
			
		}
		 
		 return "hotel/hotel_insert";
	 }
	 
	 // 지역별 검색
	 @GetMapping("hotel/hotelSearch")
	 public String hotelSearch(HotelVO hvo, Model model) {
		 logger.info("hotelSearch hvo.getSerachFilter()=> "+ hvo.getSearchFilter());
		 logger.info("hotelSearch hvo.getKeyword()=> "+ hvo.getKeyword());
		 
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
		
		 logger.info("hotelSearch hvo.getPageSize() >>> : " + hvo.getPageSize());
		 logger.info("hotelSearch hvo.getGroupSize() >>> : " + hvo.getGroupSize());
		 logger.info("hotelSearch hvo.getCurPage() >>> : " + hvo.getCurPage());
		 logger.info("hotelSearch hvo.getTotalCount() >>> : " + hvo.getTotalCount());
		 
		 List<HotelVO> searchList = hotelService.hotelSearch(hvo);
		 
		 int nCnt = searchList.size();
		 
		 if (nCnt>0) {
			 logger.info("hotelSearch nCnt = "+nCnt);
			 
			 model.addAttribute("listAll",searchList);
			 model.addAttribute("pagingHVO",hvo);
			 
			 return "hotel/hotel_main";
		 }
		 
		 return "hotel/hotel_main";
	 }
	 
	 // 지역별 
	 @GetMapping("hotel/hotelSelect")
	 public String hotelSelect(HotelVO hvo, Model model, HttpServletRequest request) {		 
		 logger.info("hotelSelect 함수진입 ");
		 logger.info("hotelSelect hvo.getHotelnum()=> "+ hvo.getHotelnum());

		 HttpSession session = request.getSession();		// HttpServletRequest에서 세션을 가져오거나 새로 생성
		 String sessionId = session.getId(); 		// 세션에서 고유한 세션 아이디 가져오기
		 logger.info("spot_IsudSelectAll sessionId >>> : " + sessionId);

		 
		 List<HotelVO> selectList = hotelService.hotelSelect(hvo);
		 
		 int nCnt = selectList.size();
		 
		 if (nCnt>0) {
			 logger.info("hotelSelect nCnt = "+ nCnt);
			 
			 model.addAttribute("selectList",selectList);
			 
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
			 return "hotel/hotelSelect";
		 }
		 
		 return "hotel/hotel_main";
	 }
	 
	 	
	 	@PostMapping("hotel/hotelOrderForm")
	 	public String hotelOrderForm(Model model, HttpServletRequest req) {
	 	    logger.info("hotelOrderForm 함수 진입");

	 	    try {
	 	        // 한글 인코딩 설정
	 	        req.setCharacterEncoding("UTF-8");
	 	        
	 	        
	 	        // 여기서 필요한 값들을 가져와서 model에 추가
 	        	String hotelnum = req.getParameter("hotelnum");	
	 	        String hotelname = req.getParameter("hotelname");
	 	        String hotelprice = req.getParameter("hotelprice");
	 	        String hotelcheckin = req.getParameter("hotelcheckin");
	 	        String hotelcheckout = req.getParameter("hotelcheckout");
	 	      
	 	        model.addAttribute("hotelnum", hotelnum);
	 	        model.addAttribute("hotelname", hotelname);
	 	        model.addAttribute("hotelprice", hotelprice);
	 	        model.addAttribute("hotelcheckin", hotelcheckin);
	 	        model.addAttribute("hotelcheckout", hotelcheckout);
	 	   
	 	        
	 	       logger.info("hotelOrderForm hotelnum: " + hotelnum);
	 	       logger.info("hotelOrderForm hotelname: " + hotelname);
	 	       logger.info("hotelOrderForm hotelprice: " + hotelprice);
	 	       logger.info("hotelOrderForm hotelcheckin: " + hotelcheckin);
	 	       logger.info("hotelOrderForm hotelcheckout: " + hotelcheckout);

	 	        return "hotel/hotelOrderForm";
	 	    } catch (IOException e) {
	 	        e.printStackTrace(); // 예외 처리
	 	    }

	 	    return "hotel/hotelSelect";
	 	}

	 
		// 호텔 입력폼(ISUD)
		@GetMapping("hotel/hotelInsertForm")
		public String hotelInsertForm() {
			logger.info("hotelInsertForm 함수 진입");


			return "hotel/hotelInsertForm";
		}	
	 
		// 호텔 입력(ISUD)
		@PostMapping("hotel/hotelInsert")
		public String hotelInsert(HttpServletRequest req) {
			logger.info("hotelInsert 함수 진입 ");


			// 파일 업로드
			String filePath = CommonUtils.HOTEL_IMG_UPLOAD_PATH;
			int imgfileSize = CommonUtils.HOTEL_IMG_FILE_SIZE;
			String encodeType = CommonUtils.HOTEL_ENCODE;
			
			try {
				MultipartRequest mr = new MultipartRequest(req, filePath, imgfileSize, encodeType); 
				 
				HotelVO hvo = null;  
				hvo = new HotelVO(); 
			
				// 입력한 데이터 값 확인
				hvo.setRegionid(mr.getParameter("regionid"));
				hvo.setHotelname(mr.getParameter("hotelname"));
				hvo.setHoteltel(mr.getParameter("hoteltel"));
				hvo.setHotelprice(mr.getParameter("hotelprice"));
				hvo.setHotelimage(mr.getFilesystemName("hotelimage"));
				hvo.setHoteladress(mr.getParameter("hoteladress"));
				hvo.setHotelcoment(mr.getParameter("hotelcoment"));
				hvo.setHotelmapx(mr.getParameter("hotelmapx"));
				hvo.setHotelmapy(mr.getParameter("hotelmapy"));
				hvo.setHotelcheckin(mr.getParameter("hotelcheckin"));
				hvo.setHotelcheckout(mr.getParameter("hotelcheckout"));
				
				logger.info("hotelInsert hvo.getRegionid() >>> : " + hvo.getRegionid());
				logger.info("hotelInsert hvo.getHotelname() >>> : " + hvo.getHotelname());
				logger.info("hotelInsert hvo.getHoteltel() >>> : " + hvo.getHoteltel());
				logger.info("hotelInsert hvo.getHotelprice() >>> : " + hvo.getHotelprice());
				logger.info("hotelInsert hvo.getHotelimage() >>> : " + hvo.getHotelimage());
				logger.info("hotelInsert hvo.getHoteladress() >>> : " + hvo.getHoteladress());
				logger.info("hotelInsert hvo.getHotelcoment() >>> : " + hvo.getHotelcoment());
				logger.info("hotelInsert hvo.getHotelmapx() >>> : " + hvo.getHotelmapx());
				logger.info("hotelInsert hvo.getHotelmapy() >>> : " + hvo.getHotelmapy());
				logger.info("hotelInsert hvo.getHotelcheckin() >>> : " + hvo.getHotelcheckin());
				logger.info("hotelInsert hvo.getHotelcheckout() >>> : " + hvo.getHotelcheckout());
				
				// 서비스 호출
				int nCnt = hotelService.hotelInsert(hvo);
				
				if(nCnt > 0) {
					logger.info("nCnt >>> : " + nCnt);
					
					return "hotel/hotelInsert";		
				}
			} catch (IOException e) {
				logger.info("파일 업로드 중 에러 발생 >>> : " + e.getMessage());
			}
			return "hotel/hotelInsertForm";
		}
		
		// 숙소 입력폼(ISUD)
		@GetMapping("hotel/hotelUpdateForm")
		public String hotelUpdateForm(HotelVO hvo, Model model) {
			logger.info("hotelUpdateForm 함수 진입");

			List<HotelVO> updateList = hotelService.hotelUpdateForm(hvo);
			 
			 int nCnt = updateList.size();
			 
			 if (nCnt>0) {
				 logger.info("updateFormList nCnt = "+ nCnt);
				 
				 model.addAttribute("updateList",updateList);
				 
				 return "hotel/hotelUpdateForm";
			 }
			 
			 return "hotel/hotelSelect";
		 }
	
		// 호텔 수정(ISUD)
		@PostMapping("hotel/hotelUpdate")
		public String hotelUpdate(Model model, HttpServletRequest req) {
		    try {
		        logger.info("hotelUpdate 함수 진입 ");

		        // 한글 인코딩 설정
		        req.setCharacterEncoding("UTF-8");

		        HotelVO hvo = new HotelVO();
		        hvo.setHotelname(req.getParameter("hotelname"));
		        hvo.setHotelnum(req.getParameter("hotelnum"));
		        hvo.setHoteltel(req.getParameter("hoteltel"));
		        hvo.setHotelprice(req.getParameter("hotelprice"));
		        hvo.setHoteladress(req.getParameter("hoteladress"));
		        hvo.setHotelcheckin(req.getParameter("hotelcheckin"));
		        hvo.setHotelcheckout(req.getParameter("hotelcheckout"));
		        hvo.setHotelcoment(req.getParameter("hotelcoment"));
		        hvo.setHotelmapx(req.getParameter("hotelmapx"));
		        hvo.setHotelmapy(req.getParameter("hotelmapy"));

		        logger.info("hotelUpdate hvo.getHotelnum() >>> : " + hvo.getHotelnum());
		        logger.info("hotelUpdate hvo.getHotelname() >>> : " + hvo.getHotelname());
		        logger.info("hotelUpdate hvo.getHoteltel() >>> : " + hvo.getHoteltel());
		        logger.info("hotelUpdate hvo.getHotelprice() >>> : " + hvo.getHotelprice());
		        logger.info("hotelUpdate hvo.getHoteladress() >>> : " + hvo.getHoteladress());
		        logger.info("hotelUpdate hvo.getHotelcoment() >>> : " + hvo.getHotelcoment());
		        logger.info("hotelUpdate hvo.getHotelcheckin() >>> : " + hvo.getHotelcheckin());
		        logger.info("hotelUpdate hvo.getHotelcheckout() >>> : " + hvo.getHotelcheckout());
		        logger.info("hotelUpdate hvo.getHotelcheckin() >>> : " + hvo.getHotelmapx());
		        logger.info("hotelUpdate hvo.getHotelcheckout() >>> : " + hvo.getHotelmapy());

		        // 서비스 호출
		        int nCnt = hotelService.hotelUpdate(hvo);

		        if (nCnt > 0) {
		            logger.info("nCnt >>> : " + nCnt);
		            return "redirect:/hotel/hotelSelect?hotelnum=" + hvo.getHotelnum();
		        }
		    } catch (IOException e) {
		        e.printStackTrace(); // 예외 처리
		    }

		    return "hotel/hotel_main";
		}
		
		// 숙소 삭제
		@GetMapping("hotel/hotelDelete")
		public String hotelDelete(HotelVO hvo, Model model) {
			logger.info("hotelDelete 함수 진입 ");
			logger.info("hvo.getHotelnum() >>> : " + hvo.getHotelnum()); 
			
			int nCnt = hotelService.hotelDelete(hvo); 
			
			if (nCnt > 0) {
				logger.info("hotelDelete nCnt : " + nCnt);
				
				return "hotel/hotelDelete";
			}
			return "hotel/hotel_main";
		}	
		
		//호텔 리뷰
		@GetMapping("hotel/hotelReview")
		public String hotelReview() {
			logger.info("hotelReview 함수 진입 ");

			return "hotel/hotelReview";
		}	
	}
