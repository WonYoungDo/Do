package com.tawny.shop.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tawny.shop.main.service.PortalService;
import com.tawny.shop.manager.goods.domain.Goods;
import com.tawny.shop.manager.goods.dto.GoodsDetail;
import com.tawny.shop.manager.goods.service.GoodsService;
import com.tawny.shop.order.dto.OrderBestGoodsDetail;
import com.tawny.shop.order.service.OrderService;

@Controller
@RequestMapping("/do")
public class PortalController {
	
	@Autowired
	private PortalService portalService;
	
	
	// 메인 포털 화면
	@GetMapping("/main/portal")
	public String portal(
			Model model
			, @RequestParam(value="keyword", required=false) String keyword
			, @RequestParam(value="category", required=false) String category) {
		
		bestGoodsModel(model);
		List<GoodsDetail> goodsList;
		
		// 검색한 상품만 보여주기
		if(keyword != null && !keyword.isEmpty()) { 
			goodsList = portalService.getGoodsSearch(keyword);
			model.addAttribute("goodsList", goodsList);
			
		// 카테고리 별 상품 보여주기	
		} else if (category != null && !category.isEmpty()) { 
			goodsList = portalService.getGoodsListByCategory(category);
			model.addAttribute("goodsList", goodsList);
		
		// 전체 상품 보여주기
		} else { 
			goodsList = portalService.getGoodsList();
			model.addAttribute("goodsList", goodsList);
		}
		return "main/portal";
	}
	
	// 베스트 상품 보여주기 
	public void bestGoodsModel(Model model) {
		List<OrderBestGoodsDetail> bestGoodsList = portalService.getBestGoodsList(2);
		OrderBestGoodsDetail bestGoods1 = bestGoodsList.get(0);
		OrderBestGoodsDetail bestGoods2 = bestGoodsList.get(1);
		
		model.addAttribute("bestGoods1", bestGoods1);
		model.addAttribute("bestGoods2", bestGoods2);
	}
	
	
	// 개별 상품 정보
	@GetMapping("/main/goodsInfo/{id}")
	public String goodsInfo(@PathVariable("id") int id, Model model) {
		Goods goods = portalService.getGoods(id);
		model.addAttribute("goods", goods);
		return "goods/goodsInfo";
	}
	
	// 회원가입 화면
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
	
	// 로그인 화면
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	// 아이디 찾기 화면
	@GetMapping("/find/id")
	public String findId() {
		return "member/findId";
	}
	
	// 비밀번호 찾기 화면
	@GetMapping("/find/pw")
	public String findPw() {
		return "member/findPw";
	}
	

	
}
