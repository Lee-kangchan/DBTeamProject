package com.db.project.customer;

import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

public class CustomerDAO {

    CustomerMapper mapper;
    SqlSession sqlSession;

    public CustomerDAO(SqlSession sqlSession){
        this.sqlSession =sqlSession;
        mapper = sqlSession.getMapper(CustomerMapper.class);
    }

    public List<HashMap<String , Object>> selectCustomer(){
        return mapper.selectCustomer();
    }
}
