package com.db.project.customer;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CustomerServiceImpl implements  CustomerService{
    @Autowired
    SqlSession sqlSession;

    @Override
    public List<HashMap<String, Object>> selectCustomer() {
        CustomerDAO dao = new CustomerDAO(sqlSession);
        return dao.selectCustomer();
    }
}
