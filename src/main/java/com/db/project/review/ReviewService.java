package com.db.project.review;

import java.util.HashMap;
import java.util.List;

public interface ReviewService {
    public List<HashMap<String, Object>> selectMainReview();
    public List<HashMap<String, Object>> selectReviewMain();
    public List<HashMap<String, Object>> myReview(HashMap<String, Object> HashMap);
    public void deleteReview(HashMap<String, Object> HashMap);
    public List<HashMap<String, Object>> selectReviewContent(HashMap<String, Object> HashMap);
}
