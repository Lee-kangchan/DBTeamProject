package com.db.project.customer;

import java.util.HashMap;
import java.util.List;

public interface CustomerService {
    public void insertCustomer(List<HashMap<String, Object>> list);
    public int selectCustomer(HashMap<String, Object> HashMap);
    public HashMap<String, Object> login(HashMap<String, Object> HashMap);
    public void Membership(HashMap<String, Object> HashMap);
    public int customerSales(HashMap<String,Object> HashMap);
}
