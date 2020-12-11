package com.db.project.matching;

import java.util.HashMap;
import java.util.List;

public interface MatchingService {
    public void insertMatching(HashMap<String, Object> HashMap);
    public List<HashMap<String, Object>> selectRentalMatching(HashMap<String, Object> HashMap);
    public List<HashMap<String, Object>> selectBorrowMatching(HashMap<String, Object> HashMap);
    public void updateRentalMatching(HashMap<String, Object> HashMap);
    public void updateBorrowMatching(HashMap<String, Object> HashMap);
    public List<HashMap<String, Object>> selectMyReservation(HashMap<String, Object> HashMap);
    public void updateCancelMatching(HashMap<String , Object> map);
    public List<HashMap<String , Object>> matchingList();

}
