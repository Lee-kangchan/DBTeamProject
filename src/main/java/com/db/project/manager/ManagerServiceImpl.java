package com.db.project.manager;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class ManagerServiceImpl implements  ManagerService{
    @Autowired
    SqlSession sqlSession;

    @Override
    public List<HashMap<String, Object>> selectManagerBook() {
        ManagerDAO dao = new ManagerDAO(sqlSession);
        return dao.selectManagerBook();
    }

    @Override
    public List<HashMap<String, Object>> selectManagerPromotion() {
        ManagerDAO dao = new ManagerDAO(sqlSession);
        return dao.selectManagerPromotion();
    }

    @Override
    public List<HashMap<String, Object>> selectManagerCustomerReport() {
        ManagerDAO dao = new ManagerDAO(sqlSession);

        return dao.selectManagerCustomerReport();
    }

    @Override
    public List<HashMap<String, Object>> selectManagerReviewReport() {
        ManagerDAO dao = new ManagerDAO(sqlSession);

        return dao.selectManagerReviewReport();
    }
}
