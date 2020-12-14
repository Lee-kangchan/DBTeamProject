package com.db.project.customer;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CustomerServiceImpl implements  CustomerService{

    @Autowired
    SqlSession sqlSession;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public int selectCustomer(HashMap<String, Object> map) {
        CustomerDAO customerDAO = new CustomerDAO(sqlSession);

        return customerDAO.selectCustomer(map);
    }

    @Override
    @Transactional
    public void insertCustomer(HashMap<String, Object> HashMap, List<Integer> list) {
        CustomerDAO customerDAO = new CustomerDAO(sqlSession);

        HashMap.put("recommend_seq", customerDAO.selectCustomerSeq(HashMap));

        customerDAO.insertCustomer(HashMap);

        int seq = customerDAO.selectCustomer(HashMap);
        HashMap.put("customer_seq",seq);
        for (Integer map : list) {
            HashMap.put("category_seq",map);
            customerDAO.insertPreference(HashMap);
        }
    }

    @Override
    public HashMap<String, Object> login(HashMap<String, Object> HashMap) {
        CustomerDAO customerDAO = new CustomerDAO(sqlSession);
        HashMap<String,Object> result = customerDAO.login(HashMap);
        return result;
    }

    @Override
    @Transactional
    public void Membership(HashMap<String, Object> HashMap) {
        CustomerDAO customerDAO = new CustomerDAO(sqlSession);
        customerDAO.deleteBestBorrow();
        customerDAO.deleteBestRental();
        List<HashMap<String, Object>> rental = customerDAO.rentalCustomer();
        List<HashMap<String, Object>> borrow = customerDAO.borrowCustomer();
        int size = rental.size();
        int bronze = rental.size()/100 *10;
        int silver = rental.size()/100 * 5;
        int gold = rental.size()/100;

        for(HashMap<String, Object> t : rental){
            t.put("rental_membership_seq", 0);
            customerDAO.updateBurrowMembership(t);
            customerDAO.updateRentalMembership(t);
        }
        int count = 0;
        for(int i = 0 ; i <gold; i++){
            rental.get(count).put("rental_membership_seq",4);
            borrow.get(count).put("borrow_membership_seq",4);
            customerDAO.updateRentalMembership(rental.get(count));
            customerDAO.updateBurrowMembership(borrow.get(count));
            count++;
        }
        for(int i=0 ; i<silver ; i++){
            rental.get(count).put("rental_membership_seq",3);
            borrow.get(count).put("borrow_membership_seq",3);
            customerDAO.updateRentalMembership(rental.get(count));
            customerDAO.updateBurrowMembership(borrow.get(count));
            count++;
        }
        for(int i=0; i<bronze ; i++){
            rental.get(count).put("rental_membership_seq",2);
            borrow.get(count).put("borrow_membership_seq",2);
            customerDAO.updateRentalMembership(rental.get(count));
            customerDAO.updateBurrowMembership(borrow.get(count));
            count++;
        }
        customerDAO.insertBestRental();
        customerDAO.insertBestBorrow();
    }

    @Override
    public int customerSales(HashMap<String, Object> HashMap) {
        CustomerDAO customerDAO = new CustomerDAO(sqlSession);

        return customerDAO.customerSales(HashMap);
    }

    @Override
    public HashMap<String, Object> customerMyPage(HashMap<String, Object> HashMap) {
        CustomerDAO customerDAO = new CustomerDAO(sqlSession);

        HashMap<String, Object> result = customerDAO.customerMembership(HashMap);

        Integer borrowCount = Integer.parseInt(customerDAO.borrowCount(HashMap).toString());
        Integer rentalCount = Integer.parseInt(customerDAO.rentalCount(HashMap).toString());

        HashMap<String, Object> map = customerDAO.recommendCount(HashMap);
        logger.info(HashMap+"");
        logger.info(result+"");
        logger.info(borrowCount+"");
        logger.info(rentalCount+"");
        if (borrowCount!=null){
            result.put("borrowCount", borrowCount);
        }else{

            result.put("borrowCount", 0);
        }
        if(rentalCount!=null){

            result.put("rentalCount", rentalCount);
        }else{

            result.put("rentalCount", 0);
        }
        result.put("customer_point", map.get("customer_point"));
        result.put("recommendCount", map.get("recommendCount"));

        return result;
    }

    @Override
    public void insertBorrowArea(HashMap<String, Object> map) {
        CustomerDAO dao = new CustomerDAO(sqlSession);
        dao.insertBorrowArea(map);
    }

    @Override
    public void deleteBorrowArea() {
        CustomerDAO dao = new CustomerDAO(sqlSession);
        dao.deleteBorrowArea();
    }

    @Override
    public List<HashMap<String, Object>> selectBorrowArea(){
        CustomerDAO dao = new CustomerDAO(sqlSession);
        return dao.selectBorrowArea();
    }
}
