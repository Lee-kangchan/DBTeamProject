package com.db.project.card;

import java.util.HashMap;
import java.util.List;

public interface CardService {
    public void insertCard(HashMap<String, Object> HashMap);
    public List<HashMap<String, Object>> selectCard(HashMap<String, Object> HashMap);
    public void deleteCard(HashMap<String, Object> HashMap);
    public void updateCustomerPlusPoint(HashMap<String, Object> HashMap);
    public void updateCustomerMinusPoint(HashMap<String, Object> HashMap);
    public List<HashMap<String, Object>> selectApproval(HashMap<String, Object> HashMap);
    public List<HashMap<String, Object>> selectSales(HashMap<String, Object> HashMap);
}
