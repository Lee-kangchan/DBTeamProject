package com.db.project.customer;

import java.util.HashMap;
import java.util.List;

public interface CustomerMapper {
    public List<HashMap<String, Object>> selectCustomer();
    public void insertCustomer(HashMap<String, Object> HashMap);
    public Integer selectCustomer(HashMap<String, Object> HashMap);
    public void insertPreference(HashMap<String, Object> HashMap);
    public Integer selectCustomerSeq(HashMap<String, Object> HashMap);
    public HashMap<String, Object> login(HashMap<String, Object> HashMap);
    public void updateRentalMembership(HashMap<String, Object> HashMap);
    public void updateBurrowMembership(HashMap<String, Object> HashMap);
    public void insertBestRental(HashMap<String, Object> HashMap);
    public void insertBestBorrow(HashMap<String, Object> HashMap);
    public void deleteBestRental();
    public void deleteBestBorrow();
    public Integer customerSales(HashMap<String,Object> HashMap);

}
