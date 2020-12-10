package com.db.project.book;

import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class BookDAO {
    BookMapper mapper;
    SqlSession sqlSession;

    public BookDAO(SqlSession sqlSession){
        this.sqlSession = sqlSession;
        mapper = sqlSession.getMapper(BookMapper.class);
    }
    public List<HashMap<String, Object>> selectBook(){
        return mapper.selectBook();
    }
    public List<HashMap<String, Object>> selectMainBook(){
        return mapper.selectMainBook();
    }
    public List<HashMap<String, Object>> selectNewBook(HashMap<String, Object> HashMap){
        return mapper.selectNewBook(HashMap);
    }
    public Integer selectBookIsbn(HashMap<String, Object> HashMap){
        return mapper.selectBookIsbn(HashMap);
    }
    public void insertBook(HashMap<String, Object> HashMap){
        mapper.insertBook(HashMap);
    }
    public void insertCustomerBook(HashMap<String, Object> HashMap){
        mapper.insertCustomerBook(HashMap);
    }
    public Integer selectCustomerBookSeq(){
        return mapper.selectCustomerBookSeq();
    }
    public void insertCustomerBookImage(HashMap<String, Object> HashMap){
        mapper.insertCustomerBookImage(HashMap);
    }
    public List<HashMap<String, Object>> selectCustomerBook(HashMap<String, Object> HashMap){
        return mapper.selectCustomerBook(HashMap);
    }
    public List<HashMap<String, Object>> selectCurrentBook(HashMap<String, Object> HashMap){
        return mapper.selectCurrentBook(HashMap);
    }
    public void deleteCustomerBook(HashMap<String, Object> HashMap){
        mapper.deleteCustomerBook(HashMap);
    }

    public HashMap<String , Object> selectDetailBook(HashMap<String, Object> map){
        return mapper.selectDetailBook(map);
    }
    public Integer selectBookReservation(HashMap<String, Object> map){
        return mapper.selectBookReservation(map);
    }
    public void insertBookReservation(HashMap<String, Object> map){
        mapper.insertBookReservation(map);
    }

    public HashMap<String, Object> reviewBook(HashMap<String, Object> map) {return mapper.reviewBook(map);}
    public List<HashMap<String , Object>> selectBookImage(HashMap<String, Object> map){
        return mapper.selectBookImage(map);
    }
    public void updateCustomerBookCertification(HashMap<String, Object> map ){
        mapper.updateCustomerBookCertification(map);
    }
}
