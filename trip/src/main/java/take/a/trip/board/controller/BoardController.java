package take.a.trip.board.controller;

import java.io.IOException;
import java.util.List;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

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
import take.a.trip.board.common.BoardCommonUtils;
import take.a.trip.board.common.BoardFileRename;
import take.a.trip.board.service.BoardService;
import take.a.trip.board.vo.BoardVO;

@Controller
public class BoardController {
	Logger logger = LogManager.getLogger(BoardController.class);
	
	//컨트롤러에서 서비스 연결
	//sql 연결과정
	@Autowired(required=false)
	private BoardService boardService;
	
	//[Insert 데이터입력]
	//입력 폼 호출하기
	@GetMapping("board/boardInsertForm")
	public String boardInsertForm(@RequestParam("memnum") String memnum, Model model) {
		logger.info("boardInsertForm 함수 진입>> : " + memnum);
		
		model.addAttribute("memnum", memnum);
		
		return "board/boardInsertForm";
	}
	
	//[SelectAll 전체조회]
	@GetMapping("board/boardSelectAll")
	//함수()페이징 호출을위한 매개변수 BoardVO bvo 입력
	public String boardSelectAll(BoardVO bvo, Model model) {
		logger.info("BoardController ::: boardSelectAll함수 진입 >> : ");
		
		// 페이징 처리 ====================================================================
		int pageSize = BoardCommonUtils.BOARD_PAGE_SIZE;
		int groupSize = BoardCommonUtils.BOARD_GROUP_SIZE;
		int curPage = BoardCommonUtils.BOARD_CUR_PAGE;
		int totalCount = BoardCommonUtils.BOARD_TOTAL_COUNT;
		
		if (bvo.getCurPage() !=null){
			curPage = Integer.parseInt(bvo.getCurPage());
		}
		
		bvo.setPageSize(String.valueOf(pageSize));
		bvo.setGroupSize(String.valueOf(groupSize));
		bvo.setCurPage(String.valueOf(curPage));
		bvo.setTotalCount(String.valueOf(totalCount));

		logger.info("BoardController bvo.getPageSize() >>> : 	" + bvo.getPageSize());
		logger.info("BoardController bvo.getGroupSize() >>> : 	" + bvo.getGroupSize());
		logger.info("BoardController bvo.getCurPage() >>> : 	" + bvo.getCurPage());
		logger.info("BoardController bvo.getTotalCount() >>> : " + bvo.getTotalCount());
		// 페이징 처리 ======================================================================================		
		
		//서비스를 연결하여 참조변수 ListAll로 호출한다
		//페이징을 위한 참조변수bvo입력
		List<BoardVO> ListAll = boardService.boardSelectAll(bvo);
		int bCnt = ListAll.size();
		
		if (bCnt > 0){
			logger.info("BoardController boardSelectAll bCnt >> " + bCnt);
			//페이징을 위한 model.addAttribute("pagingBVO", bvo);입력
			model.addAttribute("pagingBVO", bvo);
			model.addAttribute("ListAll", ListAll);
			
			return "board/boardSelectAll";
		}
		
		return "board/boardInsertForm";
	}
	
