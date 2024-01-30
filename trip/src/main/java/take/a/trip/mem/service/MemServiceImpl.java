package take.a.trip.mem.service;

import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import take.a.trip.mem.dao.MemDAO;
import take.a.trip.mem.vo.MemVO;

@Service
@Transactional
public class MemServiceImpl implements MemService {
    Logger logger = LogManager.getLogger(MemServiceImpl.class);

    @Autowired
    private MemDAO memDAO;

    public List<MemVO> memLogin(MemVO mvo) {
        return memDAO.memLogin(mvo);
    }

    public int memInsert(MemVO mvo) {
        return memDAO.memInsert(mvo);
    }
}