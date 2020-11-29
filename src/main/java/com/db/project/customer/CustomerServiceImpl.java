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
    public int selectCustomer(HashMap<String, Object> map) {
        CustomerDAO customerDAO = new CustomerDAO(sqlSession);

        return customerDAO.selectCustomer(map);
    }


}
