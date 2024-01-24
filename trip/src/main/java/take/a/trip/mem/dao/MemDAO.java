package take.a.trip.mem.dao;

import java.util.List;

import take.a.trip.mem.vo.MemVO;

public interface MemDAO {
	public List<MemVO> memLogin(MemVO mvo);
}