	//파일 업로드
	@PostMapping("board/fileupload")
	public String fileupload(HttpServletRequest req) {
		logger.info("fileupload 함수 진입 >>> : ");	
		
		String filePath = BoardCommonUtils.FILE_UPLOAD_PATH;
		int imgfileSize = BoardCommonUtils.FILE_UPOAD_SIZE;		
		String encodeType = BoardCommonUtils.FILE_UPLOAD_ENCODE;
		
		try {
			MultipartRequest mr = new MultipartRequest(	req, 
														filePath,
													 imgfileSize,
													  encodeType,
								          new BoardFileRename());
			
		//2024-01-29
//		String boardnum;//게시판번호 fk
//		String memnum;//회원번호
//		String boardtitle;//게시글제목
//		String boardcoment;//게시글댓글	
		
//		String boardnum = mr.getParameter("boardnum");
		String memnum = mr.getParameter("memnum");//회원번호
		String boardtitle = mr.getParameter("boardtitle");;//게시글제목
		String boardcoment = mr.getParameter("boardcoment");;//게시글댓글
		
		
		//2024-01-23
		//문자열 참조변수에 매개변수(파일명)을 받은 getFilesystemName()함수
		//2024-01-29 참조변수 boardimage
		String boardimage= mr.getFilesystemName("boardimage");
//		String originalFileName= mr.getOriginalFileName("boardimage");
		logger.info("boardimage >> : " + boardimage);
//		logger.info("originalFileName >> : " + originalFileName);
		
		//VO의 setBoardimage()함수 호출 
		BoardVO bvd = new BoardVO();
//		bvd.setBoardnum(boardnum);
		bvd.setMemnum(memnum);
		bvd.setBoardtitle(boardtitle);
		bvd.setBoardcoment(boardcoment);
		bvd.setBoardimage(boardimage);
		
		//테이블에 파일이름 입력하기 시작
		//db연결을위한 코드 
		int nCnt = boardService.boardInsert(bvd);
		//--------------	
			
		} catch (IOException e) {
			logger.info("파일 업로드 중 에러가  >>> : " + e.getMessage());
		}											  
		return "board/boardInsert"; 
	}
	
	
	//[Select 조건조회]
	@GetMapping("board/boardSelect")
	public String boardSelect(HttpServletRequest req, BoardVO bvo, Model model) {
		logger.info("BoardController ::: boardSelect함수 진입 >> : ");
		
		String title = req.getParameter("boardtitle");
		BoardVO _bvo = new BoardVO();		
		_bvo.setBoardtitle(title);
		logger.info("BoardController boardSelect _bvo.getBoardtitle() >> " + _bvo.getBoardtitle());
		
		//서비스를연결하여 참조변수 listS를 통해 호출한다
		List<BoardVO> listS = boardService.boardSelect(_bvo);
		int bCnt = listS.size();
		
		if (bCnt > 0){
			logger.info("BoardController boardSelect bCnt >> " + bCnt);
			
			model.addAttribute("listS", listS);
			return "board/boardSelect";
		}	
		return "board/boardSelectAll";
	}
	
	//[Select 검색 조회]
	@GetMapping("board/boardSearchSelect")
	public String boardSearchSelect(BoardVO bvo, Model model) {
		logger.info("BoardController ::: boardSelect함수 진입 >> : ");
		logger.info("BoardController bvo.getSearchFilter() >>> : " + bvo.getSearchFilter());
		logger.info("BoardController bvo.getKeyword() >>> : " + bvo.getKeyword());
		
		
		// 페이징 처리 ====================================================================
		int pageSize = BoardCommonUtils.BOARD_PAGE_SIZE;
		int groupSize = BoardCommonUtils.BOARD_GROUP_SIZE;
		int curPage = BoardCommonUtils.BOARD_CUR_PAGE;
		int totalCount = BoardCommonUtils.BOARD_TOTAL_COUNT;
		
		if (bvo.getCurPage() !=null){
			curPage = Integer.parseInt(bvo.getCurPage());
		}
		
		bvo.setPageSize(String.valueOf(pageSize));
		bvo.setGroupSize(String.valueOf(groupSize));
		bvo.setCurPage(String.valueOf(curPage));
		bvo.setTotalCount(String.valueOf(totalCount));

		logger.info("BoardController bvo.getPageSize() >>> : 	" + bvo.getPageSize());
		logger.info("BoardController bvo.getGroupSize() >>> : 	" + bvo.getGroupSize());
		logger.info("BoardController bvo.getCurPage() >>> : 	" + bvo.getCurPage());
		logger.info("BoardController bvo.getTotalCount() >>> : " + bvo.getTotalCount());
		// 페이징 처리 ======================================================================================	
	
		//서비스를연결하여 참조변수 listS를 통해 호출한다
		List<BoardVO> ListAll = boardService.boardSearchSelect(bvo);
		int bCnt = ListAll.size();
		
		if (bCnt > 0){
			logger.info("BoardController boardSearchSelect bCnt >> " + bCnt);
			
			//페이징을 위한 model.addAttribute("pagingBVO", bvo);입력
			model.addAttribute("pagingBVO", bvo);
			model.addAttribute("ListAll", ListAll);
			return "board/boardSelectAll";
		}	
		return "board/boardSelectAll";
	}
}