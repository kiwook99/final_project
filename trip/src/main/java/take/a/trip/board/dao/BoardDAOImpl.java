package take.a.trip.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import take.a.trip.board.vo.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	Logger logger = LogManager.getLogger(BoardDAOImpl.class);
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	//[Insert]
	@Override
	public int boardInsert(BoardVO bvo) {
		// TODO Auto-generated method stub
		logger.info("BoardDAOImpl ::: boardInsert 함수 진입 >> :");
		
		return (Integer)sqlSession.insert("Insert", bvo);
	}
	
	//[SelectAll 전체조회]
	@Override
	//페이징 호출을 위해 boardSelectAll()함수에  BoardVO bvo 매개변수 추가 입력
	public List boardSelectAll(BoardVO bvo) {
		// TODO Auto-generated method stub
		
		logger.info("BoardDAOImpl ::: boardSelectAll 함수 진입 >> :");
		//페이징 호출을 위해 bvo 매개변수 추가 입력
		return sqlSession.selectList("boardSelectAll", bvo);
	}

	//[Select 조건조회]
	@Override
	public List boardSelect(BoardVO bvo) {
		// TODO Auto-generated method stub
		
		logger.info("BoardDAOImpl ::: boardSelect 함수 진입  >> :");
		
		return sqlSession.selectList("boardSelect", bvo);
	}

	//[검색 조건조회]
	@Override
	public List boardSearchSelect(BoardVO bvo) {
		// TODO Auto-generated method stub

		logger.info("BoardDAOImpl ::: boardSearchSelect 함수 진입  >> :");
		
		return sqlSession.selectList("boardSearchSelect", bvo);
	}

}
