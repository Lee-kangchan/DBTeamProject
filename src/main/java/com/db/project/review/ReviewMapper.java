package com.db.project.review;

import java.util.HashMap;
import java.util.List;

public interface ReviewMapper {

    public List<HashMap<String, Object>> selectMainReview();
    public List<HashMap<String, Object>> selectReviewMain();
    public HashMap<String, Object> selectReviewScore(HashMap<String, Object> HashMap);
    public HashMap<String, Object> selectReviewCount(HashMap<String, Object> HashMap);
    public HashMap<String, Object> selectReviewContent(HashMap<String, Object> HashMap);
    public void insertReview(HashMap<String, Object> HashMap);
    public List<HashMap<String, Object>> myReview(HashMap<String, Object> HashMap);
    public void deleteReview(HashMap<String, Object> HashMap);


}
