package com.db.project.matching;

import java.util.List;
import java.util.HashMap;

public interface MatchingMapper {
    public void insertMatching(HashMap<String, Object> HashMap);
    public List<HashMap<String, Object>> selectRentalMatching(HashMap<String, Object> HashMap);
    public List<HashMap<String, Object>> selectBorrowMatching(HashMap<String, Object> HashMap);
    public void updateRentalMatching(HashMap<String, Object> HashMap);
    public void updateBorrowMatching(HashMap<String, Object> HashMap);
    public HashMap<String,Object> selectMatchingState(HashMap<String, Object> HashMap);
    public void updateTypeMatching(HashMap<String, Object> HashMap);
    public void updateMatchingReset(HashMap<String, Object> HashMap);
}
