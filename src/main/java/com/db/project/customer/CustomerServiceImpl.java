package com.db.project.customer;

import org.apache.ibatis.session.SqlSession;
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
    @Override
    public int selectCustomer(HashMap<String, Object> map) {
        CustomerDAO customerDAO = new CustomerDAO(sqlSession);

        return customerDAO.selectCustomer(map);
    }

    @Override
    @Transactional
    public void insertCustomer(List<HashMap<String, Object>> list) {
        CustomerDAO customerDAO = new CustomerDAO(sqlSession);
        customerDAO.insertCustomer(list.get(0));

        int seq = customerDAO.selectCustomerSeq(list.get(0));

        for (HashMap<String, Object> map : list) {
            customerDAO.insertPreference(map);
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
}
