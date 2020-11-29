package com.db.project.review;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    SqlSession sqlSession;
    @Override
    public int selectCustomer(HashMap<String, Object> map) {
        ReviewDAO reviewDAO = new ReviewDAO(sqlSession);

        return reviewDAO.selectCustomer(map);
    }


}
