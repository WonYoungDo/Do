package com.tawny.shop.exception;

public class OutOfStockException extends RuntimeException {
	
	private int remainingStock;
	
	// 재고 알림 메세지
	public OutOfStockException(int remainingStock) {
		super("요청한 수량이 재고보다 많습니다. \n주문가능 수량 : " + remainingStock + "개");
    }
	
	 public int getRemainingStock() {
	        return remainingStock;
    }
}
