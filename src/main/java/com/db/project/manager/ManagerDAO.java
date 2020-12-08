package com.db.project.manager;

import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class ManagerDAO {

    SqlSession sqlSession;
    ManagerMapper mapper;
    public ManagerDAO(SqlSession sqlSession){
        this. sqlSession = sqlSession;
        mapper = sqlSession.getMapper(ManagerMapper.class);
    }

    public List<HashMap<String, Object>> selectManagerBook(){
        return mapper.selectManagerBook();
    }
    public List<HashMap<String, Object>> selectManagerPromotion(){
        return mapper.selectManagerPromotion();
    }
    public List<HashMap<String, Object>> selectManagerCustomerReport(){
        return  mapper.selectManagerCustomerReport();
    }
    public List<HashMap<String, Object>> selectManagerReviewReport(){
        return mapper.selectManagerReviewReport();
    }
}
