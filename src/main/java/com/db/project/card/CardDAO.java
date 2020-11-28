package com.db.project.card;

import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class CardDAO {
    CardMapper mapper;
    SqlSession sqlSession;

    public CardDAO(SqlSession sqlSession){
        this.sqlSession = sqlSession;
        mapper = sqlSession.getMapper(CardMapper.class);
    }
    public void insertCard(HashMap<String, Object> HashMap){
        mapper.insertCard(HashMap);
    }
    public List<HashMap<String, Object>> selectCard(HashMap<String, Object> HashMap){
        return mapper.selectCard(HashMap);
    }
    public void deleteCard(HashMap<String, Object> HashMap){
        mapper.deleteCard(HashMap);
    }
    public void updateCustomerPlusPoint(HashMap<String, Object> HashMap){
        mapper.updateCustomerPlusPoint(HashMap);
    }
    public void updateCustomerMinusPoint(HashMap<String, Object> HashMap){
        mapper.updateCustomerMinusPoint(HashMap);
    }
    public void insertApproval(HashMap<String, Object> HashMap){
        mapper.insertApproval(HashMap);
    }
    public List<HashMap<String, Object>> selectApproval(HashMap<String, Object> HashMap){
        return mapper.selectApproval(HashMap);
    }
    public void insertSales(HashMap<String, Object> HashMap){
        mapper.insertSales(HashMap);
    }
    public List<HashMap<String, Object>> selectSales(HashMap<String, Object> HashMap){
        return  mapper.selectSales(HashMap);
    }
}
