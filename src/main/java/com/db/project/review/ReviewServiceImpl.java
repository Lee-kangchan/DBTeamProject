package com.db.project.review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    SqlSession sqlSession;
    @Override
    public List<HashMap<String, Object>> selectMainReview() {
        ReviewDAO reviewDAO = new ReviewDAO(sqlSession);

        return reviewDAO.selectMainReview();
    }

    @Override
    public List<HashMap<String, Object>> selectReviewMain() {
        ReviewDAO reviewDAO = new ReviewDAO(sqlSession);

        return reviewDAO.selectReviewMain();
    }


}
