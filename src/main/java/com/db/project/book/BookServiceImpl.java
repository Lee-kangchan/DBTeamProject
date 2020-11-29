package com.db.project.book;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    SqlSession sqlSession;
    public List<HashMap<String, Object>> selectBook(){
        BookDAO dao = new BookDAO(sqlSession);
        return dao.selectBook();
    }
    @Override
    public List<HashMap<String, Object>> selectNewBook(HashMap<String, Object> HashMap) {
        BookDAO dao = new BookDAO(sqlSession);
        return dao.selectNewBook(HashMap);
    }

    @Override
    public void insertBook(HashMap<String, Object> HashMap) {
        BookDAO dao = new BookDAO(sqlSession);
        Integer isbn = dao.selectBookIsbn(HashMap);
        if(isbn != null){
        }else{
            dao.insertBook(HashMap);
        }
        dao.insertCustomerBook(HashMap);
    }

    @Override
    public List<HashMap<String, Object>> selectCustomerBook(HashMap<String, Object> HashMap) {
        BookDAO dao = new BookDAO(sqlSession);
        return dao.selectCustomerBook(HashMap);
    }

    @Override
    public List<HashMap<String, Object>> selectCurrentBook(HashMap<String, Object> HashMap) {
        BookDAO dao = new BookDAO(sqlSession);
        return dao.selectCurrentBook(HashMap);
    }

    @Override
    public void deleteCustomerBook(HashMap<String, Object> HashMap) {
        BookDAO dao = new BookDAO(sqlSession);
        dao.deleteCustomerBook(HashMap);
    }
}
