package com.db.project.promotion;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class PromotionServiceImpl implements PromotionService{

    @Autowired
    SqlSession sqlSession;

    @Override
    public List<HashMap<String, Object>> selectProcessPromotion(HashMap<String, Object> HashMap) {
        PromotionDAO promotionDAO = new PromotionDAO(sqlSession);
        return promotionDAO.selectProcessPromotion(HashMap);
    }

    @Override
    public List<HashMap<String, Object>> selectPromotion() {
        PromotionDAO promotionDAO = new PromotionDAO(sqlSession);
        return promotionDAO.selectPromotion();
    }

    @Override
    public HashMap<String, Object> selectDetailPromotion(HashMap<String, Object> HashMap) {
        PromotionDAO promotionDAO = new PromotionDAO(sqlSession);
        return promotionDAO.selectDetailPromotion(HashMap);
    }

    @Override
    public void insertPromotion(HashMap<String, Object> HashMap) {
        PromotionDAO promotionDAO = new PromotionDAO(sqlSession);
        promotionDAO.insertPromotion(HashMap);
    }
}
