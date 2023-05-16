package com.ezen.joinus.service;

import com.ezen.joinus.mappers.PurchaseMapper;
import com.ezen.joinus.vo.CustomerUserVO;
import com.ezen.joinus.vo.PurchaseVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Log4j
@Service
public class PurchaseServiceImpl implements PurchaseService{
    @Setter(onMethod_=@Autowired)
    PurchaseMapper purchaseMapper;

    @Override
    public void productPurchase(PurchaseVO purchaseVO) {
        System.out.println("구매 서비스 들어오나? : " + purchaseVO);
        purchaseMapper.insertProduct(purchaseVO);
    }

    @Override
    public void updateUserPoint(String u_id, int p_price) {
        System.out.println("포인트 차감 서비스 들어오나? : " + u_id + p_price);
        CustomerUserVO customerUserVO = new CustomerUserVO();
        customerUserVO.setU_id(u_id);
        customerUserVO.setPaypoint(p_price);
        purchaseMapper.updateUserPoint(customerUserVO);
    }

    @Override
    public List<PurchaseVO> getPurchaseInfo(String u_id) {
        System.out.println("구매목록 아이디 찾기 서비스 : " + u_id);
        return purchaseMapper.selectUPurchaseUserId(u_id);
    }


}
