package com.tawny.shop.after.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tawny.shop.after.domain.AfterSales;
import com.tawny.shop.after.dto.AfterSalesDetail;
import com.tawny.shop.after.repository.AfterSalesRepository;
import com.tawny.shop.manager.goods.domain.Goods;
import com.tawny.shop.manager.goods.service.GoodsService;
import com.tawny.shop.order.domain.Order;
import com.tawny.shop.order.service.OrderService;
import com.tawny.shop.user.member.domain.User;
import com.tawny.shop.user.member.service.UserService;

@Service
public class AfterSalesService {
	
	@Autowired
	private AfterSalesRepository afterSalesRepository;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private GoodsService goodsService;
	
	@Autowired
	private UserService userService;
	
	// 사용자가 취소/반품한 내용
	public int addAfterSales(
			int userId
			, int goodsId
			, int payId
			, int orderId
			, String cancelReason
			, String deliveryStatus) {
		
	    // 주문 상태 업데이트
		boolean orderCancel = "cancel".equalsIgnoreCase(deliveryStatus);
		boolean orderReturn = "return".equalsIgnoreCase(deliveryStatus);
	    if (orderCancel) {
	    	orderService.addDeliveryStatus(orderId, deliveryStatus);
	    } else if (orderReturn) {
	    	orderService.addDeliveryStatus(orderId, deliveryStatus);
	    }
	    
	    afterSalesRepository.insertAfterSales(userId, goodsId, payId, orderId, cancelReason);
	    
		return 1;
	}
	
	// 취소/반품 리스트 조회
	public List<AfterSalesDetail> getAfterSalesList(int userId, String elapsedTime) {
		
		List<AfterSales> afterSalesList = afterSalesRepository.selectAfterSalesList(userId , elapsedTime);
		List<AfterSalesDetail> afterSalesDetailList = new ArrayList<>();
		
		for(AfterSales afterSales : afterSalesList) {
			Order order = orderService.getOrder(afterSales.getOrderId());
			Goods goods = goodsService.getGoods(afterSales.getGoodsId());
			User user = userService.getUser(afterSales.getUserId());
			
			AfterSalesDetail afterSalesDetail = AfterSalesDetail.builder()
															    .goods(goods)
										                        .order(order)
															    .user(user)
															    .afterSales(afterSales)
															    .build();
			afterSalesDetailList.add(afterSalesDetail);
		}
		
		return afterSalesDetailList;
	}
	
	
}
