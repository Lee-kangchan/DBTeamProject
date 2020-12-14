package com.db.project.book;

import java.util.HashMap;
import java.util.List;

public interface BookMapper {

    public List<HashMap<String, Object>> selectBook();
    public List<HashMap<String, Object>> selectNewBook(HashMap<String, Object> HashMap);
    public List<HashMap<String, Object>> selectMainBook();
    public Integer selectBookIsbn(HashMap<String, Object> HashMap);
    public void insertBook(HashMap<String, Object> HashMap);
    public void insertCustomerBook(HashMap<String, Object> HashMap);
    public Integer selectCustomerBookSeq();
    public void insertCustomerBookImage(HashMap<String, Object> HashMap);
    public List<HashMap<String, Object>> selectCustomerBook(HashMap<String, Object> HashMap);
    public List<HashMap<String, Object>> selectCurrentBook(HashMap<String, Object> HashMap);
    public void deleteCustomerBook(HashMap<String, Object> HashMap);

    public HashMap<String , Object> selectDetailBook(HashMap<String, Object> map);
    public Integer selectBookReservation(HashMap<String, Object> map);
    public void insertBookReservation(HashMap<String, Object> map);

    public HashMap<String, Object> reviewBook(HashMap<String, Object> map);
    public List<HashMap<String , Object>> selectBookImage(HashMap<String, Object> map);
    public void updateCustomerBookCertification(HashMap<String, Object> map );
    public void insertCurrentBook(HashMap<String, Object> map);
    public List<HashMap<String, Object>> selectCurrentMainBook(HashMap<String, Object> map);
    public void updateCustomerBookYn(HashMap<String, Object> map);
    public List<HashMap<String, Object>> reservation(HashMap<String, Object> map);
    public void updateReservation(HashMap<String,Object> map);

}
