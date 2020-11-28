package com.db.project.customer;

import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public void insertCustomer(HashMap<String, Object> HashMap){
        mapper.insertCustomer(HashMap);
    }
    public Integer selectCustomer(HashMap<String, Object> HashMap){
        return mapper.selectCustomer(HashMap);
    }
    public void insertPreference(HashMap<String, Object> HashMap){
        mapper.insertPreference(HashMap);
    }
    public Integer selectCustomerSeq(HashMap<String, Object> HashMap){
        return mapper.selectCustomerSeq(HashMap);
    }
    public HashMap<String, Object> login(HashMap<String, Object> HashMap){
        return mapper.login(HashMap);
    }
    public void updateRentalMembership(HashMap<String, Object> HashMap){
        mapper.updateRentalMembership(HashMap);
    }
    public void updateBurrowMembership(HashMap<String, Object> HashMap){
        mapper.updateBurrowMembership(HashMap);
    }
    public void insertBestRental(HashMap<String, Object> HashMap){
        mapper.insertBestRental(HashMap);
    }
    public void insertBestBorrow(HashMap<String, Object> HashMap){
        mapper.insertBestBorrow(HashMap);
    }
    public void deleteBestRental(){
        mapper.deleteBestRental();
    }
    public void deleteBestBorrow(){
        mapper.deleteBestBorrow();
    }
    public Integer customerSales(HashMap<String,Object> HashMap){
        return mapper.customerSales(HashMap);
    }
}
