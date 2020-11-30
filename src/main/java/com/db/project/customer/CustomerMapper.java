package com.db.project.customer;

import java.util.HashMap;
import java.util.List;

public interface CustomerMapper {
    public void insertCustomer(HashMap<String, Object> HashMap);
    public int selectCustomer(HashMap<String, Object> HashMap);
    public void insertPreference(HashMap<String, Object> HashMap);
    public int selectCustomerSeq(HashMap<String, Object> HashMap);
    public HashMap<String, Object> login(HashMap<String, Object> HashMap);
    public List<HashMap<String, Object>> rentalCustomer();
    public List<HashMap<String, Object>> borrowCustomer();
    public void updateRentalMembership(HashMap<String, Object> HashMap);
    public void updateBurrowMembership(HashMap<String, Object> HashMap);
    public void insertBestRental();
    public void insertBestBorrow();
    public void deleteBestRental();
    public void deleteBestBorrow();
    public int customerSales(HashMap<String,Object> HashMap);

}
