package com.db.project.matching;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class MatchingServiceImpl implements MatchingService {
    @Autowired
    SqlSession sqlSession;

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public void insertMatching(HashMap<String, Object> HashMap) {
        MatchingDAO matchingDAO = new MatchingDAO(sqlSession);
        matchingDAO.insertMatching(HashMap);
    }

    @Override
    public List<HashMap<String, Object>> selectRentalMatching(HashMap<String, Object> HashMap) {
        MatchingDAO matchingDAO = new MatchingDAO(sqlSession);
        return matchingDAO.selectRentalMatching(HashMap);
    }

    @Override
    public List<HashMap<String, Object>> selectBorrowMatching(HashMap<String, Object> HashMap) {
        MatchingDAO matchingDAO = new MatchingDAO(sqlSession);
        return matchingDAO.selectBorrowMatching(HashMap);
    }

    @Override
    public void updateRentalMatching(HashMap<String, Object> HashMap) {
        MatchingDAO matchingDAO = new MatchingDAO(sqlSession);
        matchingDAO.updateRentalMatching(HashMap);
        HashMap<String, Object> map = matchingDAO.selectMatchingState(HashMap);
        if(map.get("matching_borrow_yn").toString().equals("1") && map.get("matching_rental_yn").toString().equals("1")){
            if(map.get("matching_type").equals("거래완료")){
                map.put("matching_type","대여");
                //시간 구하기
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                Date date = new Date();
                Calendar cal = Calendar.getInstance();
                cal.setTime(date);
                cal.add(Calendar.DATE, 7);
                //시간 구했음
                map.put("matching_endAt",df.format(cal.getTime()));
                matchingDAO.updateMatchingDate(map);
            }else if(map.get("matching_type").equals("대여")){
                map.put("matching_type","반납");
            }
            matchingDAO.updateTypeMatching(map);
            matchingDAO.updateMatchingReset(map);
        }
    }

    @Override
    public void updateBorrowMatching(HashMap<String, Object> HashMap) {
        MatchingDAO matchingDAO = new MatchingDAO(sqlSession);

        matchingDAO.updateBorrowMatching(HashMap);
        HashMap<String, Object> map = matchingDAO.selectMatchingState(HashMap);
        if(map.get("matching_borrow_yn").toString().equals("1") && map.get("matching_rental_yn").toString().equals("1")){
            if(map.get("matching_type").equals("거래완료")){
                map.put("matching_type","대여");
                //시간 구하기
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                Date date = new Date();
                Calendar cal = Calendar.getInstance();
                cal.setTime(date);
                cal.add(Calendar.DATE, 7);
                //시간 구했음
                map.put("matching_endAt",df.format(cal.getTime()));
                matchingDAO.updateMatchingDate(map);
            }else if(map.get("matching_type").equals("대여")){
                map.put("matching_type","반납");
            }
            matchingDAO.updateTypeMatching(map);
            matchingDAO.updateMatchingReset(map);
        }

    }

    @Override
    public void updateCancelMatching(HashMap<String, Object> map) {
        MatchingDAO matchingDAO = new MatchingDAO(sqlSession);
        if(map.get("matching_type").toString().equals("거래취소")){
            matchingDAO.updateTypeMatching(map);
        }
    }

    @Override
    public List<HashMap<String, Object>> selectMyReservation(HashMap<String, Object> HashMap) {

        MatchingDAO matchingDAO = new MatchingDAO(sqlSession);

        List<HashMap<String, Object>> res = matchingDAO.selectReservation(HashMap);

        logger.info(res.toString());

        if(res.size() > 0) {
            int seq = (int) res.get(0).get("customer_seq");


            for (int i = 0; i < res.size(); i++) {
                List<HashMap<String, Object>> rank = matchingDAO.selectRank(res.get(i));

                for (int j = 0; j < rank.size(); j++) {
                    if (seq == (int) rank.get(j).get("customer_seq")) {
                        res.get(i).put("rank", rank.get(j).get("rank"));
                        break;
                    }
                }
            }
        }

        logger.info(res.toString());

        return res;
    }
}
