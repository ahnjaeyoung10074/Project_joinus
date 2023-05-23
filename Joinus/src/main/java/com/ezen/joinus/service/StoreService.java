package com.ezen.joinus.service;

import com.ezen.joinus.vo.StoreVO;

import java.util.List;

public interface StoreService {

    // 가게 테이블에 가게 정보를 삽입
    void registerStore(StoreVO vo);

    // 중복 가게이름 체크
    int s_nameCheck(String s_name);

    // 최대(방금 생성된) sno 가져오기
    int getMaxSno();

    StoreVO getStore(Integer bno);

    void updateStore(StoreVO vo);

    void updateRevenue(int s_revenue, int sno);

    List<StoreVO> selectlocation(String location);

    void deletestore(Integer bno);


}
