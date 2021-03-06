package com.db.project.matching;

import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class MatchingDAO {
    MatchingMapper mapper;
    SqlSession sqlSession;

    public  MatchingDAO(SqlSession sqlSession){
        this.sqlSession = sqlSession;
        mapper = sqlSession.getMapper(MatchingMapper.class);
    }
    public void insertMatching(HashMap<String, Object> HashMap){
        mapper.insertMatching(HashMap);
    }
    public List<HashMap<String, Object>> selectRentalMatching(HashMap<String, Object> HashMap){
        return mapper.selectRentalMatching(HashMap);
    }
    public List<HashMap<String, Object>> selectBorrowMatching(HashMap<String, Object> HashMap){
        return mapper.selectBorrowMatching(HashMap);
    }
    public void updateRentalMatching(HashMap<String, Object> HashMap){
        mapper.updateRentalMatching(HashMap);
    }
    public void updateBorrowMatching(HashMap<String, Object> HashMap){
        mapper.updateBorrowMatching(HashMap);
    }
    public HashMap<String, Object> selectMatchingState(HashMap<String, Object> HashMap){
        return mapper.selectMatchingState(HashMap);
    }
    public void updateTypeMatching(HashMap<String, Object> HashMap){
        mapper.updateTypeMatching(HashMap);
    }
    public void updateMatchingReset(HashMap<String, Object> HashMap){
        mapper.updateMatchingReset(HashMap);
    }

    public List<HashMap<String, Object>> selectReservation(HashMap<String, Object> HashMap) {return mapper.selectReservation(HashMap);}
    public List<HashMap<String, Object>> selectRank(HashMap<String, Object> HashMap) {return mapper.selectRank(HashMap);}
    public void updateMatchingDate(HashMap<String, Object> map){
        mapper.updateMatchingDate(map);
    }
    public List<HashMap<String , Object>> selectMatchingList(){
        return mapper.selectMatchingList();
    }

}
