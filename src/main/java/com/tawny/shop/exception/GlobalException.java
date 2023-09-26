package com.tawny.shop.exception;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

@ControllerAdvice
public class GlobalException {
	
	@ResponseStatus(HttpStatus.BAD_REQUEST)
    @ResponseBody
    @ExceptionHandler(OutOfStockException.class)
    public Map<String, Object> handleOutOfStockException(OutOfStockException e) {
    	Map<String, Object> response = new HashMap<>();
        response.put("message", e.getMessage());
        response.put("remaining_stock", e.getRemainingStock());
        return response;
    }
    
}
