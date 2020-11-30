package com.db.project.matching;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class MatchingServiceImpl implements MatchingService {
    @Autowired
    SqlSession sqlSession;
    @Override
    public void insertMatching(HashMap<String, Object> HashMap) {
        MatchingDAO matchingDAO = new MatchingDAO(sqlSession);
        matchingDAO.insertMatching(HashMap);
    }

    @Override
    public List<HashMap<String, Object>> selectRentalMatching(HashMap<String, Object> HashMap) {
        MatchingDAO matchingDAO = new MatchingDAO(sqlSession);
        return matchingDAO.selectRentalMatching(HashMap);
    }

    @Override
    public List<HashMap<String, Object>> selectBorrowMatching(HashMap<String, Object> HashMap) {
        MatchingDAO matchingDAO = new MatchingDAO(sqlSession);
        return matchingDAO.selectBorrowMatching(HashMap);
    }

    @Override
    public void updateRentalMatching(HashMap<String, Object> HashMap) {
        MatchingDAO matchingDAO = new MatchingDAO(sqlSession);
        matchingDAO.updateRentalMatching(HashMap);
        HashMap<String, Object> map = matchingDAO.selectMatchingState(HashMap);
        if(map.get("matching_borrow_yn").toString().equals("1") && map.get("matching_rental_yn").toString().equals("1")){
            if(map.get("matching_type").equals("거래완료")){
                map.put("matching_type","대여");
            }else if(map.get("matching_type").equals("대여")){
                map.put("matching_type","반납");
            }
            matchingDAO.updateTypeMatching(map);
            matchingDAO.updateMatchingReset(map);
        }
    }

    @Override
    public void updateBorrowMatching(HashMap<String, Object> HashMap) {
        MatchingDAO matchingDAO = new MatchingDAO(sqlSession);
        matchingDAO.updateBorrowMatching(HashMap);
        HashMap<String, Object> map = matchingDAO.selectMatchingState(HashMap);
        if(map.get("matching_borrow_yn").toString().equals("1") && map.get("matching_rental_yn").toString().equals("1")){
            if(map.get("matching_type").equals("거래완료")){
                map.put("matching_type","대여");
            }else if(map.get("matching_type").equals("대여")){
                map.put("matching_type","반납");
            }
            matchingDAO.updateTypeMatching(map);
            matchingDAO.updateMatchingReset(map);
        }
    }
}
