package com.db.project.book;

import java.util.HashMap;
import java.util.List;

public interface BookService {
    public List<HashMap<String, Object>> selectBook();
    public List<HashMap<String, Object>> selectNewBook(HashMap<String, Object> HashMap);
    public void insertBook(HashMap<String, Object> HashMap);
    public List<HashMap<String, Object>> selectCustomerBook(HashMap<String, Object> HashMap);
    public List<HashMap<String, Object>> selectCurrentBook(HashMap<String, Object> HashMap);
    public void deleteCustomerBook(HashMap<String, Object> HashMap);
    public List<HashMap<String, Object>> selectMainBook();
}
