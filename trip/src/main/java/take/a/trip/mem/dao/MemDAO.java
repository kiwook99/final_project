package take.a.trip.mem.dao;

import java.util.List;

import take.a.trip.mem.vo.MemVO;

public interface MemDAO {
	public List<MemVO> memLogin(MemVO mvo);
	public List<MemVO> memIdSearch(MemVO mvo);
	public int memInsert(MemVO mvo);
    public int memPwSearch(MemVO mvo);

    public List<MemVO> idCheck(MemVO mvo);

}