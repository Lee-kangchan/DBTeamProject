package com.db.project.promotion;

import java.util.List;
import java.util.HashMap;

public interface PromotionMapper {

    public List<HashMap<String, Object>> selectProcessPromotion(HashMap<String,Object> HashMap);
    public List<HashMap<String, Object>> selectPromotion(HashMap<String, Object> HashMap);
    public HashMap<String, Object> selectDetailPromotion(HashMap<String, Object> HashMap);
    public void insertPromotion(HashMap<String, Object> HashMap);
}
