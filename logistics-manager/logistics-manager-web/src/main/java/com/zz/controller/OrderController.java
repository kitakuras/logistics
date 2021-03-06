package com.zz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zz.dto.OrderDto;
import com.zz.service.IOrderService;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Autowired
	private IOrderService orderService;
	
	@RequestMapping("/goAddOrUpdate")
	public String goAddOrUpdate(Model m,Integer orderId){
		orderService.getAddOrUpdateInfo(m, orderId);
		return "order/update_order";
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public String save(@RequestBody OrderDto dto){
		boolean flag = orderService.saveOrder(dto);
		if (flag) {
			return "success";
		} else{
			return "fail";
		}
		
	}
	
}
