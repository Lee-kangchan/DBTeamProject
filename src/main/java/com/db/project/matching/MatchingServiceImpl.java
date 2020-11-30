package com.db.project.matching;

import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class MatchingServiceImpl implements MatchingService {
    @Override
    public void insertMatching(HashMap<String, Object> HashMap) {

    }

    @Override
    public List<HashMap<String, Object>> selectRentalMatching(HashMap<String, Object> HashMap) {
        return null;
    }

    @Override
    public List<HashMap<String, Object>> selectBorrowMatching(HashMap<String, Object> HashMap) {
        return null;
    }

    @Override
    public void updateRentalMatching(HashMap<String, Object> HashMap) {

    }

    @Override
    public void updateBorrowMatching(HashMap<String, Object> HashMap) {

    }
}
