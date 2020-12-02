package com.db.project.promotion;

import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class PromotionDAO {
    PromotionMapper mapper;
    SqlSession sqlSession;

    public PromotionDAO(SqlSession sqlSession){
        this.sqlSession = sqlSession;
        mapper = sqlSession.getMapper(PromotionMapper.class);
    }
    public List<HashMap<String, Object>> selectProcessPromotion(HashMap<String,Object> HashMap){
        return mapper.selectProcessPromotion(HashMap);
    }
    public List<HashMap<String, Object>> selectPromotion(){
        return mapper.selectPromotion();
    }
    public HashMap<String, Object> selectDetailPromotion(HashMap<String, Object> HashMap){
        return mapper.selectDetailPromotion(HashMap);
    }
    public void insertPromotion(HashMap<String, Object> HashMap){
        mapper.insertPromotion(HashMap);
    }
}
