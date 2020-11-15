package com.db.project.customer;

import java.util.HashMap;
import java.util.List;

public interface CustomerMapper {
    public List<HashMap<String, Object>> selectCustomer();
}
