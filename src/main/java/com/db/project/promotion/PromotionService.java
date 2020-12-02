package com.db.project.promotion;

import java.util.HashMap;
import java.util.List;

public interface PromotionService {

    public List<HashMap<String, Object>> selectProcessPromotion(HashMap<String,Object> HashMap);
    public List<HashMap<String, Object>> selectPromotion();
    public HashMap<String, Object> selectDetailPromotion(HashMap<String, Object> HashMap);
    public void insertPromotion(HashMap<String, Object> HashMap);
}
