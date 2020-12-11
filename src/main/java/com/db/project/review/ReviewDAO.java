package com.db.project.review;

import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class ReviewDAO {

    ReviewMapper mapper;
    SqlSession sqlSession;

    public ReviewDAO(SqlSession sqlSession){
        this.sqlSession =sqlSession;
        mapper = sqlSession.getMapper(ReviewMapper.class);
    }

    public List<HashMap<String, Object>> selectMainReview(){return mapper.selectMainReview();}
    public List<HashMap<String, Object>> selectReviewMain(){return mapper.selectReviewMain();}
    public HashMap<String, Object> selectReviewScore(HashMap<String, Object> HashMap){return mapper.selectReviewScore(HashMap);}
    public HashMap<String, Object> selectReviewCount(HashMap<String, Object> HashMap){return mapper.selectReviewCount(HashMap);}
    public List<HashMap<String, Object>> selectReviewContent(HashMap<String, Object> HashMap){return mapper.selectReviewContent(HashMap);}
    public void insertReview(HashMap<String, Object> HashMap){mapper.insertReview(HashMap);}
    public List<HashMap<String, Object>> myReview(HashMap<String, Object> HashMap) {return mapper.myReview(HashMap);}
    public void deleteReview(HashMap<String, Object> HashMap){mapper.deleteReview(HashMap);}

    public void insertCurrentReview(HashMap<String, Object> map){
        mapper.insertCurrentReview(map);
    }
    ;
    public List<HashMap<String, Object>> selectCurrentReview(HashMap<String , Object> map){
        return mapper.selectCurrentReview(map);
    }
    public Integer selectMaxReview(){
        return mapper.selectMaxReview();
    }
}
