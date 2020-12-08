package com.db.project.manager;

import java.util.HashMap;
import java.util.List;

public interface ManagerService {

    public List<HashMap<String, Object>> selectManagerBook();
    public List<HashMap<String, Object>> selectManagerPromotion();
    public List<HashMap<String, Object>> selectManagerCustomerReport();
    public List<HashMap<String, Object>> selectManagerReviewReport();
}
