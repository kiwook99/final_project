package take.a.trip.board.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import take.a.trip.board.dao.BoardDAO;
import take.a.trip.board.vo.BoardVO;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {
	Logger logger = LogManager.getLogger(BoardServiceImpl.class);
	
	//서비스에서 DAO연결
	// 서비스에서  @Autowired 어노테이션으로  DI (의존성 주입하기)
	@Autowired(required=false)
	public BoardDAO boardDAO;
//	두 개 는 필요없다	
	//서비스에서  @Autowired 어노테이션으로  DI (의존성 주입하기)
	@Autowired(required=false)
	public BoardServiceImpl(BoardDAO boardDAO) {
		this.boardDAO = boardDAO;
	}
	
	//[Insert 데이터 입력]
	@Override
	public int boardInsert(BoardVO bvo) {
		// TODO Auto-generated method stub
		Logger logger = LogManager.getLogger("BoardServiceImpl ::: boardInsert 함수 진입  >> : ");
		
		//dao연결
		return boardDAO.boardInsert(bvo);
	}
	
	//[SelectAll 전체조회]
	@Override
	//페이징 호출을 위해 SelectAll()함수에  BoardVO bvo 매개변수 추가
	public List boardSelectAll(BoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("BoardServiceImpl ::: boardSelectAll 함수 진입  >> : ");
		
		//dao연결
		//페이징 호출위한  bvo참조변수입력
		return boardDAO.boardSelectAll(bvo);
	}
	
	//[Select 조건조회]
	@Override
	public List boardSelect(BoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("boardSelect 함수진입 ::: boardSelect 함수 진입 >> : ");
		//dao연결
		return boardDAO.boardSelect(bvo);
	}
	
	//[조건조회 검색]
	@Override
	public List boardSearchSelect(BoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("boardSearchSelect 함수진입 ::: boardSearchSelect 함수 진입 >> : ");
		//dao연결
		return boardDAO.boardSearchSelect(bvo);
	}
}
