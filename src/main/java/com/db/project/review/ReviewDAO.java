package com.db.project.review;

import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;

public class ReviewDAO {

    ReviewMapper mapper;
    SqlSession sqlSession;

    public ReviewDAO(SqlSession sqlSession){
        this.sqlSession =sqlSession;
        mapper = sqlSession.getMapper(ReviewMapper.class);
    }

    public HashMap<String, Object> selectMainReview(HashMap<String, Object> HashMap){return mapper.selectMainReview(HashMap);}
    public HashMap<String, Object> selectReviewMain(HashMap<String, Object> HashMap){return mapper.selectReviewMain(HashMap);}
    public HashMap<String, Object> selectReviewScore(HashMap<String, Object> HashMap){return mapper.selectReviewScore(HashMap);}
    public HashMap<String, Object> selectReviewCount(HashMap<String, Object> HashMap){return mapper.selectReviewCount(HashMap);}
    public HashMap<String, Object> selectReviewContent(HashMap<String, Object> HashMap){return mapper.selectReviewContent(HashMap);}
    public void insertReview(HashMap<String, Object> HashMap){mapper.insertReview(HashMap);}
}
