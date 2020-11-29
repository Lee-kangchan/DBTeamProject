package com.db.project.review;

import java.util.HashMap;

public interface ReviewMapper {

    public HashMap<String, Object> selectMainReview(HashMap<String, Object> HashMap);
    public HashMap<String, Object> selectReviewMain(HashMap<String, Object> HashMap);
    public HashMap<String, Object> selectReviewScore(HashMap<String, Object> HashMap);
    public HashMap<String, Object> selectReviewCount(HashMap<String, Object> HashMap);
    public HashMap<String, Object> selectReviewContent(HashMap<String, Object> HashMap);
    public void insertReview(HashMap<String, Object> HashMap);


}
