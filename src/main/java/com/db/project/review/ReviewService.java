package com.db.project.review;

import java.util.HashMap;
import java.util.List;

public interface ReviewService {
    public List<HashMap<String, Object>> selectMainReview();
    public List<HashMap<String, Object>> selectReviewMain();
}
