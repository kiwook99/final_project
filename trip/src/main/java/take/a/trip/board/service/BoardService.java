package take.a.trip.board.service;

import java.util.List;

import take.a.trip.board.vo.BoardVO;

public interface BoardService {
	
	public int boardInsert(BoardVO bvo);
	//페이징 호출을 위해 BoardVO bvo 매개변수 추가 입력
	public List boardSelectAll(BoardVO bvo);
	public List boardSelect(BoardVO bvo);
	
	// 검색 서비스 
	public List boardSearchSelect(BoardVO bvo);
}
